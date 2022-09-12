import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'Constant/Screen.dart';
import 'Constant/utils.dart';
import 'Login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool noInternet = false;


@override
void initState(){
  connectivityAlert();
  showConnection();
  super.initState();

}
fetchData(){
// Navigator.of(context).pushAndRemoveUntil(
//               MaterialPageRoute(builder: (context) => Login()),
//               (route) => false);
}


StreamSubscription? subscription;
  connectivityAlert() {
    subscription = Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        final hasInternet = event != ConnectivityResult.none;
        print(hasInternet);
        if (hasInternet == true) {
          setState(() {
            noInternet = false;
            fetchData();
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
          });
        } else {
          Utils.showTopSnackBar(context, "You have no internet", Colors.red);
          setState(() {
            noInternet = true;
          });
        }
      });
    });
  }

  void showConnection() async {
    final result = await Connectivity().checkConnectivity();
    final hasInternet = result != ConnectivityResult.none;
    if (hasInternet == false) {
      setState(() {
        noInternet = true;
        // visibileprogress = false;
      });
      const snackBar = SnackBar(
        duration: Duration(days: 1),
        backgroundColor: Colors.red,
        content: Text(
          "You Have No Internet Please Check!!..",
          style: TextStyle(),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      noInternet = false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Stack(
          children: [
            Container(
              height: Screens.padingHeight(context),
              width: Screens.width(context),
            ),
            Positioned(
              top: Screens.padingHeight(context) * 0.45,
              right: Screens.width(context) * 0.43,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.centers,
                children: <Widget>[
                  Text("Logo"),
                  CircularProgressIndicator(),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
