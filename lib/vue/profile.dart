import 'package:flutter/material.dart';
import 'package:insta/model/MyUser.dart';

class Profile extends StatefulWidget {
  final MyUser user;

  const Profile({Key key, this.user}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            child: ListTile(title: Center(child: Text(widget.user.name, style: TextStyle(fontSize: 25),))),
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Container(
              width: 70,
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2,
                    spreadRadius: 2,
                  )
                ],
                borderRadius: BorderRadius.circular(200),
              ),
              child: Text(widget.user.followers),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(200),
            ),
            child: Text(widget.user.following),
          ),
          SizedBox(
            height: 20,
          ),
          Container(child: Text(widget.user.bio), width: size.width, alignment: Alignment.center,)
        ],
      ),
    );
  }
}
