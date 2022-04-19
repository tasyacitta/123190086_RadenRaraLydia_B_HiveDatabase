import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'models/boxes.dart';
import 'models/regis.dart';

class RegisScreen extends StatefulWidget {
  const RegisScreen({Key? key}) : super(key: key);

  @override
  State<RegisScreen> createState() => _RegisScreenState();
}

class _RegisScreenState extends State<RegisScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  validated() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _onFormSubmit();
      print("Form Validated");
    } else {
      print("Form not Validated");
      return;
    }
  }
  late String username;
  late String password;

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
  void _onFormSubmit(){
    Box<Regis> regisBox = Hive.box<Regis>(HiveBoxex.regis);
    regisBox.add(Regis(username: username, password: password));
    Navigator.of(context).pop();
    print(regisBox);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: false,
                  decoration: InputDecoration(border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                    hintText: "Username",),
                  validator: (String? value){
                    if (value == null || value.trim().length ==0) {
                      return "Required";
                    }
                    return null;
                    },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                    autofocus: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Password",),
                    validator: (String? value){
                      if (value == null || value.trim().length ==0) {
                        return "Required";
                      }
                      return null;
                    },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 20,
                  width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  validated();
                },
                    child: Text("Register"))
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
