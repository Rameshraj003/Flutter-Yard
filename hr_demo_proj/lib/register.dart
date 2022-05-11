import 'package:flutter/material.dart';
import 'package:hr_demo_proj/widgets/app_bar_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(const Register_Page());

class Register_Page extends StatelessWidget {
  
  const Register_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Dashboard';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     
      home: Scaffold(
        drawer: app_bar_menu(),
        appBar: AppBar(
           title: const Text(appTitle),
        ),
        body: const SafeArea(
          child: MyCustomForm(),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email='';
  String password='';
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('images/bitlogo.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
               onChanged: (value){
                email=value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                labelText: 'Username',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              obscureText: true,
              onChanged: (value){
                password=value;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
                onPressed: () async {
                  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
                },
                child: const Text("Register")),
          ),
        ],
      ),
    );
  }
}
