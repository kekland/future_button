# future_button

![Build status](https://img.shields.io/github/workflow/status/kekland/future_button/Test)
![Pub version](https://img.shields.io/pub/v/future_button)

Customizable Material and Cupertino buttons with progress indicators.

Useful if you want to run some background tasks when user presses on the button.

![Demonstration](https://github.com/kekland/future_button/blob/master/images/future_button.gif)

## How to use it

Usage is extremely simple - right now 5 types of buttons are supported:

- `CupertinoButton` (normal + filled)
- `FlatButton` (normal + icon)
- `IconButton`
- `OutlineButton` (normal + icon)
- `RaisedButton` (normal + icon)

To convert a button to a `FutureButton`, just add a `Future` prefix and make sure that your `onPressed` callback is of type `Future<void> Function()`, instead of usual `void Function()`.

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
  future_button: ^0.0.1
```

### Install it

You can install packages from the command line:

```bash
$ flutter pub get
```

### Import it

Now in your Dart code, you can use:

```dart
import 'package:equinox/equinox.dart';
```

## Contact me

**E-mail**: `kk.erzhan@gmail.com`