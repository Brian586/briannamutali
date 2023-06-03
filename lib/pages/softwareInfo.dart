import 'package:briannamutali/common.dart';
import 'package:briannamutali/models/software.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/footer.dart';

class SoftwareInfo extends StatefulWidget {
  final String? softwareId;
  const SoftwareInfo({Key? key, this.softwareId}) : super(key: key);

  @override
  State<SoftwareInfo> createState() => _SoftwareInfoState();
}

class _SoftwareInfoState extends State<SoftwareInfo> {
  Software? software;

  @override
  void initState() {
    super.initState();
    software = softwares
        .where((element) => element.id == widget.softwareId!)
        .toList()[0];
  }

  Widget displayScreenshots(Size size) {
    if (software!.id == "ekodi" || software!.id == "gotour") {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(software!.images!.length, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Card(
                shadowColor: Colors.grey,
                elevation: 10.0,
                child: Image.asset(
                  software!.images![index],
                  height: size.height * 0.4,
                  fit: BoxFit.fitHeight,
                ),
              ),
            );
          }),
        ),
      );
    } else {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(software!.images!.length, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Card(
              shadowColor: Colors.grey,
              elevation: 10.0,
              child: Image.asset(
                software!.images![index],
                width: size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        }),
      );
    }
  }

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
                      software!.name!,
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
                        InkWell(
                          onTap: () => CustomRoutes.router
                              .navigateTo(context, "/software"),
                          child: Text(
                            " Software",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.grey,
                          size: 12.0,
                        ),
                        Text(
                          " ${software!.name}",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Image.asset(
                      software!.preview!,
                      width: size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Overview",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(software!.description!),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Screenshots",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    displayScreenshots(size),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Platforms",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:
                          List.generate(software!.platforms!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/platforms/${software!.platforms![index]}.png",
                                height: 30.0,
                                width: 30.0,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Text(software!.platforms![index].toUpperCase())
                            ],
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Text(
                      "Links",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(software!.links!.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: TextButton(
                            onPressed: () =>
                                Common.openUrl(software!.links![index]),
                            child: Text(
                              software!.links![index],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const Footer()
          ],
        ),
      ),
    );
  }
}
