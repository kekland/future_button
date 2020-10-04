import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:future_button/src/generic_future_button.dart';

/// A Future version of the material [IconButton].
/// See [IconButton] for parameter descriptions.
class FutureIconButton extends GenericFutureButtonWidget {
  final double iconSize;
  final VisualDensity visualDensity;
  final EdgeInsetsGeometry padding;
  final AlignmentGeometry alignment;
  final double splashRadius;
  final Color focusColor;
  final Color hoverColor;
  final Color color;
  final Color splashColor;
  final Color highlightColor;
  final Color disabledColor;
  final MouseCursor mouseCursor;
  final FocusNode focusNode;
  final bool autofocus;
  final String tooltip;
  final bool enableFeedback;
  final BoxConstraints constraints;

  /// Default [FutureIconButton] constructor.
  /// See [IconButton] for more info.
  FutureIconButton({
    Key key,
    @required FutureCallback onPressed,
    @required Widget icon,
    Curve animationCurve,
    Duration animationDuration,
    bool showResult = false,
    WidgetBuilder progressIndicatorBuilder,
    WidgetBuilder successIndicatorBuilder,
    WidgetBuilder failureIndicatorBuilder,
    Duration resultIndicatorDuration,
    this.iconSize = 24.0,
    this.visualDensity,
    this.padding = const EdgeInsets.all(8.0),
    this.alignment = Alignment.center,
    this.splashRadius,
    this.color,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.splashColor,
    this.disabledColor,
    this.mouseCursor = SystemMouseCursors.click,
    this.focusNode,
    this.autofocus = false,
    this.tooltip,
    this.enableFeedback = true,
    this.constraints,
  }) : super(
          key: key,
          child: icon,
          onPressed: onPressed,
          animationCurve: animationCurve,
          animationDuration: animationDuration,
          showResult: showResult,
          progressIndicatorBuilder: progressIndicatorBuilder,
          successIndicatorBuilder: successIndicatorBuilder,
          failureIndicatorBuilder: failureIndicatorBuilder,
          resultIndicatorDuration: resultIndicatorDuration,
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
      iconSize: widget.iconSize,
      visualDensity: widget.visualDensity,
      padding: widget.padding,
      alignment: widget.alignment,
      splashRadius: widget.splashRadius,
      color: widget.color,
      focusColor: widget.focusColor,
      hoverColor: widget.hoverColor,
      highlightColor: widget.highlightColor,
      splashColor: widget.splashColor,
      disabledColor: widget.disabledColor,
      mouseCursor: widget.mouseCursor,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      tooltip: widget.tooltip,
      enableFeedback: widget.enableFeedback,
      constraints: widget.constraints,
    );
  }
}
