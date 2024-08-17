// import 'package:flutter/material.dart';

// class SearchBar extends StatefulWidget {
//   const SearchBar({super.key});

//   @override
//   State<SearchBar> createState() => _SearchBarState();
// }

// class _SearchBarState extends State<SearchBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(8.0), // Margin around the search bar
      // padding: EdgeInsets.symmetric(horizontal: 8.0), // Padding inside the container
      // width: 10.0, // Fixed width for the search bar
      // decoration: BoxDecoration(
      //   color: Colors.grey[200], // Background color of the search bar
      //   borderRadius: BorderRadius.circular(8.0), // Rounded corners
      //   border: Border.all(color: Colors.grey), // Border color
      // ),
      child: Row(
        children: [
          Icon(
            Icons.search, // Search icon
            color: Colors.grey, // Icon color
            size: 20.0, // Icon size
          ),
          SizedBox(width: 6.0), // Space between icon and text field
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Search', // Placeholder text
                border: InputBorder.none, // Remove the border of the text field
                contentPadding: EdgeInsets.symmetric(vertical: 8.0), // Padding inside the text field
              ),
            ),
          ),
        ],
      ),
    );
  }
}
