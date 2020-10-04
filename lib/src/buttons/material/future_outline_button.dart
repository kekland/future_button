import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:future_button/src/generic_future_button.dart';

/// A Future version of the material [OutlineButton].
/// See [OutlineButton] for parameter descriptions.
class FutureOutlineButton extends GenericFutureButtonWidget {
  final Widget icon;
  final VoidCallback onLongPress;
  final MouseCursor mouseCursor;
  final ButtonTextTheme textTheme;
  final Color textColor;
  final Color disabledTextColor;
  final Color color;
  final Color focusColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color splashColor;
  final double highlightElevation;
  final BorderSide borderSide;
  final Color disabledBorderColor;
  final Color highlightedBorderColor;
  final EdgeInsetsGeometry padding;
  final VisualDensity visualDensity;
  final ShapeBorder shape;
  final Clip clipBehavior;
  final FocusNode focusNode;
  final bool autofocus;

  /// Default [FutureOutlineButton] constructor.
  /// If you want to add an icon, see [FutureOutlineButton.icon].
  /// See [OutlineButton] for more info.
  FutureOutlineButton({
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
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.highlightElevation,
    this.borderSide,
    this.disabledBorderColor,
    this.highlightedBorderColor,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
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

  /// A [FutureOutlineButton] with an icon.
  /// See [OutlineButton.icon] for more info.
  FutureOutlineButton.icon({
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
    this.mouseCursor,
    this.textTheme,
    this.textColor,
    this.disabledTextColor,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.highlightElevation,
    this.borderSide,
    this.disabledBorderColor,
    this.highlightedBorderColor,
    this.padding,
    this.visualDensity,
    this.shape,
    this.focusNode,
    this.clipBehavior = Clip.none,
    this.autofocus = false,
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
    if (widget.icon != null) {
      return OutlineButton.icon(
        icon: widget.icon,
        label: child,
        onPressed: isEnabled ? onPressed : null,
        onLongPress: widget.onLongPress,
        mouseCursor: widget.mouseCursor,
        textTheme: widget.textTheme,
        textColor: widget.textColor,
        disabledTextColor: widget.disabledTextColor,
        color: widget.color,
        focusColor: widget.focusColor,
        hoverColor: widget.hoverColor,
        highlightColor: widget.highlightColor,
        splashColor: widget.splashColor,
        highlightElevation: widget.highlightElevation,
        padding: widget.padding,
        visualDensity: widget.visualDensity,
        shape: widget.shape,
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
        borderSide: widget.borderSide,
        disabledBorderColor: widget.disabledBorderColor,
        highlightedBorderColor: widget.highlightedBorderColor,
      );
    }

    return OutlineButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
      onLongPress: widget.onLongPress,
      mouseCursor: widget.mouseCursor,
      textTheme: widget.textTheme,
      textColor: widget.textColor,
      disabledTextColor: widget.disabledTextColor,
      color: widget.color,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      highlightElevation: widget.highlightElevation,
      padding: widget.padding,
      visualDensity: widget.visualDensity,
      shape: widget.shape,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
      borderSide: widget.borderSide,
      disabledBorderColor: widget.disabledBorderColor,
      highlightedBorderColor: widget.highlightedBorderColor,
    );
  }
}
