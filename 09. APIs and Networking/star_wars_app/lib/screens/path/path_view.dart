import 'package:flutter/material.dart';
import 'package:star_wars_app/screens/info/info_state.dart';

class PathView extends StatelessWidget {
  final String name;
  const PathView(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/img/path_background.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'Welcome, $name',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Choose your side',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 140,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Resistance',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Info(side: 'Resistance'),
                            ),
                          );
                        },
                        child: ClipRect(
                          child: Align(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/img/resistance_symbol.png',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Text(
                        'Imperial',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Info(side: 'Imperial'),
                            ),
                          );
                        },
                        child: ClipOval(
                          child: Stack(children: [
                            Image.asset(
                              'assets/img/imperial_symbol.webp',
                              width: 120,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black.withOpacity(0.1),
                                    Colors.black.withOpacity(0.2),
                                    Colors.black.withOpacity(0.3),
                                  ],
                                  stops: [0.0, 0.5, 1.0],
                                ),
                              ),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
