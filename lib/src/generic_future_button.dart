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
          child: Cupertino.CupertinoActivityIndicator(radius: 16.0),
        );

abstract class GenericFutureButtonWidget extends StatefulWidget {
  final FutureCallback onPressed;
  final WidgetBuilder progressIndicatorBuilder;
  final Widget child;
  final bool hideChild;

  final Curve animationCurve;
  final Duration animationDuration;
  final Alignment animationAlignment;

  const GenericFutureButtonWidget({
    Key key,
    @required this.onPressed,
    @required this.child,
    this.progressIndicatorBuilder,
    this.hideChild = false,
    this.animationCurve = Curves.easeInOut,
    this.animationDuration = const Duration(milliseconds: 150),
    this.animationAlignment = Alignment.centerRight,
  }) : super(key: key);
}

abstract class GenericFutureButtonState<T extends GenericFutureButtonWidget>
    extends State<T> with SingleTickerProviderStateMixin {
  bool _isLoading;

  bool get isLoading => _isLoading;
  bool get isEnabled => !isLoading && widget.onPressed != null;

  WidgetBuilder get progressIndicatorBuilder =>
      widget.progressIndicatorBuilder ??
      defaultMaterialProgressIndicatorBuilder;

  Widget get child {
    if (!isLoading) {
      return widget.child;
    } else if (!widget.hideChild) {
      return Row(
        children: [
          progressIndicatorBuilder(context),
          SizedBox(width: 8.0),
          widget.child,
        ],
      );
    } else {
      return progressIndicatorBuilder(context);
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
        alignment: widget.animationAlignment,
        child: child,
      ),
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
