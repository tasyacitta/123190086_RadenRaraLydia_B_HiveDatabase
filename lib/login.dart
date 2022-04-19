import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'regis_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late Box box1;


  @override
  void initState(){
    super.initState();
    check_already_login();
  }
  void check_already_login() async{
    box1 = await Hive.openBox('regis');
    getData();
  }

  void getData() async{
    if(box1.get('username')!=null){
      _usernameController.text = box1.get('username');
      setState(() {

      });
    }
    if(box1.get('password')!=null){
      _passwordController.text = box1.get('username');
      setState(() {

      });
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(70),

            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  autocorrect: false,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Username",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  autocorrect: false,
                  textAlign: TextAlign.start,
                  textAlignVertical: TextAlignVertical.center,
                  textCapitalization: TextCapitalization.none,

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Password",
                  ),
                ),
                SizedBox(
                    height: 20
                ),
                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                    },
                    child: Text("LOGIN"),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 30,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => RegisScreen()));
                    },
                    child: Text("Register"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      );
    }


    }
