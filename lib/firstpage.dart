import 'package:flutter/material.dart';
import 'package:flutter_mentor_quiz_app_tut/home.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flutter Quiz App"),
      ),
      body: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height / 2,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://png.pngtree.com/png-vector/20220525/ourmid/pngtree-comic-speech-bubbles-with-text-quiz-png-image_4729130.png"),
                    fit: BoxFit.cover),
              ),
              child: Text("")),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.green),
                child: Center(
                    child: Text(
                  "Start New Quiz",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
