import 'package:data_persistence_app/screens/home/home.dart';
import 'package:data_persistence_app/widgets/mood_tile.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final HomeState state;

  const HomeView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = state.widget.themeMode == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout,
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
        title: FutureBuilder<String>(
          future: state.getUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                'Welcome, ${snapshot.data ?? ''}!',
                style: Theme.of(context).textTheme.headlineSmall,
              );
            }
          },
        ),
        actions: [
          IconButton(
            onPressed: state.widget.onToggleTheme,
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary,
              size: 36,
            ),
          ),
        ],
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(children: [_buildInputField(context), _buildMoodList()]),
    );
  }

  Widget _buildInputField(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDarkMode ? Colors.black54 : Colors.black26,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: state.selectedMood,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Select Mood',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                border: OutlineInputBorder(),
              ),
              items: HomeState.moodOptions.map((mood) {
                return DropdownMenuItem<String>(
                  value: mood,
                  child: Text(
                    mood,
                    style: TextStyle(fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }).toList(),
              onChanged: state.onMoodChanged,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: state.controller,
                    decoration: const InputDecoration(
                      labelText: "Add a note",
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      filled: false,
                    ),
                    onSubmitted: (_) => state.addMood(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: state.addMood,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMoodList() {
    if (state.moods.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text(
            'No moods yet.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }
    return Expanded(
      child: ListView.separated(
        itemCount: state.moods.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final mood = state.moods[index];
          return MoodTile(
            mood: mood,
            onDelete: () => state.deleteMoods(index),
          );
        },
      ),
    );
  }
}
