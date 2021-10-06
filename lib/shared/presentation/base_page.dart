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
        trailing: CupertinoButton(
          child: Icon(CupertinoIcons.settings),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Flutter iOS Movies'),
                content: const Text('Testing Cupertino widgets on Flutter'),
                actions: <CupertinoDialogAction>[
                  CupertinoDialogAction(
                    child: const Text('Accept'),
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
      child: SafeArea(child: Container(child: content(context))),
    );
  }

  String title();

  Widget content(BuildContext context);
}
