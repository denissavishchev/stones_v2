import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stones_v2/stone_page.dart';
import 'package:stones_v2/stones_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bg.png'),
            fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Consumer<Stones>(
            builder: (context, value, child) {
              return Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.95,
                        child: FutureBuilder<List<Stones>>(
                          future: StonesApi.getStones(context),
                          builder: (context, snapshot) {
                            final stones = snapshot.data;
                            switch (snapshot.connectionState) {
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                return stonesWidget(stones!);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Image.asset('assets/images/bg_top.png', fit: BoxFit.fitWidth,),
                  Positioned(
                    bottom: -15,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                          child: Image.asset('assets/images/bg_bot.png',))),
                  Positioned(
                    top: 14,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width - 40,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              boxShadow: [BoxShadow(
                                color: Colors.white.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 5
                              )]
                            ),
                              child: const Icon(Icons.logout, color: Colors.white, size: 40,)),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                                  boxShadow: [BoxShadow(
                                      color: Colors.white.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 5
                                  )]
                              ),
                              child: const Icon(Icons.star, color: Colors.white, size: 40,)),

                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 4),
                      width: 200,
                      height: 50,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                          child: Container(
                            // padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.white.withOpacity(0.13)),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(0.15),
                                      Colors.white.withOpacity(0.25),
                                    ]
                                )
                            ),
                            child: const Center(
                              child: Text('Stones', style:
                              TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontFamily: 'Flode',
                              ),),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
  
  Widget stonesWidget(List<Stones> stones) =>
      Consumer<Stones>(
          builder: (context, value, index) {
            return Stack(
              children: [
                Positioned(
                  top: 48,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: GridView.builder(
                        padding: const EdgeInsets.fromLTRB(1, 6, 1, 190),
                        itemCount: stones.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                            mainAxisSpacing: 2,
                            crossAxisSpacing: 1),
                        itemBuilder: (context, index) {
                          final stone = stones[index];
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StonePage(stone: stone))),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 20,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 30),
                                    width: 200,
                                    height: 270,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Stack(
                                        children: [
                                          BackdropFilter(
                                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                          child: Container(
                                            // padding: const EdgeInsets.symmetric(horizontal: 30),
                                            width: MediaQuery.of(context).size.width,
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
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10.0),
                                                  child: Text(stone.name, style:
                                                  const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontFamily: 'Flode',
                                                      ),),
                                                ),
                                              ],
                                            ),
                                          ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 5,
                                    child: SizedBox(
                                        width: MediaQuery.of(context).size.width / 2.2,
                                        child: Image.asset('assets/images/${stone.image}')))
                              ],
                            ),
                          );
                        }),
                  ),
                ),
              ],
            );
          });
  
}
