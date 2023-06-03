import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../routes.dart';
import 'contactBtn.dart';

class CustomAppBar extends StatelessWidget {
  final bool? isShrink;

  const CustomAppBar({Key? key, this.isShrink}) : super(key: key);

  choiceAction(BuildContext context, String choice) {
    switch (choice) {
      case "SOFTWARE":
        CustomRoutes.router.navigateTo(context, "/software");
        break;
      case "ART":
        CustomRoutes.router.navigateTo(context, "/art");
        break;
      case "ENGINEERING":
        CustomRoutes.router.navigateTo(context, "/engineering");
        break;
      case "SERVICES":
        CustomRoutes.router.navigateTo(context, "/services");
        break;
      case "CONTACT":
        launch("tel:+254706951310");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.isMobile || sizingInformation.isTablet;

        return AnimatedContainer(
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
              color: isShrink! ? Colors.grey.shade200 : Colors.transparent),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => CustomRoutes.router.navigateTo(context, "/"),
                  child: Text(
                    "bn",
                    style: GoogleFonts.fredokaOne(
                        color: Colors.black, fontSize: 30.0),
                  ),
                ),
                isMobile
                    ? PopupMenuButton<String>(
                        icon: Icon(
                          Icons.menu,
                          color: isShrink! ? Colors.black : Colors.white,
                          //size: 25.0,
                        ),
                        offset: const Offset(0.0, 10.0),
                        onSelected: (v) {
                          choiceAction(context, v);
                        },
                        itemBuilder: (BuildContext context) {
                          return [
                            "SOFTWARE",
                            "ART",
                            "ENGINEERING",
                            "SERVICES",
                            "CONTACT"
                          ].map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      )
                    : Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () => CustomRoutes.router
                                  .navigateTo(context, "/software"),
                              child: const Text(
                                "SOFTWARE",
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () => CustomRoutes.router
                                  .navigateTo(context, "/art"),
                              child: const Text(
                                "ART",
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () => CustomRoutes.router
                                  .navigateTo(context, "/engineering"),
                              child: const Text(
                                "ENGINEERING",
                                style: TextStyle(color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () => CustomRoutes.router
                                  .navigateTo(context, "/services"),
                              child: const Text(
                                "SERVICES",
                                style: TextStyle(color: Colors.black),
                              )),
                          const ContactButton(
                            color: Colors.black,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
