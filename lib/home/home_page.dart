import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_movies/home/popular_movies/presentation/popular_movies_page.dart';
import 'package:flutter_ios_movies/home/popular_tv_shows/presentation/popular_tv_page.dart';
import 'package:flutter_ios_movies/home/upcoming/up_coming_page.dart';
import 'package:flutter_ios_movies/shared/presentation/base_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
              icon: Icon(CupertinoIcons.arrowtriangle_right_square),
              label: 'Movies'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.tv), label: 'Tv shows'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.time), label: 'Up coming'),
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
