import 'package:flutter_insta/flutter_insta.dart';
import 'package:insta/model/MyUser.dart';

Future<MyUser> connexion(String username) async {
  FlutterInsta flutterInsta = new FlutterInsta();
  await flutterInsta.getProfileData(username); //instagram username

  /*print("Username : ${flutterInsta.username}");
  print("Followers : ${flutterInsta.followers}");
  print("Folowing : ${flutterInsta.following}");
  print("Bio : ${flutterInsta.bio}");
  print("Website : ${flutterInsta.website}");
  print("Profile Image : ${flutterInsta.imgurl}");*/

  return MyUser(
    name: flutterInsta.username,
    followers: flutterInsta.followers,
    following: flutterInsta.following,
    bio: flutterInsta.bio,
  );
}
