import 'package:briannamutali/main.dart';
import 'package:briannamutali/pages/artListing.dart';
import 'package:briannamutali/pages/engineeringListing.dart';
import 'package:briannamutali/pages/servicesListing.dart';
import 'package:briannamutali/pages/softwareInfo.dart';
import 'package:briannamutali/pages/softwareListing.dart';
import 'package:fluro/fluro.dart';

class CustomRoutes {
  static final FluroRouter router = FluroRouter();

  static Handler homeHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const LandingPage();
  });

  static Handler softwareHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const SoftwareListing();
  });

  static Handler artHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const ArtListing();
  });

  static Handler engineeringHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const EngineeringListing();
  });

  static Handler servicesHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return const ServicesListing();
  });

  static Handler softwareInfoHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return SoftwareInfo(
      softwareId: params["id"][0],
    );
  });

  static void setupRouter() {
    router.define("/", handler: homeHandler);

    router.define("/software",
        handler: softwareHandler, transitionType: TransitionType.fadeIn);

    router.define("/art",
        handler: artHandler, transitionType: TransitionType.fadeIn);

    router.define("/engineering",
        handler: engineeringHandler, transitionType: TransitionType.fadeIn);

    router.define("/services",
        handler: servicesHandler, transitionType: TransitionType.fadeIn);

    router.define("/software/:id",
        handler: softwareInfoHandler, transitionType: TransitionType.fadeIn);
  }
}
