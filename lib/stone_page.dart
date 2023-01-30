import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stones_v2/stones_model.dart';
import 'package:stones_v2/widgets/abilities.dart';
import 'main_page.dart';

class StonePage extends StatelessWidget {

  final Stones stone;

  const StonePage({Key? key, required this.stone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Stones>(
      builder: (context, value, child) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/${stone.image}'),
                  fit: BoxFit.cover)
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 50,),
                    ElevatedButton(
                        onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const MainPage();
                            })),
                        child: const Text('back')),
                    const SizedBox(height: 120,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: 600,
                        height: 400,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                      child: Container(
                                        // padding: const EdgeInsets.symmetric(horizontal: 30),
                                        width: 600,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            border: Border.all(color: Colors.white.withOpacity(0.13)),
                                            gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  Colors.white.withOpacity(0.05),
                                                  Colors.white.withOpacity(0.15),
                                                ]
                                            )
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(25, 10, 5, 10),
                                      child: Column(
                                        children: [
                                          Abilities(name: 'Life', image: 'life', percent: int.parse(stone.life), color: Colors.green,),
                                          Abilities(name: 'Charisma', image: 'charisma', percent: int.parse(stone.charisma), color: Colors.yellow,),
                                          Abilities(name: 'Energy', image: 'energy', percent: int.parse(stone.energy), color: Colors.red,),
                                          Abilities(name: 'Wisdom', image: 'wisdom', percent: int.parse(stone.wisdom), color: Colors.deepPurple,),
                                          Abilities(name: 'Death', image: 'death', percent: int.parse(stone.death), color: Colors.black,),
                                          Expanded(
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                                              width: 150,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.withOpacity(0.2),
                                                borderRadius: const BorderRadius.all(Radius.circular(20))
                                              ),
                                              child: SingleChildScrollView(
                                                child: Text(stone.description, textAlign: TextAlign.center, style:
                                                  const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily: 'Flode',
                                                )),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 400,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            top: 10,
                                              left: 20,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(stone.name, style:
                                                  const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontFamily: 'Flode',
                                                  ),),
                                                  Text('${stone.price} \$', style:
                                                  TextStyle(
                                                    color: Colors.white.withOpacity(0.8),
                                                    fontSize: 22,
                                                    fontFamily: 'Flode',
                                                  ),),
                                                ],
                                              )),
                                          Positioned(
                                            bottom: 1,
                                            right: 15,
                                            child: SizedBox(
                                              width: 360,
                                              height: 360,
                                              child: Image.asset('assets/images/${stone.image}',
                                                fit: BoxFit.contain,),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                              left: 15,
                                              child: Text(stone.from, style:
                                              TextStyle(
                                                color: Colors.white.withOpacity(0.8),
                                                fontSize: 24,
                                                fontFamily: 'Flode',
                                              ),),)
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


