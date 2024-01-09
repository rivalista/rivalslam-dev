// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cached_network_image/cached_network_image.dart';

class ScoreCard extends StatefulWidget {
  const ScoreCard(
      {Key? key,
      this.width,
      this.height,
      this.teamAColor,
      this.teamAName,
      this.teamALogo,
      this.teamBColor,
      this.teamBName,
      this.teamBLogo,
      this.playTime})
      : super(key: key);

  final double? width;
  final double? height;
  final Color? teamAColor;
  final String? teamAName;
  final String? teamALogo;
  final Color? teamBColor;
  final String? teamBName;
  final String? teamBLogo;
  final String? playTime;

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  @override
  Widget build(BuildContext context) {
    return SlideMenu(
      menuItems: <Widget>[
        Container(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        Container(
          color: Colors.transparent,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(color: widget.teamAColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 16,
                        ),
                        Image.network(widget.teamALogo ??
                            "https://placehold.jp/50x50.png"),
                        SizedBox(
                          width: 16,
                        ),
                        Text(widget.teamAName ?? "Team A")
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * .5,
                    decoration: BoxDecoration(color: widget.teamBColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.teamBName ?? "Team B"),
                        SizedBox(
                          width: 16,
                        ),
                        Image.network(widget.teamBLogo ??
                            "https://placehold.jp/50x50.png"), //
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.black,
              radius: 30,
              child: Text(
                widget.playTime ?? "00:00",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideMenu extends StatefulWidget {
  final Widget child;
  final List<Widget> menuItems;

  const SlideMenu({Key? key, required this.child, required this.menuItems})
      : super(key: key);

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Here the end field will determine the size of buttons which will appear after sliding
    //If you need to appear them at the beginning, you need to change to "+" Offset coordinates (0.2, 0.0)
    final animation =
        Tween(begin: const Offset(0.0, 0.0), end: const Offset(-0.35, 0.0))
            .animate(CurveTween(curve: Curves.decelerate).animate(_controller));

    return GestureDetector(onHorizontalDragUpdate: (data) {
      // we can access context.size here
      setState(() {
        //Here we set value of Animation controller depending on our finger move in horizontal axis
        //If you want to slide to the right, change "-" to "+"
        _controller.value -= (data.primaryDelta! / (context.size!.width * 0.2));
      });
    }, onHorizontalDragEnd: (data) {
      //To change slide direction, change to data.primaryVelocity! < -1500
      if (data.primaryVelocity! > 1500)
        _controller
            .animateTo(.0); //close menu on fast swipe in the right direction
      //To change slide direction, change to data.primaryVelocity! > 1500
      else if (_controller.value >= .5 || data.primaryVelocity! < -1500)
        _controller.animateTo(
            1.0); // fully open if dragged a lot to left or on fast swipe to left
      else // close if none of above
        _controller.animateTo(.0);
    }, child: LayoutBuilder(builder: (context, constraint) {
      return Stack(
        children: [
          SlideTransition(
            position: animation,
            child: widget.child,
          ),
          AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                //To change slide direction to right, replace the right parameter with left:
                return Positioned(
                  right: .0,
                  top: .0,
                  bottom: .0,
                  width: constraint.maxWidth * animation.value.dx * -1,
                  child: Container(
                    color: Colors.green,
                    child: Row(
                      children: widget.menuItems.map((child) {
                        return Expanded(
                          child: child,
                        );
                      }).toList(),
                    ),
                  ),
                );
              })
        ],
      );
    }));
  }
}
