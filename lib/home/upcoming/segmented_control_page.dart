import 'package:flutter/cupertino.dart';

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
    0: ListPlaceHolder(),
    1: ListPlaceHolder(),
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
          child: Container(
            child: icons[sharedValue],
          ),
        ),
      ],
    );
  }
}

class ListPlaceHolder extends StatelessWidget {
  final List<String> entries = <String>['A', 'B', 'C'];
  final colorCodes = <CupertinoDynamicColor>[
    CupertinoColors.systemRed,
    CupertinoColors.systemBlue,
    CupertinoColors.systemGreen
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Container(
                  height: 200,
                  child: AspectRatio(
                    aspectRatio: 2 / 3,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500/MoEKaPFHABtA1xKoOteirGaHl1.jpg",
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Title"),
                            const Padding(padding: EdgeInsets.only(top: 8)),
                            Text("SubTitle"),
                            const Padding(padding: EdgeInsets.only(top: 8)),
                            Text("SubTitle"),
                            const Padding(padding: EdgeInsets.only(top: 8)),
                            Text("SubTitle")
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
