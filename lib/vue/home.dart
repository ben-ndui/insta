import 'package:flutter/material.dart';
import 'components/custom_dialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Center(
              child: Image.asset(
                'assets/background.png',
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.only(top: size.height / 2),
              child: TextButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (BuildContext context){
                        return CustomDialogBox(
                          title: "Entre un ID instagram",
                          descriptions: "",
                          text: "Tout est bon",
                        );
                      }
                  );
                },
                child: Text(
                  "Me connecter",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
