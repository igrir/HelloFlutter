import 'dart:html';

import 'package:flutter/material.dart';
import 'package:helloflutter/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           "Cuanki".toUpperCase(),
            style: Theme.of(context).textTheme.headline1.copyWith(
              color: kTextColor,
              fontWeight: FontWeight.bold)),
          Text(
            "Mari membeli cuanki di taman ini\nkarena kini cuanki hadir dengan\nbakmi xixixi",
            style: TextStyle(
              fontSize: 21,
              color: wTextColor.withOpacity(0.8)
            ),),
          FittedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF372930),
                borderRadius: BorderRadius.circular(80)
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF372930),
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Text(
                    "Bergabung".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ),
          ),
          Text("Website ini terjadi berkat tutorial:"),
          Link(Label: "Video ini", URL: "https://www.youtube.com/watch?v=E6fLm5XlJDY&ab_channel=TheFlutterWay"),
          Link(Label: "Plugin ini", URL: "https://pub.dev/packages/url_launcher/install"),
          Link(Label: "Cara ngepublish di Netlify", URL: "https://medium.com/@D10100111001/flutter-web-netlify-continuous-deployment-the-right-way-in-2-minutes-f2ed4a4fcbf7"),

        ],
      ),
    );
  }
}

class Link extends StatelessWidget {
  final String Label;
  final String URL;
  const Link({Key key, this.Label, this.URL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("Test kirim" + URL);
        openURL(URL);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          Label,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline
          ),),
      ),
    );
  }

  Future<void> openURL(String url) async {
    await launch(url);
  }
}
