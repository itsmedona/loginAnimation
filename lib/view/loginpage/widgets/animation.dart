import 'dart:async';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ShowAnimation extends StatefulWidget {
  //Getting child widget
  final Widget child;
  //getting animation duration
  int? delay;
  ShowAnimation({required this.child, this.delay});

  @override
  _ShowAnimationState createState() => _ShowAnimationState();
}

class _ShowAnimationState extends State<ShowAnimation>
    with TickerProviderStateMixin {
  //animation controller variable creating
  late AnimationController animController;
  //creating animation variable of offset type
  late Animation<Offset> animOffset;
  //creating timer varible
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    //initializing animation controller
    animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(parent: animController, curve: Curves.decelerate);
    //initializing animation variable
    animOffset = Tween<Offset>(begin: Offset(0.0, 0.35), end: Offset.zero)
        .animate(curve);
    //starting animation controller
    if (widget.delay == null) {
      animController.forward();
    } else {
      _timer = Timer(Duration(milliseconds: widget.delay!), () {
        animController.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    animController.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animController,
      child: SlideTransition(
        position: animOffset,
        child: widget.child,
      ),
    );
  }
}
