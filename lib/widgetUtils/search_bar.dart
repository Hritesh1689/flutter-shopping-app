import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../app_routes/navigateObserver.dart';

class SearchAppBar extends AppBar {
  SearchAppBar({super.key , required this.toShowFav, required this.toShowSearchOption, required this.label, required this.myNavigatorObserver , required this.filterIconClick});
  final bool toShowFav;
  final bool toShowSearchOption;
  final String label;
  final MyNavigatorObserver myNavigatorObserver;
  final Function filterIconClick;

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  AppBar(
        title: (_isSearching && widget.toShowSearchOption)
            ? TextField(
          controller: _searchController,
          autofocus: false,
          decoration: const InputDecoration(
            hintText: 'Search...',
            fillColor: Colors.grey,
            hoverColor: Colors.white,
            focusColor: Colors.white,
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.white, fontSize: 18),
          onSubmitted: (query) {
            // Perform search here
           // if(query.length == 3) {
              Navigator.of(context).pushNamed('/productOrder', arguments: {
                "searchKey": query
              });
           // }
          },
        )
            :  Text( widget.label , style: TextStyle(fontSize: 18, color: Colors.grey)),
        backgroundColor: Colors.black,
      iconTheme: const IconThemeData(
        color: Colors.white, // Change this to your desired color
      ),
        actions: [
          Visibility(
            visible: widget.toShowSearchOption,
            child: IconButton(
              icon: Icon(_isSearching ? Icons.clear : Icons.search, color: Colors.white,),
              onPressed: () {
                setState(() {
                  if (_isSearching) {
                    _isSearching = false;
                    _searchController.clear();
                  } else {
                    _isSearching = true;
                  }
                }
                );
              },
            ),
          ),
          Visibility(
            visible: widget.toShowFav,
            child: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.white,),
              onPressed: () {
                Navigator.of(context).pushNamed('/productFavourite');
              },
            ),
          ),
          Visibility(
            visible: widget.toShowFav && widget.myNavigatorObserver.currentRoute == "/productOrder",
            child: IconButton(
              icon: const Icon(Icons.filter_alt_outlined, color: Colors.white,),
              onPressed: () {
                 widget.filterIconClick();
              },
            ),
          )
        ],
      );
  }
}