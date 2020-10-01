import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureFlatButton extends GenericFutureButtonWidget {
  final Widget child;

  FutureFlatButton({
    Key key,
    @required FutureCallback onPressed,
    @required this.child,
    WidgetBuilder progressIndicatorBuilder,
    bool hideChild = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          progressIndicatorBuilder: progressIndicatorBuilder,
          hideChild: hideChild,
        );

  @override
  _FutureFlatButtonState createState() => _FutureFlatButtonState();
}

class _FutureFlatButtonState
    extends GenericFutureButtonState<FutureFlatButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return FlatButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
