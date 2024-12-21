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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _isMenuOpen ? 200 : 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          if (_isMenuOpen)
            Expanded(
              child: Row(
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
                ],
              ),
            ),
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                _isMenuOpen ? Icons.close : Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}