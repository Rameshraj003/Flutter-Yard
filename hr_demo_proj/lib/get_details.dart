import 'package:flutter/material.dart';

import 'controller/form_controller.dart';
import 'form.dart';

class FeedbackListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AllUsers(title: "Responses"));
  }
}

class AllUsers extends StatefulWidget {
     

  AllUsers({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _AllUsersState createState() => _AllUsersState();
}

class _AllUsersState extends State<AllUsers> {
  List<FeedbackForm> feedbackItems = <FeedbackForm>[];
TextEditingController editingController = TextEditingController();

  final duplicateItems = <FeedbackForm>[];
  // Method to Submit Feedback and save it in Google Sheets

  @override
  void initState() {
    super.initState();

    FormController().getFeedbackList().then((feedbackItems) {
      setState(() {
        this.feedbackItems = feedbackItems;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: SingleChildScrollView(
          
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                  

              itemCount: feedbackItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(Icons.person),
                      Expanded(
                        child: Text(
                            "${feedbackItems[index].Roll_Number}  ${feedbackItems[index].Name}"),
                      )
                    ],
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.airplay_rounded),
                      Expanded(
                        child: Text(feedbackItems[index].Skill),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
