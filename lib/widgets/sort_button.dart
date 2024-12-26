import 'package:flutter/material.dart';

class SortButton extends StatefulWidget {
  final ValueChanged<String> onSort;

  const SortButton({Key? key, required this.onSort}) : super(key: key);

  @override
  _SortButtonState createState() => _SortButtonState();
}

class _SortButtonState extends State<SortButton> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _isExpanded ? 200 : 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        children: [
          Expanded(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isExpanded ? 1 : 0,
              child: _isExpanded
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Sort by',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
              )
                  : SizedBox(),
            ),
          ),
          Container(
            width: 56,
            height: 56,
            alignment: Alignment.center,
            child: PopupMenuButton<String>(
              icon: Icon(Icons.sort, color: Colors.white),
              color: Colors.white,
              elevation: 8,
              offset: Offset(5, -5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              constraints: BoxConstraints(maxWidth: 250),
              onSelected: (String value) {
                widget.onSort(value);
                setState(() {
                  _isExpanded = false;
                });
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'Date Ascending',
                  child: Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.cyan),
                      SizedBox(width: 8),
                      Text('Date Ascending', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Date Descending',
                  child: Row(
                    children: [
                      Icon(Icons.date_range, color: Colors.cyan),
                      SizedBox(width: 8),
                      Text('Date Descending', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  value: 'Title Ascending',
                  child: Row(
                    children: [
                      Icon(Icons.title, color: Colors.cyan),
                      SizedBox(width: 8),
                      Text('Title Ascending', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'Title Descending',
                  child: Row(
                    children: [
                      Icon(Icons.title, color: Colors.cyan),
                      SizedBox(width: 8),
                      Text('Title Descending', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}