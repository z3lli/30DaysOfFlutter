import 'package:flutter/material.dart';
import 'package:pubguc/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/drag.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "PUBG UC SHOP $name",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: "USER", hintText: "Enter UserName"),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "PASS", hintText: "Enter Password"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      setState(() {
                        changebutton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.homeRoute);
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      width: changebutton ? 50 : 150,
                      height: 50,
                      alignment: Alignment.center,
                      child: changebutton
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text("Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          // shape: changebutton
                          //     ? BoxShape.circle
                          //     : BoxShape.rectangle,

                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 8)),
                    ),
                  )
                  // ElevatedButton(
                  //   onPressed: (() {
                  //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                  //   }),
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //       foregroundColor: Colors.white,
                  //       minimumSize: Size(150, 40)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
