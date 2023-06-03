import 'package:briannamutali/widgets/footer.dart';
import 'package:flutter/material.dart';

import '../models/software.dart';
import '../routes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/softwareSection.dart';

class SoftwareListing extends StatelessWidget {
  const SoftwareListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      "Software",
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
                          " Software",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(softwares.length, (index) {
                        Software software = softwares[index];
                        bool isEven = index % 2 != 0;

                        return SoftwareListItem(
                          software: software,
                          isEven: isEven,
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
