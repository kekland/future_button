import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:future_button/src/generic_future_button.dart';

/// A Future version of the material [FlatButton].
/// See [FlatButton] for parameter descriptions.
class FutureFlatButton extends GenericFutureButtonWidget {
  final Widget icon;
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
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;
  final MaterialTapTargetSize materialTapTargetSize;

  /// Default [FutureFlatButton] constructor.
  /// If you want to add an icon, see [FutureFlatButton.icon].
  /// See [FlatButton] for more info.
  FutureFlatButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget child,
    Curve animationCurve,
    Duration animationDuration,
    bool showResult = false,
    WidgetBuilder progressIndicatorBuilder,
    WidgetBuilder successIndicatorBuilder,
    WidgetBuilder failureIndicatorBuilder,
    Duration resultIndicatorDuration,
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
    this.padding,
    this.visualDensity,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
  })  : icon = null,
        super(
          key: key,
          child: child,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          showResult: showResult,
          progressIndicatorBuilder: progressIndicatorBuilder,
          successIndicatorBuilder: successIndicatorBuilder,
          failureIndicatorBuilder: failureIndicatorBuilder,
          resultIndicatorDuration: resultIndicatorDuration,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  /// A [FutureFlatButton] with an icon.
  /// See [FlatButton.icon] for more info.
  FutureFlatButton.icon({
    Key key,
    @required FutureCallback onPressed,
    @required Widget label,
    @required this.icon,
    Curve animationCurve,
    Duration animationDuration,
    bool showResult = false,
    WidgetBuilder progressIndicatorBuilder,
    WidgetBuilder successIndicatorBuilder,
    WidgetBuilder failureIndicatorBuilder,
    Duration resultIndicatorDuration,
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
    this.padding,
    this.visualDensity,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
  }) : super(
          key: key,
          child: label,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          showResult: showResult,
          progressIndicatorBuilder: progressIndicatorBuilder,
          successIndicatorBuilder: successIndicatorBuilder,
          failureIndicatorBuilder: failureIndicatorBuilder,
          resultIndicatorDuration: resultIndicatorDuration,
          progressIndicatorLocation: progressIndicatorLocation,
        );

  @override
  _FutureFlatButtonState createState() => _FutureFlatButtonState();
}

class _FutureFlatButtonState
    extends GenericFutureButtonState<FutureFlatButton> {
  @override
  Widget buildButton({
    BuildContext context,
    Widget child,
    VoidCallback onPressed,
  }) {
    if (widget.icon != null) {
      return FlatButton.icon(
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
        padding: widget.padding,
        shape: widget.shape,
        focusNode: widget.focusNode,
        materialTapTargetSize: widget.materialTapTargetSize,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
      );
    }

    return FlatButton(
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
      padding: widget.padding,
      visualDensity: widget.visualDensity,
      shape: widget.shape,
      focusNode: widget.focusNode,
      materialTapTargetSize: widget.materialTapTargetSize,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
    );
  }
}
