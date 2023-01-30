import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:countup/countup.dart';

class Abilities extends StatefulWidget {

  final String name;
  final String image;
  final int percent;
  final Color color;


   Abilities({
    Key? key, required this.name, required this.image, required this.percent, required this.color,
  }) : super(key: key);

  @override
  State<Abilities> createState() => _AbilitiesState();
}

class _AbilitiesState extends State<Abilities> with SingleTickerProviderStateMixin{

  final duration = 1000;
  late AnimationController _animationAbilitiesController;
  late Animation<double> _animationAbilities;

  void setupAbilitiesAnimation() {
    _animationAbilitiesController = AnimationController(
        vsync: this,
    duration: Duration(milliseconds: duration),);
    _animationAbilities = CurvedAnimation(
        parent: _animationAbilitiesController,
        curve: const Interval(0.0, 1.0));
  }

  @override
  void initState() {
    setupAbilitiesAnimation();
    _animationAbilitiesController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationAbilitiesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_animationAbilitiesController]),
      builder: (context, _) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/icons/${widget.image}.png'),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.name, style: const TextStyle(color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),),
                          const Spacer(),
                          Countup(begin: 0, end: widget.percent.toDouble(),
                            duration: Duration(milliseconds: duration),
                            style: const TextStyle(color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.transparent,
                    child: LinearPercentIndicator(
                      barRadius: const Radius.circular(10),
                      lineHeight: 6,
                      percent: (widget.percent / 100) * _animationAbilities.value,
                      progressColor: widget.color,
                      backgroundColor: Colors.grey,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      });
  }
}