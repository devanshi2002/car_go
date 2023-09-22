// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:spotify_clone/view/home.dart';
import 'package:spotify_clone/view/library.dart';
import 'package:spotify_clone/view/search.dart';
import 'package:spotify_clone/view/profile.dart';

class Tabbar extends StatefulWidget {
  Tabbar({Key? key}) : super(key: key);

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: _selectedTab,
          onTap: (index) {
            setState(() {
              this._selectedTab = index;
            });
          },
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_max_outlined),
              label: "Home",
              backgroundColor: Colors.grey,
            ),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined), label: "Search"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.library_music_outlined),
                label: "Your Library"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: " Profile"),
          ]),
      body: Stack(
        children: [
          renderView(0, HomeView()),
          renderView(1, searchView()),
          renderView(2, LibraryView()),
          renderView(3, ProfileView()),
        ],
      ),
    );
  }

  Widget renderView(int tabIndex, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != tabIndex,
      child: Opacity(
        opacity: _selectedTab == tabIndex ? 1 : 0,
        child: view,
      ),
    );
  }
}
