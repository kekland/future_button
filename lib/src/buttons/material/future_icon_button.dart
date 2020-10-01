import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureIconButton extends GenericFutureButtonWidget {
  FutureIconButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget icon,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
  }) : super(
          key: key,
          child: icon,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          progressIndicatorBuilder: progressIndicatorBuilder,
          progressIndicatorLocation: ProgressIndicatorLocation.center,
        );

  @override
  _FutureIconButtonState createState() => _FutureIconButtonState();
}

class _FutureIconButtonState
    extends GenericFutureButtonState<FutureIconButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return IconButton(
      icon: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
