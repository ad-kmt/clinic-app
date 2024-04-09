import 'package:flutter/material.dart';

import '../../constants.dart';

class CardDividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      height: 1,
      color: kCardDivider,
    );
  }
}
