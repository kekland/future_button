import 'package:flutter/cupertino.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureCupertinoButton extends GenericFutureButtonWidget {
  FutureCupertinoButton({
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
          progressIndicatorBuilder: progressIndicatorBuilder ??
              defaultCupertinoProgressIndicatorBuilder,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  @override
  _FutureCupertinoButtonState createState() => _FutureCupertinoButtonState();
}

class _FutureCupertinoButtonState
    extends GenericFutureButtonState<FutureCupertinoButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    return CupertinoButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
    );
  }
}
