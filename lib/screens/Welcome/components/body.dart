import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_app/components/rounded_button.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/screens/Welcome/components/background.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../login_page.dart';
import '../../signup_page.dart';
import '../../../style.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //This size provide us total height and width of our screen
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              "WELCOME TO OBINNA'S LANDING PAGE \n YOUR PLUG FOR ANYTHING ANYTHING",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ),
          SvgPicture.asset(
            "assets/icons/chat.svg",
            height: size.height * 0.45,
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondRoute()));
            },
          ),
          RoundedButton(
            text: "SIGNUP",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignUp()));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SocialIcon(
                iconSrc: "assets/icons/facebook.svg",
                press: _launchFacebookURL,
              ),
              SocialIcon(
                iconSrc: "assets/icons/twitter.svg",
                press: _launchTwitterURL,
              ),
              SocialIcon(
                iconSrc: "assets/icons/google-plus.svg",
                press: (){}
              ),
            ],
          )
        ],
      ),
    );
  }

  _launchTwitterURL() async {
    const url = 'hhtps://twitter.com/thatManDonald?s=08';
    if (await canLaunch(url)) {
      await launch(Uri.encodeFull(url));
    } else {
      throw 'could not launch $url';
    }
  }
}
  _launchFacebookURL() async {
    const url = 'hhtps://www.facebook.com/donald.amadi.963';
    if (await canLaunch(url, )) {
      await launch(Uri.encodeFull(url));
    } else {
      throw 'could not launch $url';
    }
  }


class SocialIcon extends StatelessWidget {
  final String iconSrc;
  final Function press;
  const SocialIcon({
    Key key,
    this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: kPrimaryColor),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconSrc,
          height: 20,
          width: 20,
        ),
      ),
    );
  }
}
