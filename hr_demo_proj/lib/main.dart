import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hr_demo_proj/globals/searchbar.dart';
import 'package:hr_demo_proj/widgets/app_bar_menu.dart';
import 'dashboard.dart';
import 'get_details.dart';
import 'register.dart';
import 'update_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCvywI0g97SG96m8JmVN4XGxnmgv0zC1BE",
      appId: "1:159734175993:android:25448a53a0a102042e6a28",
      messagingSenderId: "159734175993",
      projectId: "fir-flutter-aa156",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Dashboard';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue,
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

    String error = "No user found";
    String email = '';
    String password = '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.all(Radius.circular(10))),
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
                Container(
                  width: 400,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      obscureText: true,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                                  email: email, password: password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  AllUsers(title: 'Dashboard',)),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found');
                            Scaffold.of(context).showSnackBar(
                                const SnackBar(content: Text("No user found")));
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                            Scaffold.of(context).showSnackBar(const SnackBar(
                                content: Text("Wrong password")));
                          }
                        }
                      },
                      child: const Text("Login")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => update_details()) ,
                        );
                      },
                      child: const Text("Update")),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Register_Page()),
                        );
                      },
                      child: const Text("Register")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}