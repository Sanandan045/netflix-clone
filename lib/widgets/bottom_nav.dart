import 'package:flutter/material.dart';
import 'package:netflixclone/screens/explore_screen.dart';
import 'package:netflixclone/screens/home_screen.dart';
import 'package:netflixclone/screens/search_screen.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.download),
                text: "Downloaded",
              ),
            ],
            unselectedLabelColor: Color(0xFF999999),
            labelColor: Colors.white,
            indicatorColor: Colors.transparent,
          ),
        ),
        body: const TabBarView(
          children: [HomeScreen(), SearchScreen(), ExploreScreen()],
        ),
      ),
    );
  }
}
