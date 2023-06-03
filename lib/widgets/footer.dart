import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_vm.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common.dart';
import '../routes.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const FooterMobile(),
      tablet: (BuildContext context) => const FooterMobile(),
      desktop: (BuildContext context) => const FooterDesktop(),
      watch: (BuildContext context) => Container(color: Colors.white),
    );
  }
}

class FooterDesktop extends StatelessWidget {
  const FooterDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey.shade100,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [MenuList(), ContactInfo(), SocialLinks()],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              TextRenderer(
                child: Text(
                  "\u00a9 Brian Namutali",
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                "All Rights Reserved.",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

class FooterMobile extends StatelessWidget {
  const FooterMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey.shade100,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            const MenuList(),
            const SizedBox(
              height: 30.0,
            ),
            const ContactInfo(),
            const SizedBox(
              height: 30.0,
            ),
            const SocialLinks(),
            const SizedBox(
              height: 30.0,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    "\u00a9 Brian Namutali",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "All Rights Reserved.",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SocialLinks extends StatelessWidget {
  const SocialLinks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("FOLLOW ME",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.grey, fontWeightDelta: 5)),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          height: 2.0,
          width: 40.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton.icon(
          icon: Image.asset(
            "assets/social/ig.png",
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Common.openUrl("https://instagram.com/yobra_586");
          },
          label: const Text(
            "Instagram",
          ),
        ),
        TextButton.icon(
          icon: Image.asset(
            "assets/social/fb.png",
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Common.openUrl("https://facebook.com/");
          },
          label: const Text(
            "Facebook",
          ),
        ),
        TextButton.icon(
          icon: Image.asset(
            "assets/social/tw.png",
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Common.openUrl("https://twitter.com/Brian5861");
          },
          label: const Text(
            "Twitter",
          ),
        ),
        TextButton.icon(
          icon: Image.asset(
            "assets/social/git.png",
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Common.openUrl("https://github.com/Brian586");
          },
          label: const Text(
            "GitHub",
          ),
        ),
        TextButton.icon(
          icon: Image.asset(
            "assets/social/in.png",
            height: 20.0,
            width: 20.0,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Common.openUrl(
                "https://www.linkedin.com/in/brian-namutali-2ab19a1a7/");
          },
          label: const Text(
            "LinkedIn",
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("CONTACT US",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.grey, fontWeightDelta: 2)),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          height: 2.0,
          width: 40.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton.icon(
          icon: const Icon(
            Icons.phone,
          ),
          onPressed: () => launch("tel:+254706951310"),
          label: const Text(
            "+254706951310",
          ),
        ),
        TextButton.icon(
          icon: const Icon(
            Icons.email_outlined,
          ),
          onPressed: () => launch("mailto:briannamutali586@gmail.com"),
          label: const Text(
            "briannamutali586@gmail.com",
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        //const PaymentInfo(),
      ],
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("MENU",
            style: Theme.of(context)
                .textTheme
                .headline6!
                .apply(color: Colors.grey, fontWeightDelta: 2)),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          height: 2.0,
          width: 40.0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextButton(
          onPressed: () {
            CustomRoutes.router.navigateTo(context, "/software");
          },
          child: const Text(
            "Software",
          ),
        ),
        TextButton(
          onPressed: () {
            CustomRoutes.router.navigateTo(context, "/art");
          },
          child: const Text(
            "Art",
          ),
        ),
        TextButton(
          onPressed: () {
            CustomRoutes.router.navigateTo(context, "/engineering");
          },
          child: const Text(
            "Engineering",
          ),
        ),
        TextButton(
          onPressed: () {
            CustomRoutes.router.navigateTo(context, "/services");
          },
          child: const Text(
            "Services",
          ),
        ),
      ],
    );
  }
}
