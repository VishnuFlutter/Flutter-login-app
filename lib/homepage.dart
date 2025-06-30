import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_with_login/splashScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = 'no name'; // make it accessible to the UI

  @override
  void initState() {
    super.initState();
    identifyUser(); // call async function without making initState async
  }

  Future<void> identifyUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? usr = sp.getString('username') ?? 'no name';
    setState(() {
      username = usr;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home Page',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async{
                SharedPreferences sp = await SharedPreferences.getInstance();
                await sp.clear();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => Splashscreen()));
              },
              child: const Text('Logout', style: TextStyle(color: Colors.blue)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 380,
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
              child: Text(
                'Hi $username Welcome to flutter',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
