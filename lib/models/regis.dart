import 'package:hive/hive.dart';
import 'package:b_123190086_hive/regis_screen.dart';
part 'regis.g.dart';

@HiveType(typeId:0)
class Regis extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? username;

  @HiveField(2)
  String? password;

  Regis({
    required this.username,
    required this.password,

    });
}