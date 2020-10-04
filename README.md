# future_button
[![Coverage Status](https://coveralls.io/repos/github/kekland/future_button/badge.svg?branch=master)](https://coveralls.io/github/kekland/future_button?branch=master)
![Build status](https://img.shields.io/github/workflow/status/kekland/future_button/Test)
![Pub version](https://img.shields.io/pub/v/future_button)

Customizable Material and Cupertino buttons with progress indicators and more.

Useful if you want to run some background tasks when user presses on the button, and then show the result of the task.

![Demonstration](https://github.com/kekland/future_button/blob/master/images/future_button.gif)

## How to use it

Usage is extremely simple - right now 5 types of buttons are supported:

- `CupertinoButton` (normal + filled)
- `FlatButton` (normal + icon)
- `IconButton`
- `OutlineButton` (normal + icon)
- `RaisedButton` (normal + icon)

To convert a button to a `FutureButton`, just add a `Future` prefix and make sure that your `onPressed` callback is of type `Future<void> Function()`, instead of usual `void Function()`.

Everything that the package does can be customized. Below is the list of all parameters:

```dart
/// The widget that's used as the progress indicator.
/// You can substitute it with your own progress indicator if necessary.
/// See [defaultMaterialProgressIndicatorBuilder] and[defaultCupertinoProgressIndicatorBuilder] for more info.
final WidgetBuilder progressIndicatorBuilder;

/// The location of progress indicator.
/// See [ProgressIndicatorLocation] for more info.
final ProgressIndicatorLocation progressIndicatorLocation;

/// Whether to show the result of the Future.
/// Will show [successIndicatorBuilder] if Future completes without errors.
/// Otherwise, will show [failureIndicatorBuilder].
final bool showResult;

/// Whether to animate the transitions using [AnimatedSwitcher].
/// Defaults to [true].
final bool animateTransitions;

/// Indicator to show when the Future is completed successfully.
/// Defaults to [defaultSuccessResultIndicatorBuilder].
final WidgetBuilder successIndicatorBuilder;

/// Indicator to show when the Future fails.
/// Defaults to [defaultFailureResultIndicatorBuilder].
final WidgetBuilder failureIndicatorBuilder;

/// For how long should the result be shown for.
/// Default to `Duration(seconds: 2)`.
final Duration resultIndicatorDuration;

/// Curve that's used to animate the button size.
/// Defaults to [Curves.easeInOut].
final Curve animationCurve;

/// Duration that's used to animate the button size.
/// Defaults to `Duration(milliseconds: 150)`.
final Duration animationDuration;
```

## Example

```dart
FutureRaisedButton.icon(
  icon: Icon(Icons.star),
  label: Text('Star'),
  onPressed: () async {
    // Do some background task
    await Future.delayed(Duration(seconds: 5));
  },
);
```

See `example` project for more details.

## Getting Started

### Depend on it

Add this to your package's pubspec.yaml file:

```
dependencies:
  future_button: ^0.1.1
```

### Install it

You can install packages from the command line:

```bash
$ flutter pub get
```

### Import it

Now in your Dart code, you can use:

```dart
import 'package:future_button/future_button.dart';
```

## Contact me

**E-mail**: `kk.erzhan@gmail.com`