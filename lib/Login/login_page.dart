import 'package:firebase/Constant/Screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  //  final VoidCallback onClickedSignUp;
  const Login({
    Key? key,
    // required this.onClickedSignUp
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: Screens.padingHeight(context) * 0.08,
                width: Screens.width(context) * 0.5,
              ),
              Positioned(
                right: Screens.width(context) * 0.08,
                child: Container(
                  height: Screens.padingHeight(context) * 0.08,
                  width: Screens.width(context) * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                right: Screens.width(context) * 0.01,
                child: Container(
                  height: Screens.padingHeight(context) * 0.08,
                  width: Screens.width(context) * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: Screens.width(context) * 0.06,
                child: Container(
                  height: Screens.padingHeight(context) * 0.08,
                  width: Screens.width(context) * 0.5,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: Screens.padingHeight(context) * 0.04,
          ),
          Text(
            "Login",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: Screens.padingHeight(context) * 0.04,
          ),
          Container(
            height: Screens.padingHeight(context) * 0.08,
            width: Screens.width(context) * 0.9,
            child: TextFormField(decoration: inputdecoration("Email id...")),
          ),
          SizedBox(height: Screens.padingHeight(context) * 0.02),
          Container(
            height: Screens.padingHeight(context) * 0.08,
            width: Screens.width(context) * 0.9,
            child: TextFormField(
              decoration: inputdecoration("Password..."),
            ),
          ),
          SizedBox(height: Screens.padingHeight(context) * 0.04),
          GestureDetector(
            child:Text("Forgot Password", style: TextStyle(
                decoration: TextDecoration.underline,
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 14,
              ),) 
            
          ),
          SizedBox(height: Screens.padingHeight(context) * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Expanded(
                child: Divider(
                  indent: 20.0,
                  endIndent: 10.0,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
              Text(
                "do you have an account?",
                style: TextStyle(color: Colors.blueGrey),
              ),
              Expanded(
                child: Divider(
                  indent: 10.0,
                  endIndent: 20.0,
                  thickness: 1,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(height: Screens.padingHeight(context) * 0.04),
          RichText(text: TextSpan(
            recognizer: TapGestureRecognizer(),
            text: 'SignUp',
            style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Theme.of(context).colorScheme.secondary)
          ))
        ],
      )),
    );
  }

  InputDecoration? inputdecoration(String hintText) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14),
        border: OutlineInputBorder());
  }
}
