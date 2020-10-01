import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart' as Material;
import 'package:flutter/cupertino.dart' as Cupertino;

typedef FutureCallback = Future<void> Function();

final WidgetBuilder defaultMaterialProgressIndicatorBuilder =
    (context) => SizedBox(
          width: 20.0,
          height: 20.0,
          child: Material.CircularProgressIndicator(strokeWidth: 2.0),
        );

final WidgetBuilder defaultCupertinoProgressIndicatorBuilder =
    (context) => SizedBox(
          width: 20.0,
          height: 20.0,
          child: Cupertino.CupertinoActivityIndicator(radius: 8.0),
        );

enum ProgressIndicatorLocation {
  left,
  center,
  right,
}

abstract class GenericFutureButtonWidget extends StatefulWidget {
  final FutureCallback onPressed;
  final WidgetBuilder progressIndicatorBuilder;
  final Widget child;
  final ProgressIndicatorLocation progressIndicatorLocation;

  final Curve animationCurve;
  final Duration animationDuration;

  const GenericFutureButtonWidget({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    Curve animationCurve,
    Duration animationDuration,
  })  : this.progressIndicatorLocation =
            progressIndicatorLocation ?? ProgressIndicatorLocation.left,
        this.animationDuration =
            animationDuration ?? const Duration(milliseconds: 150),
        this.animationCurve = animationCurve ?? Curves.easeInOut,
        super(key: key);
}

abstract class GenericFutureButtonState<T extends GenericFutureButtonWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool get isEnabled => !isLoading && widget.onPressed != null;

  WidgetBuilder get progressIndicatorBuilder =>
      widget.progressIndicatorBuilder ??
      defaultMaterialProgressIndicatorBuilder;

  VerticalDirection get verticalDirection {
    switch (widget.progressIndicatorLocation) {
      case ProgressIndicatorLocation.left:
        return VerticalDirection.up;
      case ProgressIndicatorLocation.right:
        return VerticalDirection.down;
      default:
        return null;
    }
  }

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

  Widget get child {
    if (!isLoading) {
      return widget.child;
    } else if (widget.progressIndicatorLocation ==
        ProgressIndicatorLocation.center) {
      return progressIndicatorBuilder(context);
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        verticalDirection: verticalDirection,
        children: [
          progressIndicatorBuilder(context),
          SizedBox(width: 8.0),
          widget.child,
        ],
      );
    }
  }

  Future<void> onPressed() async {
    setState(() {
      _isLoading = true;
    });

    await widget.onPressed();

    setState(() {
      _isLoading = false;
    });
  }

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
