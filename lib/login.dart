import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_with_login/homepage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 350,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [Colors.lightBlue, Colors.green]),
          ),
          child: Column(
            children: [
              SizedBox(height: 20),

              //Login text
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              //username TextFormField
              Padding(
                padding: const EdgeInsets.all(10),

                child: TextFormField(
                  controller: txt1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
              ),

              //Password TextFormField
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: txt2,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    suffixIcon: Icon(Icons.password),
                  ),
                ),
              ),

              SizedBox(height: 25),

              //Elevated button
              ElevatedButton(
                onPressed: () async {
                  String username = txt1.text.trim();
                  String password = txt2.text.trim();

                  if (username.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Null field occured')),
                    );
                  } else {
                    final sp = await SharedPreferences.getInstance();
                    await sp.setString('username', username);
                    await sp.setBool('islogin',true);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },

                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ),

              //Textbutton forget password
              Row(
                children: [
                  SizedBox(width: 5),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'forget password',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(width: 70),
                  //Register button
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
