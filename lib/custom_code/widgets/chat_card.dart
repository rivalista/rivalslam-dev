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

class ChatCard extends StatefulWidget {
  const ChatCard({
    Key? key,
    this.width,
    this.height,
    this.profileImg,
    this.username,
    this.favTeamList,
    this.hateTeamList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? profileImg;
  final String? username;
  final List<String>? favTeamList;
  final List<String>? hateTeamList;

  @override
  _ChatCardState createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  @override
  Widget build(BuildContext context) {
    return SlideMenu(
      menuItems: <Widget>[
        Container(
          color: Colors.transparent,
          child: IconButton(
            icon: const Icon(
              Icons.back_hand_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              FFAppState().rivalSlamAction = "rival_slam_icon";
            },
          ),
        ),
        Container(
          color: Colors.transparent,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.delete),
            onPressed: () {
              FFAppState().deleteAction = "delete_icon";
            },
          ),
        ),
        Container(
          color: Colors.transparent,
          child: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.center_focus_weak_sharp),
            onPressed: () {
              FFAppState().targetAction = "target_icon";
            },
          ),
        ),
      ],
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(widget.profileImg ?? ""))),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.username ?? "Guest"),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: Stack(
                        children: [
                          for (int i = 0; i < widget.favTeamList!.length; i++)
                            Positioned(
                              left: i * 14,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: CachedNetworkImage(
                                  imageUrl: "https://placehold.jp/10x10.png",
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => Center(
                                      child: Container(
                                          height: 45,
                                          width: 45,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: const Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ))),
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    Text(
                        "You have ${widget.favTeamList != null ? widget.favTeamList!.length : 0} mutual friends"),
                  ],
                ),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                _SlideMenuState()._controller.animateTo(0.5);
              },
              child: const Icon(Icons.arrow_forward_ios_rounded),
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
