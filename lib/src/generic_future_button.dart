import 'package:flutter/material.dart';

typedef FutureCallback = Future<void> Function();

abstract class GenericFutureButtonWidget extends StatefulWidget {
  final FutureCallback onPressed;

  const GenericFutureButtonWidget({
    Key key,
    @required this.onPressed,
  }) : super(key: key);
}

abstract class GenericFutureButtonState<T extends StatefulWidget>
    extends State<T> {
  bool _isPressed;
}
