import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mentor_quiz_app_tut/firstpage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_mentor_quiz_app_tut/home.dart';

class Signup extends StatelessWidget {
  // Signin({Key key}) : super(key: key);

  TextEditingController emailcontrolar = TextEditingController();

  TextEditingController passwordcontrolar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        centerTitle: true,
        title: Text(" Sign Up"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUVb32qW6uL2XJYlz6yhkPSwQqiAgl9I78GQ&usqp=CAU",
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 4,
                isAntiAlias: false,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: emailcontrolar,
                decoration: InputDecoration(
                    hintText: "xyz@gmail.com",
                    label: Text(
                      "E-mail",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: passwordcontrolar,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "...........",
                    label: Text(
                      "Password",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailcontrolar.text,
                      password: passwordcontrolar.text,
                    )
                        .then((value) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Firstpage()));
                    });
                    Fluttertoast.showToast(
                        msg: "Account Created Succesfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                      Fluttertoast.showToast(
                          msg: " The password provided is too weak",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                      Fluttertoast.showToast(
                          msg: " The account already exists for that email.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(color: Colors.red)),
                  child: Row(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      child: Image.network(
                          "https://mailmeteor.com/logos/assets/PNG/Gmail_Logo_256px.png"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Sign UP with E-Mail",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
