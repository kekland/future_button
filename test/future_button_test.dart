import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:future_button/future_button.dart';

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

Future<void> waitFor() {
  return Future.delayed(waitDuration);
}

Future<void> testButtonWithArgs(
  WidgetTester tester, {
  List<ProgressIndicatorLocation> progressIndicatorLocations =
      ProgressIndicatorLocation.values,
  FutureButtonBuilder builder,
}) async {
  for (final isEnabled in [true, false]) {
    for (final progressIndicatorLocation in progressIndicatorLocations) {
      for (final progressIndicatorBuilder in progressIndicatorBuilders) {
        final child = Container();
        final progressIndicator = progressIndicatorBuilder(null);

        final widget = builder(
          onPressed: isEnabled ? waitFor : null,
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
        expect(state.isEnabled, equals(isEnabled));

        if (isEnabled) {
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

          await waitFor();
          await tester.pump();

          expect(find.byWidget(widget), findsOneWidget);
          expect(find.byWidget(child), findsOneWidget);
          expect(find.byWidget(progressIndicator), findsNothing);

          expect(state.isLoading, equals(false));
          expect(state.isEnabled, equals(true));
        }
      }
    }
  }
}

void main() {
  testWidgets(
    'Test FutureCupertinoButton',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureCupertinoButton.filled',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureFlatButton',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureFlatButton.icon',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );
  testWidgets(
    'Test FutureIconButton',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureOutlineButton',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureOutlineButton.icon',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureRaisedButton',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );

  testWidgets(
    'Test FutureRaisedButton.icon',
    (tester) async {
      await tester.runAsync(
        () async {
          await testButtonWithArgs(
            tester,
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
        },
      );
    },
  );
}
