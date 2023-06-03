import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class WhatsappButton extends StatelessWidget {
  const WhatsappButton({Key? key}) : super(key: key);

  openwhatsapp() async {
    var whatsapp = "+254702846342";
    var whatsappURl_android = "https://wa.me/$whatsapp?text=hello";
    //"whatsapp://send?phone=" + whatsapp + "&text=hello";
    var whatappURL_ios = "https://wa.me/$whatsapp?text=${Uri.parse("hello")}";

    // android , web
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      Fluttertoast.showToast(msg: "Could not launch WhatsApp");
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: openwhatsapp,
      child: Image.asset(
        "assets/social/wa.png",
        height: 50.0,
        width: 50.0,
        fit: BoxFit.contain,
      ),
    );
  }
}
