import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/info/info_state.dart';

class InfoView extends StatelessWidget {
  final InfoState state;
  const InfoView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.widget.side} Characters'),
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
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text('Character: ${person.name}'),
                  subtitle: Text('Homeworld: ${person.homeworldName}\nBirth Year: ${person.birthYear}'),
                  trailing: Icon(
                    state.widget.side == 'Resistance'
                        ? Icons.flag
                        : Icons.shield,
                    color: state.widget.side == 'Resistance'
                        ? Colors.blue
                        : Colors.red,
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
