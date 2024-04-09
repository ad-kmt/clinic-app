import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  BodyState createState() => new BodyState();
}

class BodyState extends State<Body> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://api.doroad.in/frontendClient/homeslide"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      data = json.decode(response.body);
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfilePic(),
        SizedBox(
          height: 20,
        ),
        // Container(
        //   height: 300,
        //   child: ListView.builder(
        //       padding: const EdgeInsets.all(8),
        //       itemCount: data == null ? 0 : data.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Container(
        //             padding: const EdgeInsets.all(8),
        //             margin: const EdgeInsets.all(8),
        //             decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(10.0),
        //               color: Colors.blueGrey.shade100,
        //             ),
        //             child: Row(
        //
        //               children: [
        //                 Image.network(
        //                   data[index]["product_image"],
        //                   loadingBuilder: (context, child, progress) {
        //                     return progress == null
        //                         ? child
        //                         : LinearProgressIndicator();
        //                   },
        //                   height: 50,
        //                 ),
        //                 Column(
        //                   children: [
        //                     Text(
        //                       '${data[index]["vendor"]["vendor_name"]}',
        //                       textAlign: TextAlign.left,
        //                     ),
        //                     Text(
        //                       '${data[index]["description"]}',
        //                       textAlign: TextAlign.left,
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ));
        //       }),
        // ),
        ProfileMenu(
          icon: "assets/icons/Heart Icon.svg",
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Heart Icon.svg",
          text: "Notification",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Heart Icon.svg",
          text: "Settings",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Heart Icon.svg",
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Heart Icon.svg",
          text: "Log Out",
          press: () {},
        ),
      ],
    );
  }
}
