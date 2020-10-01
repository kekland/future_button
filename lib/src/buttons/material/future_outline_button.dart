import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureOutlineButton extends GenericFutureButtonWidget {
  FutureOutlineButton({
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
  _FutureOutlineButtonState createState() => _FutureOutlineButtonState();
}

class _FutureOutlineButtonState
    extends GenericFutureButtonState<FutureOutlineButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return OutlineButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
