import 'package:cmp/utils/arguments.dart';
import 'package:flutter/material.dart';

class ModifyParishPage extends StatefulWidget {
  const ModifyParishPage({Key? key, required this.title, required this.id})
      : super(key: key);

  final String title;
  final int id;
  static const routeName = '/modify_parish';

  @override
  State<ModifyParishPage> createState() => _ModifyParishPageState();
}

class _ModifyParishPageState extends State<ModifyParishPage> {
  @override
  Widget build(BuildContext context) {
    // final arguments = ModalRoute.of(context).settings.arguments as Arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title + widget.id.toString()),
      ),
      body: Center(
        child: ListView(children: [
          const TextField(),
        ]),
      ),
    );
  }
}
