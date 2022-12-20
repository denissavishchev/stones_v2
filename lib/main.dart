import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stones_v2/stones_model.dart';

import 'main_page.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Stones(
          name: '',
          image: '',
          from: '',
          life: '',
          energy: '',
          charisma: '',
          wisdom: '',
          death: '',
          color: '',
          price: '',
          description: ''),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

