import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:future_button/future_button.dart';

class PlannedException implements Exception {}

const waitDuration = Duration(milliseconds: 100);

final progressIndicatorBuilders = <WidgetBuilder>[
  defaultMaterialProgressIndicatorBuilder,
  defaultCupertinoProgressIndicatorBuilder,
];

typedef FutureButtonBuilder = Widget Function({
  FutureCallback onPressed,
  WidgetBuilder progressIndicatorBuilder,
  Widget child,
  ProgressIndicatorLocation progressIndicatorLocation,
});

Future<void> waitForAndFail() async {
  await Future.delayed(waitDuration);
  throw PlannedException();
}

Future<void> waitFor() {
  return Future.delayed(waitDuration);
}

Future<void> testButtonWithArgs(
  WidgetTester tester, {
  List<ProgressIndicatorLocation> progressIndicatorLocations =
      ProgressIndicatorLocation.values,
  FutureButtonBuilder builder,
  FutureCallback onTap,
  bool shouldError = false,
}) async {
  for (final progressIndicatorLocation in progressIndicatorLocations) {
    for (final progressIndicatorBuilder in progressIndicatorBuilders) {
      final child = Container();
      final progressIndicator = progressIndicatorBuilder(null);

      final widget = builder(
        onPressed: onTap,
        progressIndicatorBuilder: (_) => progressIndicator,
        progressIndicatorLocation: progressIndicatorLocation,
        child: child,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: Center(child: widget)),
        ),
      );

      final state = tester.state<GenericFutureButtonState>(
        find.byWidget(widget),
      );

      expect(find.byWidget(widget), findsOneWidget);
      expect(find.byWidget(child), findsOneWidget);
      expect(find.byWidget(progressIndicator), findsNothing);

      expect(state.isLoading, equals(false));
      expect(state.isEnabled, equals(onTap != null));

      if (onTap != null) {
        final onError = FlutterError.onError;
        var error;

        await tester.runAsync(() async {
          await tester.tap(find.byWidget(widget));
          await tester.pump();

          expect(
            find.byWidget(child),
            progressIndicatorLocation == ProgressIndicatorLocation.center
                ? findsNothing
                : findsOneWidget,
          );

          expect(find.byWidget(progressIndicator), findsOneWidget);

          expect(state.isLoading, equals(true));
          expect(state.isEnabled, equals(false));

          FlutterError.onError = (e) {
            error = e;
          };
          await waitFor();

          FlutterError.onError = onError;
          await tester.pump();
        });

        if (shouldError) {
          expect(error, isNotNull);
        }

        expect(find.byWidget(widget), findsOneWidget);
        expect(find.byWidget(child), findsOneWidget);
        expect(find.byWidget(progressIndicator), findsNothing);

        expect(state.isLoading, equals(false));
        expect(state.isEnabled, equals(true));
      }
    }
  }
}

void testButton({
  String name,
  FutureButtonBuilder builder,
  List<ProgressIndicatorLocation> progressIndicatorLocations =
      ProgressIndicatorLocation.values,
}) {
  testWidgets(
    'Test normal $name',
    (tester) async {
      await testButtonWithArgs(
        tester,
        builder: builder,
        onTap: waitFor,
        progressIndicatorLocations: progressIndicatorLocations,
      );
    },
  );

  testWidgets(
    'Test disabled $name',
    (tester) async {
      await testButtonWithArgs(
        tester,
        builder: builder,
        onTap: null,
        progressIndicatorLocations: progressIndicatorLocations,
      );
    },
  );

  testWidgets(
    'Test failing $name',
    (tester) async {
      await testButtonWithArgs(
        tester,
        builder: builder,
        onTap: waitForAndFail,
        progressIndicatorLocations: progressIndicatorLocations,
        shouldError: true,
      );
    },
  );
}

void main() {
  testButton(
    name: 'FutureCupertinoButton',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureCupertinoButton(
        child: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureCupertinoButton.filled',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureCupertinoButton.filled(
        child: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureFlatButton',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureFlatButton(
        child: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureFlatButton.icon',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureFlatButton.icon(
        icon: Icon(Icons.star),
        label: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );
  testButton(
    name: 'FutureIconButton',
    progressIndicatorLocations: [ProgressIndicatorLocation.center],
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureIconButton(
        icon: child,
        onPressed: onPressed,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureOutlineButton',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureOutlineButton(
        child: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureOutlineButton.icon',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureOutlineButton.icon(
        icon: Icon(Icons.star),
        label: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureRaisedButton',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureRaisedButton(
        child: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );

  testButton(
    name: 'FutureRaisedButton.icon',
    builder: ({
      FutureCallback onPressed,
      WidgetBuilder progressIndicatorBuilder,
      Widget child,
      ProgressIndicatorLocation progressIndicatorLocation,
    }) {
      return FutureRaisedButton.icon(
        icon: Icon(Icons.star),
        label: child,
        onPressed: onPressed,
        progressIndicatorLocation: progressIndicatorLocation,
        progressIndicatorBuilder: progressIndicatorBuilder,
      );
    },
  );
}
