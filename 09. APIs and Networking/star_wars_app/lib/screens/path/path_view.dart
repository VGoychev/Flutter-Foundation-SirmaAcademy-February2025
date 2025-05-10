import 'package:flutter/material.dart';
import 'package:star_wars_app/model/user.dart';
import 'package:star_wars_app/screens/head/head_state.dart';

class PathView extends StatelessWidget {
  final User user;
  const PathView(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode
                  .darken,
            ),
            child: Image.asset(
              'assets/img/path_background.jpeg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Choose your side',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  ),
                ),
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
                          user.side = 'Resistance';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Head(user: user),
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
                          user.side = 'Imperial';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Head(user: user),
                            ),
                          );
                        },
                        child: ClipOval(
                          child: Stack(children: [
                            Image.asset(
                              'assets/img/imperial_symbol.png',
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
          Positioned(
            bottom: 10,
            left: (MediaQuery.of(context).size.width - 180) / 2,
            width: 180,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), // Adjust opacity (0.0 - 1.0)
                BlendMode
                    .darken, // Try different blend modes: overlay, multiply, etc.
              ),
              child: Image.asset(
                  'assets/img/star_wars_logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
