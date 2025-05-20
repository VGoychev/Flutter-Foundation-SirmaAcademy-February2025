import 'package:data_persistence_app/models/mood.dart';
import 'package:data_persistence_app/widgets/mood_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  testWidgets('MoodTile displays mood, date, note, and handles delete',
      (WidgetTester tester) async {
    final mood = Mood(
      mood: 'Happy',
      note: 'Had a great day!',
      date: DateTime(2025, 5, 20),
    );

    bool wasDeleted = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MoodTile(
            mood: mood,
            onDelete: () {
              wasDeleted = true;
            },
          ),
        ),
      ),
    );

    final formattedDate = DateFormat.yMMMMd().format(mood.date);
    expect(find.text('Felt Happy on $formattedDate'), findsOneWidget);
    expect(find.text('Had a great day!'), findsOneWidget);
    expect(find.byIcon(Icons.delete), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(wasDeleted, isTrue);
  });
}
