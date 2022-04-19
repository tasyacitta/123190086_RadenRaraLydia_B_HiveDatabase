import 'package:b_123190086_hive/models/boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/regis.dart';
import 'login.dart';

void main() async{
  Hive.initFlutter();
  Hive.registerAdapter(RegisAdapter());
  await Hive.openBox<Regis>(HiveBoxex.regis);
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: '123190086_RadenRaraLydia',
    theme: ThemeData(

    primarySwatch: Colors.blue,
    ),
    home: Login(),
    );
  }
}
