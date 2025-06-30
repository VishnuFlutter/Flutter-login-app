// ignore: file_names
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_with_login/homepage.dart';
import 'package:splash_with_login/login.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}


class _SplashscreenState extends State<Splashscreen> {
@override
  void initState() {
    super.initState();
    _gotoLogin();
    
  }
  void _gotoLogin() async
  {
    await Future.delayed(Duration(seconds: 3));
    SharedPreferences sp =await SharedPreferences.getInstance();
    bool status = sp.getBool('islogin')??false;
    if(status == true)
    {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()),);
    }
    else
    {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage()),);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Butterfly.gif'),
          radius: 70,
        ),
        
      ),
    
    );
  }
}
