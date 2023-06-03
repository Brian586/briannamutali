import 'package:briannamutali/widgets/contactBtn.dart';
import 'package:flutter/material.dart';

class ArtSection extends StatefulWidget {
  const ArtSection({Key? key}) : super(key: key);

  @override
  State<ArtSection> createState() => _ArtSectionState();
}

class _ArtSectionState extends State<ArtSection> {
  List<String> artPhotos = [
    "assets/art/1.jpg",
    "assets/art/2.jpg",
    "assets/art/3.jpg",
    "assets/art/4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Image.asset(
          "assets/art/colors_h.png",
          height: size.height,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Art",
                style: Theme.of(context).textTheme.headline4,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(artPhotos.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        artPhotos[index],
                        height: size.height * 0.6,
                        width: size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(
                width: 120.0,
                child: ContactButton(
                  color: Colors.black,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
