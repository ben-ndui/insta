import 'package:flutter/material.dart';
import 'package:insta/controller/data_funcs.dart';
import 'package:insta/model/MyUser.dart';
import 'package:insta/vue/profile.dart';

import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final TextEditingController _controller = TextEditingController();
  String username = "";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              TextField(
                controller: _controller,
                onChanged: (String value) {
                  this.username = value;
                },
                onSubmitted: (String value) async {
                  MyUser user = await connexion(this.username);
                  if (user != null) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Profile(),
                      ),
                    );
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID instagram',
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () async {
                    MyUser user = await connexion(this.username);
                    if (user == null) {
                      return null;
                    }else{
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Profile(user: user,),
                        ),
                      );
                    }
                  },
                  child: Text(
                    widget.text,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: Constants.avatarRadius,
            child: ClipRRect(
              borderRadius:
                  BorderRadius.all(Radius.circular(Constants.avatarRadius)),
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.black26,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
