import 'package:flutter/material.dart';
import 'package:helloflutter/constant.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.5)),
        ],
      ),
      child: Row(
        children: [
          Image.asset("assets/images/flutter.png", height: 25),
          SizedBox(width: 5),
          Text(
            "CuanKey",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          MenuItem(
            title: "Home",
            press: () {
              _showMyDialog(context, "Rumahku istanaku", "Ini adalah Home");
            },
          ),
          MenuItem(
            title: "About",
            press: () {
              _showMyDialog(context, "Ini apa sih", "Ya.. ini about gitu deh");
            },
          ),
          MenuItem(
            title: "Pricing",
            press: () {
              _showMyDialog(context, "Mari lihat harga cuanki",
                  "Apa sih yang kamu harapkan dari pricing cuanki, paling 5000an");
            },
          ),
          MenuItem(
            title: "Career",
            press: () {
              _showMyDialog(context, "Ingin menjadi mang cuanki?",
                  "Mari bergabung menjadi pedagang cuanki");
            },
          ),
          MenuItem(
            title: "Login",
            press: () {
              _showMyDialog(context, "Login", "Login agar bisa ikut berdagang");
            },
          ),
          DefaultButton(
            title: "Bergabung",
            press: () {
              _showMyDialog(context, "Gabung Jadi Mamang CuanKey", "Rebus indomie dalam kuahnya beserta plastik bungkusnya");
            }),

        ],
      ),
    );
  }

  Future<void> _showMyDialog(
      BuildContext context, String title, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text(text)],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class DefaultButton extends StatelessWidget {
  final String title;
  final Function press;
  const DefaultButton({
    Key key, this.title, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 0, 0, 0)),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 20, horizontal: 50)
          ),
          textStyle: MaterialStateProperty.all(
              TextStyle(
                  fontWeight: FontWeight.bold
              )
          ),
        ),
        onPressed: press,
        child: Text(this.title.toUpperCase())),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final Function press;

  const MenuItem({
    Key key,
    this.title,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(title.toUpperCase(),
            style: TextStyle(
                color: kTextColor.withOpacity(0.3),
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
