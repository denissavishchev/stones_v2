import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stones_v2/stone_page.dart';
import 'package:stones_v2/stones_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Stones>(
        builder: (context, value, child) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.grey,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                color: Colors.grey.withOpacity(0.5),
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
          );
        },
      ),
    );
  }
  
  Widget stonesWidget(List<Stones> stones) =>
      Consumer<Stones>(
          builder: (context, value, index) {
            return GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 6),
                itemCount: stones.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 1),
                itemBuilder: (context, index) {
                  final stone = stones[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          StonePage(stone: stone))),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Text(stone.name),
                            ],
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
                });
          });
  
}
