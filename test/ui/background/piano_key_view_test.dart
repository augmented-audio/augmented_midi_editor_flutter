import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:augmented_midi_editor/midi_editor/ui/background/piano_key_view.dart';

void main() {
  group('PianoKeyView', () {
    testWidgets('renders correctly with white key',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PianoKeyView(isSharp: false, height: 100),
          ),
        ),
      );

      // Verify that the PianoKeyView widget is rendered
      expect(find.byType(PianoKeyView), findsOneWidget);

      // Verify the height
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxHeight, 100);

      // Verify the color
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.white);
    });

    testWidgets('renders correctly with black key',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PianoKeyView(isSharp: true, height: 100),
          ),
        ),
      );

      // Verify that the PianoKeyView widget is rendered
      expect(find.byType(PianoKeyView), findsOneWidget);

      // Verify the height
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.constraints?.maxHeight, 100);

      // Verify the color
      final decoration = container.decoration as BoxDecoration;
      expect(decoration.color, Colors.black);
    });
  });
}
