import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/footer.dart';

class ServicesListing extends StatelessWidget {
  const ServicesListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> services = [
      "App Design & Development",
      "Web Design & Development",
      "Desktop Software Development",
      "Domain provision",
      "Publishing apps on playstore",
      "Poster and Logo Design"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60.0),
        child: const CustomAppBar(isShrink: true),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ConstrainedBox(
                constraints:
                    const BoxConstraints(maxWidth: 1000.0, minWidth: 600.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Services",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () =>
                              CustomRoutes.router.navigateTo(context, "/"),
                          child: Text(
                            "Home ",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 12.0,
                        ),
                        Text(
                          " Services",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("The services I offer include:"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(services.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(services[index]),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}
