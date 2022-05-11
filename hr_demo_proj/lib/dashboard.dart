import 'package:flutter/material.dart';
import 'package:hr_demo_proj/widgets/app_bar_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() => runApp(const dashboard());

class dashboard extends StatelessWidget {
  const dashboard({Key? key, u_mail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        drawer: app_bar_menu(),
        appBar: AppBar(
        
          title: const Text(appTitle),
        ),
        body: const SafeArea(
          child: dashboard_items(),
        ),
      ),
    );
  }
}

class dashboard_items extends StatelessWidget {
  const dashboard_items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        SizedBox(
          height: 150,
          width: 150,
          child: Card(
          
            elevation: 5,
            child: Padding(
              
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                   'Password',
                ),
              ),
          ),
        ),
         SizedBox(
           height: 150,
           width: 150,
           child: Card(
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Text(
                   'Password',
                ),
              ),
        ),
         ),
      
      ],
    );
  }
}
