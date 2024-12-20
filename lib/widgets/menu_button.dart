import 'package:flutter/material.dart';

class MenuButton extends StatefulWidget {
  final VoidCallback onSettingsPressed;
  final VoidCallback onAddTaskPressed;

  const MenuButton({
    required this.onSettingsPressed,
    required this.onAddTaskPressed,
    Key? key,
  }) : super(key: key);

  @override
  _MenuButtonState createState() => _MenuButtonState();
}

class _MenuButtonState extends State<MenuButton> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _isMenuOpen ? 160 : 0,
          height: 56,
          decoration: BoxDecoration(
            color: Colors.cyan,
            borderRadius: BorderRadius.circular(28),
          ),
          child: _isMenuOpen
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: widget.onSettingsPressed,
              ),
              IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: widget.onAddTaskPressed,
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _isMenuOpen = false;
                  });
                },
              ),
            ],
          )
              : SizedBox.shrink(),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isMenuOpen = true;
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            margin: EdgeInsets.only(left: 8),
            width: _isMenuOpen ? 0 : 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.cyan,
              shape: BoxShape.circle,
            ),
            child: _isMenuOpen ? SizedBox.shrink() : Icon(Icons.menu, color: Colors.white),
          ),
        ),
      ],
    );
  }
}