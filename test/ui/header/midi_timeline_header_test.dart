import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:augmented_midi_editor/midi_editor/ui/header/midi_timeline_header.dart';

void main() {
  group('MIDITimelineHeader', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MIDITimelineHeader(),
          ),
        ),
      );

      // Verify that the MIDITimelineHeader widget is rendered
      expect(find.byType(MIDITimelineHeader), findsOneWidget);

      // Verify that it contains the expected number of BarHeaderView widgets
      expect(find.byType(BarHeaderView), findsNWidgets(4));
    });
  });

  group('BarHeaderView', () {
    testWidgets('renders correctly with even index',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BarHeaderView(index: 0),
          ),
        ),
      );

      // Verify that the BarHeaderView widget is rendered
      expect(find.byType(BarHeaderView), findsOneWidget);

      // Verify that the text displayed is "1."
      expect(find.text('1.'), findsOneWidget);

      // Verify the background color
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color.fromRGBO(100, 100, 100, 1));
    });

    testWidgets('renders correctly with odd index',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BarHeaderView(index: 1),
          ),
        ),
      );

      // Verify that the BarHeaderView widget is rendered
      expect(find.byType(BarHeaderView), findsOneWidget);

      // Verify that the text displayed is "2."
      expect(find.text('2.'), findsOneWidget);

      // Verify the background color
      final container = tester.widget<Container>(find.byType(Container));
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, const Color.fromRGBO(70, 70, 70, 1));
    });
  });
}
