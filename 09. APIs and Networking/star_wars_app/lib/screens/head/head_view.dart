import 'package:flutter/material.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/characters_info/characters_info_state.dart';
import 'package:star_wars_app/screens/planets_info/planets_info_state.dart';
import 'package:star_wars_app/screens/starships_info/starships_info_state.dart';

class HeadView extends StatelessWidget {
  final User user;

  const HeadView(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.side}'),
      ),
      body: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Name: ${user.name}\nSide: ${user.side}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Image.asset(
                    user.side == 'Resistance'
                        ? 'assets/img/resistance_symbol.png'
                        : 'assets/img/imperial_symbol.png',
                    width: 50,
                  ),
                ),
              ],
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CharactersInfo(user: user)));
                },
                child: Text('Characters',
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StarshipsInfo(user: user)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Text('Starships',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlanetsInfo(user: user)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text('Planets',
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ),
            ),
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 4,
            ),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 50,
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black, Colors.transparent],
                stops: [0.0, 0.5, 1.0],
              ).createShader(bounds);
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(user.side == 'Resistance'
                ? 'assets/img/rebels.jpg'
                : 'assets/img/imperials.avif'),
          ),
        )
      ]),
    );
  }
}
