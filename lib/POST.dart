import 'package:flutter/material.dart';
import 'POST_RESULT.dart';

class PostAPI extends StatefulWidget {
  @override
  _PostAPIState createState() => _PostAPIState();
}

class _PostAPIState extends State<PostAPI> {
  PostResult postResult;
  final textInputApiNama = TextEditingController();
  final textInputApijob = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('API POST'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text(
                (postResult != null)
                    ? postResult.name + postResult.job
                    : "Tidak Ada Data",
              ),
              TextField(
                controller: textInputApiNama,
              ),
              TextField(
                controller: textInputApijob,
              ),
              RaisedButton(
                onPressed: () {
                  PostResult.connectToAPI(
                          textInputApiNama.text, textInputApijob.text)
                      .then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text(" POST "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
