import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureIconButton extends GenericFutureButtonWidget {
  final Widget child;

  FutureIconButton({
    Key key,
    @required FutureCallback onPressed,
    @required this.child,
    WidgetBuilder progressIndicatorBuilder,
  }) : super(
          key: key,
          child: child,
          onPressed: onPressed,
          progressIndicatorBuilder: progressIndicatorBuilder,
          hideChild: true,
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
