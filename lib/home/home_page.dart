import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';
import 'package:flutter_ios_movies/home/upcoming/comming_son_page.dart';
import 'package:flutter_ios_movies/home/popular_movies/presentation/popular_movies_page.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/popular_tv_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = const <BaseCupertinoPage>[
    PopularMoviesPage(),
    PopularTvPage(),
    UpComingSonPage()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.heart), label: 'Tv Shows'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time), label: 'Coming Son'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return _pages[index];
          },
        );
      },
    );
  }
}
