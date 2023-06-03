import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/footer.dart';

class ArtListing extends StatefulWidget {
  const ArtListing({Key? key}) : super(key: key);

  @override
  State<ArtListing> createState() => _ArtListingState();
}

class _ArtListingState extends State<ArtListing> {
  List<String> artPhotos = [
    "assets/art/1.jpg",
    "assets/art/2.jpg",
    "assets/art/3.jpg",
    "assets/art/4.jpg",
  ];

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
                      "Art",
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
                          " Art",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(artPhotos.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Image.asset(
                            artPhotos[index],
                            width: size.width,
                            fit: BoxFit.fitWidth,
                          ),
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
