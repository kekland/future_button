import 'package:flutter/cupertino.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureCupertinoButton extends GenericFutureButtonWidget {
  final Widget child;

  FutureCupertinoButton({
    Key key,
    @required FutureCallback onPressed,
    @required this.child,
    WidgetBuilder progressIndicatorBuilder,
    bool hideChild = false,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          progressIndicatorBuilder: progressIndicatorBuilder ??
              defaultCupertinoProgressIndicatorBuilder,
          hideChild: hideChild,
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
