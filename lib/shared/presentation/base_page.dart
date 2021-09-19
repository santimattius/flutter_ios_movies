import 'package:flutter/cupertino.dart';

abstract class BaseCupertinoPage extends StatelessWidget {
  const BaseCupertinoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title()),
      ),
      child: SafeArea(child: Container(child: content(context))),
    );
  }

  String title();

  Widget content(BuildContext context);
}
