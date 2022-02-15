import 'package:flutter/material.dart';

class MyNavbar extends StatefulWidget {
  final void Function(int index) onPressed;

  const MyNavbar({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  _MyNavbarState createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (idx) {
        widget.onPressed(idx);
        setState(() {
          _currentIndex = idx;
        });
      },
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded), label: "Counter 1"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded), label: "Counter 2"),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded), label: "Counter 3"),
      ],
    );
  }
}
