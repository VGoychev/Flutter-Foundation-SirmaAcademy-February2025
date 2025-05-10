import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/starships_info/starships_info_state.dart';

class StarshipsInfoView extends StatelessWidget {
  final StarshipsInfoState state;
  const StarshipsInfoView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.widget.user.side} Starships'),
      ),
      body: FutureBuilder(
        future: state.futurePlanet,
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
              child: Text('No starships found.'),
            );
          }

          final starships = snapshot.data!;

          return ListView.builder(
            itemCount: starships.length,
            itemBuilder: (context, index) {
              final starship = starships[index];
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
                              starship.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text('Model: ${starship.model}'),
                            Text('Manufacturer: ${starship.manufacturer}'),
                            Text(
                                'Hyperdrive Rating: ${starship.hyperdrive_rating}'),
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
