import 'package:flutter/cupertino.dart';
import 'package:flutter_ios_movies/home/upcoming/movies/presentation/up_comming_movies_page.dart';

class ComingSonRootPage extends StatefulWidget {
  @override
  _ComingSonRootPageState createState() => _ComingSonRootPageState();
}

class _ComingSonRootPageState extends State<ComingSonRootPage> {
  final Map<int, Widget> _segmentedItems = const <int, Widget>{
    0: Text('Movies'),
    1: Text('Tv Shows')
  };

  final Map<int, Widget> icons = <int, Widget>{
    0: UpComingMoviesPage(),
    1: UpComingMoviesPage(),
  };

  int sharedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
        ),
        SizedBox(
          width: 500.0,
          child: CupertinoSegmentedControl<int>(
            children: _segmentedItems,
            onValueChanged: (int val) {
              setState(() {
                sharedValue = val;
              });
            },
            groupValue: sharedValue,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              child: icons[sharedValue],
            ),
          ),
        ),
      ],
    );
  }
}
