import 'package:flutter/material.dart';
import 'package:my_clinic_app/components/social_card.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/screens/sign_up/components/sign_up_form.dart';
import 'package:my_clinic_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.02,
              ),
              Text("Register Account", style: headingStyle),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              SignUpForm(),
              SizedBox(
                height: SizeConfig.screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialCard(
                    icon: "assets/icons/Heart Icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/Heart Icon.svg",
                    press: () {},
                  ),
                  SocialCard(
                    icon: "assets/icons/Heart Icon.svg",
                    press: () {},
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Text(
                "By continuing you confirm that you agree \nwith our Term and Condition",
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
