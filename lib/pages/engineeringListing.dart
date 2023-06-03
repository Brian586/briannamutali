import 'package:briannamutali/models/engineering.dart';
import 'package:flutter/material.dart';

import '../routes.dart';
import '../widgets/customAppBar.dart';
import '../widgets/footer.dart';

class EngineeringListing extends StatelessWidget {
  const EngineeringListing({Key? key}) : super(key: key);

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
                      "Engineering",
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
                          " Engineering",
                          style: Theme.of(context).textTheme.caption,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          List.generate(engineeringExperiences.length, (index) {
                        Engineering engineering = engineeringExperiences[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                engineering.image!,
                                width: size.width,
                                fit: BoxFit.fitWidth,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ListTile(
                                title: Text(engineering.company!),
                                subtitle: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(engineering.department!),
                                    Text(
                                      engineering.dateFrom! +
                                          " - " +
                                          engineering.dateTo!,
                                      style:
                                          Theme.of(context).textTheme.caption,
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Text(engineering.description!),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                    engineering.skills!.length, (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.flight,
                                          size: 15.0,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Text(engineering.skills![index]),
                                      ],
                                    ),
                                  );
                                }),
                              )
                            ],
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
