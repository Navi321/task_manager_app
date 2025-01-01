import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const SearchButton({super.key, required this.onSearch});

  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool _isSearching = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: _isSearching ? 200 : 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          if (_isSearching)
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
                onChanged: (value) {
                  widget.onSearch(value);
                },
                onSubmitted: (value) {
                  widget.onSearch(value);
                  setState(() {
                    _isSearching = value.isNotEmpty;
                  });
                },
              ),
            ),
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(
                _isSearching ? Icons.close : Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  if (_isSearching) {
                    widget.onSearch('');
                    _controller.clear();
                  }
                  _isSearching = !_isSearching;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}