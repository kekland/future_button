import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:future_button/src/generic_future_button.dart';

class FutureRaisedButton extends GenericFutureButtonWidget {
  final VoidCallback onLongPress;
  final ValueChanged<bool> onHighlightChanged;
  final MouseCursor mouseCursor;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color disabledColor;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color splashColor;
  final Brightness colorBrightness;
  final double elevation;
  final double focusElevation;
  final double hoverElevation;
  final double highlightElevation;
  final double disabledElevation;
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final MaterialTapTargetSize materialTapTargetSize;

  final Widget icon;

  FutureRaisedButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget child,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
  })  : icon = null,
        super(
          key: key,
          child: child,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          progressIndicatorBuilder: progressIndicatorBuilder,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  FutureRaisedButton.icon({
    Key key,
    @required FutureCallback onPressed,
    @required Widget label,
    @required this.icon,
    Curve animationCurve,
    Duration animationDuration,
    WidgetBuilder progressIndicatorBuilder,
    ProgressIndicatorLocation progressIndicatorLocation,
    this.onLongPress,
    this.onHighlightChanged,
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.disabledColor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.colorBrightness,
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.materialTapTargetSize,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
  }) : super(
          key: key,
          child: label,
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
    if (widget.icon != null) {
      return RaisedButton.icon(
        icon: widget.icon,
        label: child,
        onPressed: isEnabled ? onPressed : null,
        onLongPress: widget.onLongPress,
        onHighlightChanged: widget.onHighlightChanged,
        mouseCursor: widget.mouseCursor,
        textTheme: widget.textTheme,
        textColor: widget.textColor,
        disabledTextColor: widget.disabledTextColor,
        color: widget.color,
        disabledColor: widget.disabledColor,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        highlightColor: widget.highlightColor,
        splashColor: widget.splashColor,
        colorBrightness: widget.colorBrightness,
        elevation: widget.elevation,
        highlightElevation: widget.highlightElevation,
        disabledElevation: widget.disabledElevation,
        padding: widget.padding,
        shape: widget.shape,
        focusNode: widget.focusNode,
        materialTapTargetSize: widget.materialTapTargetSize,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        animationDuration: widget.animationDuration,
      );
    }

    return RaisedButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
      onLongPress: widget.onLongPress,
      onHighlightChanged: widget.onHighlightChanged,
      mouseCursor: widget.mouseCursor,
      textTheme: widget.textTheme,
      textColor: widget.textColor,
      disabledTextColor: widget.disabledTextColor,
      color: widget.color,
      disabledColor: widget.disabledColor,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      colorBrightness: widget.colorBrightness,
      elevation: widget.elevation,
      focusElevation: widget.focusElevation,
      hoverElevation: widget.hoverElevation,
      highlightElevation: widget.highlightElevation,
      disabledElevation: widget.disabledElevation,
      padding: widget.padding,
      visualDensity: widget.visualDensity,
      shape: widget.shape,
      focusNode: widget.focusNode,
      materialTapTargetSize: widget.materialTapTargetSize,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      animationDuration: widget.animationDuration,
    );
  }
}
