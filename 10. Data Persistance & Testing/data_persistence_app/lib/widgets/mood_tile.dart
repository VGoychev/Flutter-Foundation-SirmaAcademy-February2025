import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/mood.dart';

class MoodTile extends StatelessWidget {
  final Mood mood;
  final VoidCallback onDelete;

  const MoodTile({
    super.key,
    required this.mood,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat.yMMMMd().format(mood.date);

    return ListTile(
      title: Text(
        'Felt ${mood.mood} on ${formattedDate}',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        mood.note!,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}
