import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureOutlineButton extends GenericFutureButtonWidget {
  final Widget child;

  FutureOutlineButton({
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
