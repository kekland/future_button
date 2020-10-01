import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureFlatButton extends GenericFutureButtonWidget {
  FutureFlatButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget child,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          progressIndicatorBuilder: progressIndicatorBuilder,
          progressIndicatorLocation: progressIndicatorLocation,
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
