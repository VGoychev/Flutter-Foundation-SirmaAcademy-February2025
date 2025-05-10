import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/characters_info/characters_info_state.dart';

class CharactersInfoView extends StatelessWidget {
  final CharactersInfoState state;
  const CharactersInfoView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.widget.user.side} Characters'),
      ),
      body: FutureBuilder(
        future: state.futurePerson,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No characters found.'),
            );
          }

          final people = snapshot.data!;

          return ListView.builder(
            itemCount: people.length,
            itemBuilder: (context, index) {
              final person = people[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              person.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text('Homeworld: ${person.homeworldName}'),
                            Text('Birth Year: ${person.birthYear}'),
                          ],
                        ),
                      ),
                      Image.asset(
                        state.widget.user.side == 'Resistance'
                            ? 'assets/img/resistance_symbol.png'
                            : 'assets/img/imperial_symbol.png',
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
