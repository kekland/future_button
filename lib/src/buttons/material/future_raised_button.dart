import 'package:flutter/material.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureRaisedButton extends StatefulWidget {
  final Widget child;
  final FutureCallback onPressed;

  FutureRaisedButton({
    Key key,
    @required this.onPressed,
    @required this.child,
  }) : super(key: key);

  @override
  _FutureRaisedButtonState createState() => _FutureRaisedButtonState();
}

class _FutureRaisedButtonState extends State<FutureRaisedButton>
    with SingleTickerProviderStateMixin {
  bool _loading = false;

  void _onPressed() async {
    setState(() {
      _loading = true;
    });

    await widget.onPressed();

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: AnimatedSize(
        vsync: this,
        duration: Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        alignment: Alignment.centerRight,
        child: _loading
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: CircularProgressIndicator(strokeWidth: 2.0),
                  ),
                  SizedBox(width: 8.0),
                  widget.child,
                ],
              )
            : widget.child,
      ),
      onPressed: !_loading ? _onPressed : null,
    );
  }
}
