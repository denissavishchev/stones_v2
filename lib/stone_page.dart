import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stones_v2/stones_model.dart';

import 'main_page.dart';

class StonePage extends StatelessWidget {

  final Stones stone;

  const StonePage({Key? key, required this.stone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Stones>(
      builder: (context, value, child) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MainPage();
                        })),
                    child: const Text('back')),
                Container(
                  width: 200,
                  height: 200,
                  color: Colors.grey.withOpacity(0.3),
                  child: Image.asset('assets/images/${stone.image}'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
