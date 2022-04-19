import 'package:b_123190086_hive/models/regis.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/boxes.dart';
class List extends StatefulWidget {
  final String username;
  const List({Key? key, required this.username}) : super(key: key);

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.username),
          centerTitle: true,
        ),
        body: ValueListenableBuilder(
    valueListenable:
    Hive.box<Regis>(HiveBoxex.regis).listenable(),
    builder: (context, Box<Regis> box, _){
    if(box.values.isEmpty){
    return Center(
    child: Text('Todo listing is Empty'),
    );
    }
    return ListView.builder(
    itemCount: box.values.length,
    itemBuilder: (context, index){
    Regis? res = box.getAt(index);
    child: ListTile(
    title: Text(res!.username),
    );
    },
    );
    }
    ),
    );
  }
}
