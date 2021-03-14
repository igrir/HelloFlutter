import 'package:flutter/material.dart';
import 'package:helloflutter/components/body.dart';
import 'package:helloflutter/components/customappbar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/yupre.png"),
              fit: BoxFit.cover
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomAppBar(),
            Spacer(),
            Body(),
            Spacer(flex: 2)
          ],
        )
      ),
    );
  }
}
