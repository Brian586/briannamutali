import 'package:briannamutali/widgets/artSection.dart';
import 'package:briannamutali/widgets/customAppBar.dart';
import 'package:briannamutali/widgets/footer.dart';
import 'package:briannamutali/widgets/intro.dart';
import 'package:briannamutali/widgets/ratings.dart';
import 'package:briannamutali/widgets/softwareSection.dart';
import 'package:flutter/material.dart';
import 'package:seo_renderer/seo_renderer.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setPathUrlStrategy();

  runApp(const RobotDetector(
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    CustomRoutes.setupRouter();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brian Namutali',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      navigatorObservers: [seoRouteObserver],
      initialRoute: "/",
      onGenerateRoute: CustomRoutes.router.generator,
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _controller = ScrollController();
  bool lastStatus = true;

  @override
  void initState() {
    super.initState();

    _controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _controller.hasClients &&
        _controller.offset > (200 - kToolbarHeight);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(size.width, 60.0),
        child: CustomAppBar(isShrink: isShrink),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: const [
            Intro(),
            SoftwareSection(),
            ArtSection(),
            Ratings(),
            Footer()
          ],
        ),
      ),
    );
  }
}
