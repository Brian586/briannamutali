import 'package:briannamutali/models/software.dart';
import 'package:briannamutali/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../routes.dart';

class SoftwareSection extends StatelessWidget {
  const SoftwareSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000.0, minWidth: 600.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Software Development",
                  style: Theme.of(context).textTheme.headline5),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Here are some of the sucessful software I've built"),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(softwares.length, (index) {
                Software software = softwares[index];
                bool isEven = index % 2 != 0;

                return index > 2
                    ? Container()
                    : SoftwareListItem(
                        software: software,
                        isEven: isEven,
                      );
              }),
            ),
            SizedBox(
              width: 100.0,
              child: CustomButton(
                title: "SEE ALL",
                color: Colors.grey,
                onTap: () {},
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const LanguageUsed(),
            const Features()
          ],
        ),
      ),
    );
  }
}

class SoftwareListItem extends StatelessWidget {
  final Software? software;
  final bool? isEven;

  const SoftwareListItem({Key? key, this.software, this.isEven})
      : super(key: key);

  Widget buildPreview(BuildContext context, Size size, bool isNotSquare) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 10.0,
      child: Image.asset(
        software!.preview!,
        width: size.width,
        //height: size.height * 0.6,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  Widget buildDescription(BuildContext context, Size size, bool isNotSquare) {
    return SizedBox(
      height: size.height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            isEven! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildIcon(isNotSquare),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                software!.name!,
                style: Theme.of(context).textTheme.headline6,
              )
            ],
          ),
          Text(software!.description!),
          isEven!
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    CustomButton(
                      title: "Learn More",
                      color: Colors.grey,
                      onTap: () => CustomRoutes.router
                          .navigateTo(context, "/software/${software!.id!}"),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      title: "Learn More",
                      color: Colors.grey,
                      onTap: () => CustomRoutes.router
                          .navigateTo(context, "/software/${software!.id!}"),
                    ),
                    const SizedBox()
                  ],
                )
        ],
      ),
    );
  }

  Widget buildIcon(bool isNotSquare) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3.0,
              spreadRadius: 3.0,
              offset: const Offset(2.0, 3.0))
        ],
        color: isNotSquare ? Colors.black : Colors.transparent,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isNotSquare ? 0.0 : 10.0),
        child: Image.asset(
          software!.icon!,
          height: 70.0,
          width: isNotSquare ? 100.0 : 70.0,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget desktopLayout(BuildContext context, Size size, bool isNotSquare) {
    return Row(
      children: isEven!
          ? [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: buildDescription(context, size, isNotSquare),
                ),
              ),
              Expanded(
                flex: 6,
                child: buildPreview(context, size, isNotSquare),
              ),
            ]
          : [
              Expanded(
                flex: 6,
                child: buildPreview(context, size, isNotSquare),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: buildDescription(context, size, isNotSquare),
                ),
              )
            ],
    );
  }

  Widget mobileLayout(BuildContext context, Size size, bool isNotSquare) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        buildPreview(context, size, isNotSquare),
        const SizedBox(
          height: 10.0,
        ),
        buildDescription(context, size, isNotSquare)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isNotSquare =
        software!.name! == "iVICTIM" || software!.name! == "Afriblox";

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.isMobile || sizingInformation.isTablet;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: SizedBox(
            width: size.width,
            child: isMobile
                ? mobileLayout(context, size, isNotSquare)
                : desktopLayout(context, size, isNotSquare),
          ),
        );
      },
    );
  }
}

class Features extends StatelessWidget {
  const Features({Key? key}) : super(key: key);

  Widget buildDesktop(BuildContext context, Size size, List<String> features) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000.0, minWidth: 600.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Features ",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(features.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(features[index] + " -"),
                        );
                      }))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/software/clip1.png",
              height: size.height * 0.8,
              width: size.width,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMobile(BuildContext context, Size size, List<String> features) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/software/clip1.png",
          //height: size.height * 0.8,
          width: size.width,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Features ",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: List.generate(features.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text("- " + features[index]),
                  );
                }))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> features = [
      "User Authentication (Login/Signup)",
      "Google Maps",
      "Payment System (eg M-Pesa, FlutterWave)",
      "Messaging and Notifications",
      "USSD Integration",
      "Bulk SMS",
      "Ads"
    ];

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.isMobile || sizingInformation.isTablet;

        return isMobile
            ? buildMobile(context, size, features)
            : buildDesktop(context, size, features);
      },
    );
  }
}

class LanguageUsed extends StatelessWidget {
  const LanguageUsed({Key? key}) : super(key: key);

  Widget buildDesktop(Size size) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000.0, minWidth: 600.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              "assets/software/flutter.png",
              height: size.height * 0.8,
              width: size.width,
              fit: BoxFit.contain,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                  "I use Flutter for most of my software development. Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. "),
            ),
          )
        ],
      ),
    );
  }

  Widget buildMobile(Size size) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/software/flutter.png",
            //height: size.height * 0.8,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
              "I use Flutter for most of my software development. Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. "),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.isMobile || sizingInformation.isTablet;
        return isMobile ? buildMobile(size) : buildDesktop(size);
      },
    );
  }
}
