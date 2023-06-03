import 'package:briannamutali/widgets/contactBtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seo_renderer/renderers/image_renderer/image_renderer_vm.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_web.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  Widget buildDesktop(BuildContext context, Size size) {
    return Stack(
      children: [
        SizedBox(
          height: size.height,
          width: size.width,
        ),
        Positioned(
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: ImageRenderer(
            alt: "Brian Namutali",
            child: Image.asset(
              "assets/intro/edited1.jpg",
              width: size.width * 0.5,
              height: size.height,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            size: Size(
                size.width,
                (size.width * 0.5622254758418741)
                    .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
            painter: IntroPainter(),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRenderer(
                        text: "Brian Namutali",
                        child: Text(
                          "Brian Namutali",
                          style: GoogleFonts.fredokaOne(
                              color: Colors.black, fontSize: 30.0),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextRenderer(
                        text:
                            "Mechanical Engineer | Software Developer | Sketch Artist",
                        child: Text(
                          "Mechanical Engineer | Software Developer | Sketch Artist",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const TextRenderer(
                        text:
                            "I am a self-taught freelance Mobile and Web developer with Flutter/Firebase Framework. I develop Android, iOS and Web apps as a part-time job. I have been working with Flutter for 4 years now and gained experience in both front and back-end development; Firebase Database, Node js and Rest APIs. \n\nMy skillset also includes Computer Aided Design and Modelling, detailed analysis of mechanical components of machines, repair, maintenance and inspection of engineering components, analysis of complex engineering problems and develop long-term solutions.",
                        child: Text(
                            "I am a self-taught freelance Mobile and Web developer with Flutter/Firebase Framework. I develop Android, iOS and Web apps as a part-time job. I have been working with Flutter for 4 years now and gained experience in both front and back-end development; Firebase Database, Node js and Rest APIs. \n\nMy skillset also includes Computer Aided Design and Modelling, detailed analysis of mechanical components of machines, repair, maintenance and inspection of engineering components, analysis of complex engineering problems and develop long-term solutions."),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          ContactButton(
                            color: Colors.black,
                          ),
                          SizedBox()
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox()
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildMobile(BuildContext context, Size size) {
    return Stack(
      children: [
        ImageRenderer(
          alt: "Brian Namutali",
          child: Image.asset(
            "assets/intro/edited1.jpg",
            width: size.width,
            height: size.height * 0.9,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
            child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          )),
        )),
        Positioned(
          bottom: 20.0,
          left: 10.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextRenderer(
                text: "Brian Namutali",
                child: Text(
                  "Brian Namutali",
                  style: GoogleFonts.fredokaOne(
                      color: Colors.white, fontSize: 30.0),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextRenderer(
                text:
                    "Mechanical Engineer | Software Developer | Sketch Artist",
                child: Text(
                  "Mechanical Engineer | Software Developer | Sketch Artist",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: size.width * 0.8,
                child: const TextRenderer(
                  text:
                      "I am a self-taught freelance Mobile and Web developer with Flutter/Firebase Framework. I develop Android, iOS and Web apps as a part-time job. I have been working with Flutter for 4 years now and gained experience in both front and back-end development; Firebase Database, Node js and Rest APIs. \n\nMy skillset also includes Computer Aided Design and Modelling, detailed analysis of mechanical components of machines, repair, maintenance and inspection of engineering components, analysis of complex engineering problems and develop long-term solutions.",
                  child: Text(
                    "I am a self-taught freelance Mobile and Web developer with Flutter/Firebase Framework. I develop Android, iOS and Web apps as a part-time job. I have been working with Flutter for 4 years now and gained experience in both front and back-end development; Firebase Database, Node js and Rest APIs. \n\nMy skillset also includes Computer Aided Design and Modelling, detailed analysis of mechanical components of machines, repair, maintenance and inspection of engineering components, analysis of complex engineering problems and develop long-term solutions.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ContactButton(
                    color: Colors.white,
                  ),
                  SizedBox()
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile =
            sizingInformation.isMobile || sizingInformation.isTablet;
        return isMobile
            ? buildMobile(context, size)
            : buildDesktop(context, size);
      },
    );
  }
}

//Copy this CustomPainter code to the Bottom of the File
class IntroPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.5756955, 0);
    path_0.cubicTo(
        size.width * 0.6220059,
        size.height * 0.1066406,
        size.width * 0.6278770,
        size.height * 0.2183854,
        size.width * 0.6278770,
        size.height * 0.2183854);
    path_0.arcToPoint(Offset(size.width * 0.6247145, size.height * 0.3281250),
        radius:
            Radius.elliptical(size.width * 0.2211933, size.height * 0.3934245),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(
        size.width * 0.6168814,
        size.height * 0.4004297,
        size.width * 0.6001318,
        size.height * 0.4450521,
        size.width * 0.5851830,
        size.height * 0.4912500);
    path_0.cubicTo(
        size.width * 0.5851830,
        size.height * 0.4912500,
        size.width * 0.5497950,
        size.height * 0.6006250,
        size.width * 0.5187701,
        size.height * 0.7668750);
    path_0.cubicTo(
        size.width * 0.4905564,
        size.height * 0.9179688,
        size.width * 0.5050000,
        size.height * 0.9463932,
        size.width * 0.4882870,
        size.height);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.transparent; //.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.5851830, size.height * 0.4911979);
    path_1.cubicTo(
        size.width * 0.6001318,
        size.height * 0.4450000,
        size.width * 0.6168814,
        size.height * 0.4003776,
        size.width * 0.6247145,
        size.height * 0.3280729);
    path_1.arcToPoint(Offset(size.width * 0.6278770, size.height * 0.2183854),
        radius:
            Radius.elliptical(size.width * 0.2211933, size.height * 0.3934245),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_1.cubicTo(
        size.width * 0.6278770,
        size.height * 0.2183854,
        size.width * 0.6220059,
        size.height * 0.1066406,
        size.width * 0.5756955,
        0);
    path_1.lineTo(0, 0);
    path_1.lineTo(0, size.height);
    path_1.lineTo(size.width * 0.4882870, size.height);
    path_1.cubicTo(
        size.width * 0.5050000,
        size.height * 0.9463932,
        size.width * 0.4905564,
        size.height * 0.9179688,
        size.width * 0.5187701,
        size.height * 0.7668229);
    path_1.cubicTo(
        size.width * 0.5497804,
        size.height * 0.6005729,
        size.width * 0.5851830,
        size.height * 0.4911979,
        size.width * 0.5851830,
        size.height * 0.4911979);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.1399854, size.height * 0.1946484);
    path_2.lineTo(size.width * 0.1669400, size.height * 0.1879036);
    path_2.lineTo(size.width * 0.1501830, size.height * 0.1497526);
    path_2.lineTo(size.width * 0.1399854, size.height * 0.1946484);
    path_2.close();

    Paint paint_2_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.003660322;
    paint_2_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawPath(path_2, paint_2_stroke);

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Colors.transparent;
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.4999854, size.height * 0.5318490);
    path_3.lineTo(size.width * 0.4749268, size.height * 0.5129297);
    path_3.lineTo(size.width * 0.4782504, size.height * 0.5609766);
    path_3.lineTo(size.width * 0.4999854, size.height * 0.5318490);
    path_3.close();

    Paint paint_3_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.003660322;
    paint_3_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawPath(path_3, paint_3_stroke);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.transparent;
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.3269693, size.height * 0.7897266);
    path_4.lineTo(size.width * 0.3539898, size.height * 0.7956250);
    path_4.lineTo(size.width * 0.3433529, size.height * 0.7510677);
    path_4.lineTo(size.width * 0.3269693, size.height * 0.7897266);
    path_4.close();

    Paint paint_4_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.003660322;
    paint_4_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawPath(path_4, paint_4_stroke);

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Colors.transparent;
    canvas.drawPath(path_4, paint_4_fill);

    Paint paint_5_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002196193;
    paint_5_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4373939, size.height * 0.2296354,
            size.width * 0.01749634, size.height * 0.03111979),
        paint_5_stroke);

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Colors.transparent;
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.4373939, size.height * 0.2296354,
            size.width * 0.01749634, size.height * 0.03111979),
        paint_5_fill);

    Paint paint_6_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002196193;
    paint_6_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.2699854, size.height * 0.4844922,
            size.width * 0.02213763, size.height * 0.03937500),
        paint_6_stroke);

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Colors.transparent;
    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.2699854, size.height * 0.4844922,
            size.width * 0.02213763, size.height * 0.03937500),
        paint_6_fill);

    Paint paint_7_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002196193;
    paint_7_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.05450952, size.height * 0.4032552),
        size.width * 0.01011713, paint_7_stroke);

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Colors.transparent;
    canvas.drawCircle(Offset(size.width * 0.05450952, size.height * 0.4032552),
        size.width * 0.01011713, paint_7_fill);

    Paint paint_8_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002196193;
    paint_8_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.08260615, size.height * 0.4943359),
        size.width * 0.005534407, paint_8_stroke);

    Paint paint_8_fill = Paint()..style = PaintingStyle.fill;
    paint_8_fill.color = Colors.transparent;
    canvas.drawCircle(Offset(size.width * 0.08260615, size.height * 0.4943359),
        size.width * 0.005534407, paint_8_fill);

    Paint paint_9_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002196193;
    paint_9_stroke.color = Color(0xff676b6e).withOpacity(0.4);
    canvas.drawCircle(Offset(size.width * 0.3564275, size.height * 0.2193229),
        size.width * 0.005534407, paint_9_stroke);

    Paint paint_9_fill = Paint()..style = PaintingStyle.fill;
    paint_9_fill.color = Colors.transparent;
    canvas.drawCircle(Offset(size.width * 0.3564275, size.height * 0.2193229),
        size.width * 0.005534407, paint_9_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
