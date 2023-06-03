import 'package:briannamutali/models/language.dart';

class Software {
  final String? id;
  final String? name;
  final String? icon;
  final String? preview;
  final String? description;
  final List<String>? links;
  final List<String>? platforms;
  final List<String>? images;
  final List<Language>? languages;

  Software(
      {this.name,
      this.id,
      this.icon,
      this.preview,
      this.description,
      this.platforms,
      this.images,
      this.languages,
      this.links});
}

final List<Software> softwares = [
  Software(
      id: "ekodi",
      name: "e-KODI",
      icon: "assets/software/ekodi/icon.png",
      preview: "assets/software/ekodi/preview.png",
      description:
          "e-KODI property management provides All-in-one solution to centralize customer data and provide workforce mobility.",
      links: [
        "https://ekodi.co.ke/",
        "https://play.google.com/store/apps/details?id=com.ekodi"
      ],
      platforms: [
        "android",
        "ios",
        "web"
      ],
      languages: [],
      images: [
        "assets/software/ekodi/1.png",
        "assets/software/ekodi/2.png",
        "assets/software/ekodi/3.png",
        "assets/software/ekodi/4.png",
      ]),
  Software(
      id: "mickeytoursandtravel",
      name: "Mickey Tours & Travel",
      icon: "assets/software/mickey/icon.png",
      preview: "assets/software/mickey/preview.png",
      description:
          "A tours and travel with the best tours, road trips and travel hiking across Africa.",
      links: [
        "https://mickeytoursandtravel.com"
      ],
      platforms: [
        "web"
      ],
      languages: [],
      images: [
        "assets/software/mickey/preview.png",
        "assets/software/mickey/1.png",
        "assets/software/mickey/2.png"
      ]),
  Software(
      id: "gotour",
      name: "Gotour",
      icon: "assets/software/gotour/icon.png",
      preview: "assets/software/gotour/preview.png",
      description:
          "Gotour App is a platform for travel enthusiasts that enables sharing cool and exciting places for people to visit. I have worked on Gotour App from concept to production. The app is still in development.",
      links: [
        "https://m.apkpure.com/gotour-explore-your-world/com.brian586.gotour_kenya",
        "https://gotour.web.app"
      ],
      languages: [],
      platforms: [
        "web",
        "android"
      ],
      images: [
        "assets/software/gotour/1.png",
        "assets/software/gotour/2.png",
        "assets/software/gotour/3.png",
        "assets/software/gotour/4.png",
        "assets/software/gotour/5.png"
      ]),
  Software(
      id: "ivictim",
      name: "iVICTIM",
      icon: "assets/software/ivictim/icon.png",
      preview: "assets/software/ivictim/1.png",
      description:
          "iVictim is an online platform for cyber security awareness.",
      links: ["https://ivictim.africa/"],
      platforms: ["web"],
      languages: [],
      images: ["assets/software/ivictim/1.png"]),
  Software(
      id: "afriblox",
      name: "Afriblox",
      icon: "assets/software/afriblox/icon.jpg",
      preview: "assets/software/afriblox/1.png",
      description: "A Scratch-based software for teaching kids how to code.",
      links: ["https://afriblox.web.app"],
      platforms: ["web", "windows"],
      languages: [],
      images: ["assets/software/afriblox/1.png"])
];
