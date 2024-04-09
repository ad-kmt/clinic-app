import 'package:flutter/material.dart';
import 'package:my_clinic_app/size_config.dart';


class SplashContent extends StatelessWidget {
  const SplashContent(
      {Key key, this.textOne, this.textTwo, this.textThree, this.image})
      : super(key: key);
  final String textOne, textTwo, textThree, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          textOne,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(24),
          ),
        ),
        Text(
          textTwo,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(24),
              fontWeight: FontWeight.bold),
        ),
        Text(
          textThree,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(24),
          ),
        ),
        Spacer(

        ),
        Image.asset(
          image,
          height: getProportionateScreenHeight(300),
          width: getProportionateScreenWidth(350),
        ),
        Spacer(),
      ],
    );
  }
}
