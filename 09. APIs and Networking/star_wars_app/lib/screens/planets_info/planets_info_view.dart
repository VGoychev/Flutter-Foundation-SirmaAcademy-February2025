import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/planets_info/planets_info_state.dart';

class PlanetsInfoView extends StatelessWidget {
  final PlanetsInfoState state;
  const PlanetsInfoView(this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${state.widget.user.side} Planets'),
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
              child: Text('No planets found.'),
            );
          }

          final planets = snapshot.data!;

          return ListView.builder(
            itemCount: planets.length,
            itemBuilder: (context, index) {
              final planet = planets[index];
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
                              planet.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text('Population: ${planet.population}'),
                            Text('Climate: ${planet.climate}'),
                            Text('Terrain: ${planet.terrain}'),
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
