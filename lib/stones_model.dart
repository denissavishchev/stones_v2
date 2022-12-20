import 'package:flutter/material.dart';
import 'dart:convert';

class Stones extends ChangeNotifier{
  final String name;
  final String image;
  final String from;
  final String life;
  final String energy;
  final String charisma;
  final String wisdom;
  final String death;
  final String color;
  final String price;
  final String description;

  Stones ({
     required this.name,
     required this.image,
     required this.from,
     required this.life,
     required this.energy,
     required this.charisma,
     required this.wisdom,
     required this.death,
     required this.color,
     required this.price,
     required this.description,});

  static Stones fromJson(json) =>
      Stones(
        name: json['name'],
        image: json['image'],
        from: json['from'],
        life: json['life'],
        energy: json['energy'],
        charisma: json['charisma'],
        wisdom: json['wisdom'],
        death: json['death'],
        color: json['color'],
        price: json['price'],
        description: json['description'],
      );
}

class StonesApi {
  static Future<List<Stones>> getStones(BuildContext context) async {
    final assetBungle = DefaultAssetBundle.of(context);
    final data = await assetBungle.loadString('assets/stones.json');
    final body = jsonDecode(data);
    return body.map<Stones>(Stones.fromJson).toList();
  }
}