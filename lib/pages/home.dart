import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onHover = false;
  List<Map<String, String>> buttons = [
    {
      "name": "PRODUCTS & SERVICES",
      "route": "/products&services"
    },
    {
      "name": "PRICING",
      "route": "/pricing"
    },
    {
      "name": "ABOUT",
      "route": "/about"
    },
    {
      "name": "CONTACT US",
      "route": "/contact_us"
    },
  ];

  @override
  Widget build(BuildContext context) {
    Color textColor = onHover ? Colors.white : Colors.black54;
    Color buttonColor = onHover ? Colors.blue : Colors.transparent;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: const Text("BN"),
        actions: List.generate(buttons.length, (index) {
          Map<String, String> button = buttons[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, button["route"]!);
              },
              onHover: (v) {
                setState(() {
                  onHover = v;
                });
              },
              child: Text(button["name"]!, style: Theme.of(context).textTheme.button!.apply(fontWeightDelta: 3, color: textColor),),
              style: ButtonStyle(
                  animationDuration: const Duration(seconds: 1),
                  backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)))
              ),
            ),
          );
        }),
      ),
    );
  }
}
