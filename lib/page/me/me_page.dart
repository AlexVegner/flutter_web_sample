import 'package:flutter/widgets.dart';
import 'package:web_app/widget/common_scaffold.dart';

class MePage extends StatefulWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  State<MePage> createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  @override
  Widget build(BuildContext context) {
    return const CommonScaffold(
      // title: 'My profile',
      body: Center(),
    );
  }
}
