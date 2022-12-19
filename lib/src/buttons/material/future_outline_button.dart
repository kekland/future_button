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
    bool animateTransitions = true,
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
          animateTransitions: animateTransitions,
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
    bool animateTransitions = true,
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
          animateTransitions: animateTransitions,
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
      return OutlinedButton.icon(
        icon: widget.icon,
        label: child,
        onPressed: isEnabled ? onPressed : null,
        onLongPress: widget.onLongPress,
        style: ElevatedButton.styleFrom(
          //textTheme: widget.textTheme,
          // highlightColor: widget.highlightColor,
          primary: widget.color,
          onPrimary: widget.textColor,
          padding: widget.padding,
          visualDensity: widget.visualDensity,
          shape: widget.shape,
          enabledMouseCursor: widget.mouseCursor,
          disabledMouseCursor: widget.mouseCursor,
        ).copyWith(
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                final color = states.contains(MaterialState.pressed)
                    ? widget.highlightedBorderColor
                    : states.contains(MaterialState.disabled)
                        ? widget.disabledBorderColor
                        : null;

                return widget.borderSide.copyWith(
                  color: color,
                );
              }
              return null; // Defer to the widget's default.
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return widget.highlightElevation;
            }
            return null;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused)) {
                return widget.focusColor;
              }
              if (states.contains(MaterialState.hovered)) {
                return widget.hoverColor;
              }
              if (states.contains(MaterialState.pressed)) {
                return widget.splashColor;
              }
              return null; // Defer to the widget's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return widget.disabledTextColor;
              }
              return null; // Defer to the widget's default.
            },
          ),
        ),
        focusNode: widget.focusNode,
        autofocus: widget.autofocus,
        clipBehavior: widget.clipBehavior,
      );
    }

    return OutlinedButton(
      child: child,
      onPressed: isEnabled ? onPressed : null,
      onLongPress: widget.onLongPress,
      style: ElevatedButton.styleFrom(
        //textTheme: widget.textTheme,
        // highlightColor: widget.highlightColor,
        primary: widget.color,
        onPrimary: widget.textColor,
        padding: widget.padding,
        visualDensity: widget.visualDensity,
        shape: widget.shape,
        enabledMouseCursor: widget.mouseCursor,
        disabledMouseCursor: widget.mouseCursor,
      ).copyWith(
        side: MaterialStateProperty.resolveWith<BorderSide>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              final color = states.contains(MaterialState.pressed)
                  ? widget.highlightedBorderColor
                  : states.contains(MaterialState.pressed)
                      ? widget.disabledBorderColor
                      : null;

              return widget.borderSide.copyWith(
                color: color,
              );
            }
            return null; // Defer to the widget's default.
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.pressed)) {
            return widget.highlightElevation;
          }
          return null;
        }),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) {
              return widget.focusColor;
            }
            if (states.contains(MaterialState.hovered)) {
              return widget.hoverColor;
            }
            if (states.contains(MaterialState.pressed)) {
              return widget.splashColor;
            }
            return null; // Defer to the widget's default.
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return widget.disabledTextColor;
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      clipBehavior: widget.clipBehavior,
    );
  }
}
