import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter/cupertino.dart' as cupertino;

/// An `onPressed` function type for [GenericFutureButtonWidget].
/// It's different from default [VoidCallback] in a sense that the action of the widget is asynchronous.
typedef FutureCallback = Future<void> Function();

/// A default Material progress indicator. It uses [Material.CircularProgressIndicator].
/// It's used by default in [FutureFlatButton], [FutureIconButton], [FutureOutlineButton] and [FutureRaisedButton].
final WidgetBuilder defaultMaterialProgressIndicatorBuilder =
    (context) => SizedBox(
          width: 20.0,
          height: 20.0,
          child: material.CircularProgressIndicator(strokeWidth: 2.0),
        );

/// A default Cupertino progress indicator. It uses [Cupertino.CupertinoActivityIndicator].
/// It's used by default in [FutureCupertinoButton].
final WidgetBuilder defaultCupertinoProgressIndicatorBuilder =
    (context) => SizedBox(
          width: 20.0,
          height: 20.0,
          child: cupertino.CupertinoActivityIndicator(radius: 8.0),
        );

/// The location of the progress indicator.
/// [left] and [right] means that the progress indicator will be on the left or on the right, respectively.
/// [center] means that the progress indicator will be centered and will hide [child].
enum ProgressIndicatorLocation {
  left,
  center,
  right,
}

/// A generic class for all Future buttons.
/// See [FutureRaisedButton] or any FutureButton for info on how to create your own Future button.
/// [onPressed] - method that will be ran when user presses on the button.
/// [progressIndicatorBuilder] - a builder for the progress indicator. [defaultMaterialProgressIndicatorBuilder] by default.
/// [child] - the child of the button. Usually a [Text] widget.
/// [progressIndicatorLocation] - where the progress indicator will be located. See [ProgressIndicatorLocation] for more info.
/// [animationCurve] - the curve that's used when animating the size of the widget. Default is [Curves.easeInOut].
/// [animationDuration] - how long does the size animation take. Default is `Duration(milliseconds: 150)`.
abstract class GenericFutureButtonWidget extends StatefulWidget {
  /// A callback of type `Future<void> Function()`. This will be ran when user presses on the button.
  /// If the future is in progress, the loading indicator will be displayed.
  /// When the future completes (regardless if successful or not), the loading indicator will dissapear.
  final FutureCallback onPressed;

  /// The widget that's used as the progress indicator.
  /// You can substitute it with your own progress indicator if necessary.
  /// See [defaultMaterialProgressIndicatorBuilder] and [defaultCupertinoProgressIndicatorBuilder] for more info.
  final WidgetBuilder progressIndicatorBuilder;

  /// The child of the widget. Usually a [Text] widget.
  /// It will be hidden if [progressIndicatorLocation] is [ProgressIndicatorLocation.center] and future is in progress.
  final Widget child;

  /// The location of progress indicator.
  /// See [ProgressIndicatorLocation] for more info.
  final ProgressIndicatorLocation progressIndicatorLocation;

  /// Curve that's used to animate the button size.
  /// Defaults to [Curves.easeInOut].
  final Curve animationCurve;

  /// Duration that's used to animate the button size.
  /// Defaults to `Duration(milliseconds: 150)`.
  final Duration animationDuration;

  const GenericFutureButtonWidget({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    Curve animationCurve,
    Duration animationDuration,
  })  : progressIndicatorLocation =
            progressIndicatorLocation ?? ProgressIndicatorLocation.left,
        animationDuration =
            animationDuration ?? const Duration(milliseconds: 150),
        animationCurve = animationCurve ?? Curves.easeInOut,
        super(key: key);
}

/// This is the state of the [GenericFutureButtonWidget].
/// If you want to implement your own Future button, take a look at [FutureRaisedButton] or other buttons.
abstract class GenericFutureButtonState<T extends GenericFutureButtonWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  /// Whether the future is in progress.
  bool get isLoading => _isLoading;

  /// Whether the button can be pressed.
  bool get isEnabled => !isLoading && widget.onPressed != null;

  /// The builder for the progress indicator.
  /// If none is passed, uses [defaultMaterialProgressIndicatorBuilder].
  WidgetBuilder get progressIndicatorBuilder =>
      widget.progressIndicatorBuilder ??
      defaultMaterialProgressIndicatorBuilder;

  /// [TextDirection] is used to indicate the order of the widgets in the button.
  /// If [widget.progressIndicatorLocation] is [ProgressIndicatorLocation.left], the order is normal.
  /// Otherwise, the order is reversed.
  TextDirection get textDirection {
    switch (widget.progressIndicatorLocation) {
      case ProgressIndicatorLocation.left:
        return TextDirection.ltr;
      case ProgressIndicatorLocation.right:
        return TextDirection.rtl;
      default:
        return null;
    }
  }

  /// Aligning the animation correctly is important.
  /// Here the animation must be aligned to the opposite side of the progress indicator so that the text doesn't get cut off.
  Alignment get animationAlignment {
    switch (widget.progressIndicatorLocation) {
      case ProgressIndicatorLocation.left:
        return Alignment.centerRight;
      case ProgressIndicatorLocation.center:
        return Alignment.center;
      case ProgressIndicatorLocation.right:
        return Alignment.centerLeft;
      default:
        return null;
    }
  }

  /// The body of the button.
  /// If the future is completed or not running, the body is [widget.child].
  /// If the future is running and [widget.progressIndicatorLocation] is [ProgressIndicatorLocation.center], it'll display the progress indicator only.
  /// If the future is running and [widget.progressIndicatorLocation] is not [ProgressIndicatorLocation.center], it'll display the progress indicator and the child. The order depends on [textDirection].
  Widget get child {
    if (!isLoading) {
      return widget.child;
    } else if (widget.progressIndicatorLocation ==
        ProgressIndicatorLocation.center) {
      return progressIndicatorBuilder(context);
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: textDirection,
        children: [
          progressIndicatorBuilder(context),
          SizedBox(width: 8.0),
          widget.child,
        ],
      );
    }
  }

  /// The `onPressed` callback wrapper.
  /// It awaits for the future to be finished.
  Future<void> onPressed() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed();
    } catch (e) {
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  /// This is an abstract function that's dependent on the button type.
  /// See [FutureRaisedButton] or other buttons for implementation details.
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return buildButton(
      context: context,
      child: AnimatedSize(
        vsync: this,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
        alignment: animationAlignment,
        child: child,
      ),
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
