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
    //var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100),
            child: ListTile(
              title: Center(
                child: Text(
                  widget.user.name,
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(widget.user.bio),
                alignment: Alignment.center,
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
                child: Text(widget.user.followers),
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
            ],
          )
        ],
      ),
    );
  }
}
