import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureRaisedButton extends GenericFutureButtonWidget {
  FutureRaisedButton({
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
  _FutureRaisedButtonState createState() => _FutureRaisedButtonState();
}

class _FutureRaisedButtonState
    extends GenericFutureButtonState<FutureRaisedButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return RaisedButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
