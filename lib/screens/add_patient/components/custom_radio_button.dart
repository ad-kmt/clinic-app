import 'package:flutter/material.dart';
import 'package:my_clinic_app/constants.dart';
import 'package:my_clinic_app/size_config.dart';

class CustomRadioButton extends StatelessWidget {
  final RadioModel item;
  CustomRadioButton(this.item);

  @override
  Widget build(BuildContext context) {
    return item.isSelected ? buildSelectedButton() : buildUnselectedButton();
  }

  Widget buildUnselectedButton() {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(color: kCardBorder)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Text(
        item.text,
        style: TextStyle(color: kTextLight2, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget buildSelectedButton() {
    return Container(
      alignment: Alignment.center,
      decoration:
          BoxDecoration(color: kColor2, border: Border.all(color: kColor2)),
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(8),
          vertical: getProportionateScreenHeight(8)),
      child: Text(
        item.text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
      ),
    );
  }

  Widget buildOld() {
    return Container(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(8),
            vertical: getProportionateScreenHeight(8)),
        child: Text(
          item.text,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ));
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
