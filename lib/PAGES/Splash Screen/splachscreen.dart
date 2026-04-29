import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/SplashController/splashctrl.dart';

class Splash2Screen extends StatefulWidget {
  const Splash2Screen({super.key});

  @override
  State<Splash2Screen> createState() => _Splash2ScreenState();
}

class _Splash2ScreenState extends State<Splash2Screen> {
  final List<String> imageList = [
    'Assets/1.png',
    'Assets/2.png',
    'Assets/3.png',
    'Assets/4.png',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<Splachctrl>().init(context);
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onbackpress() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      // backgroundColor: themeprimarycolor,
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: Screens.width(context) * 0.01),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          secondary,
          white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FadeInDownBig(
              duration: Duration(seconds: 1),
              delay: Duration(milliseconds: 400),
              child: Container(
                // color: white,
                width: Screens.width(context),
                padding: EdgeInsets.symmetric(
                    horizontal: Screens.width(context) * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Store",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Management",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Screens.padingHeight(context) * 0.01,
                    ),
                    Text(
                      "We Ensure Efficient and Reliable Store Management.",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              // color: primarycolor,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                  // color: Colors.white,
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: Screens.padingHeight(context) * 0.4,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(seconds: 3),
                    viewportFraction: 1,
                  ),
                  items: imageList.map((imagePath) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Screens.width(context) * 0.01,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              // height: Screens.padingHeight(context) * 0.3,
              // width: Screens.width(context),
              child: Column(
                children: [
                  SpinKitThreeBounce(size: 30, color: primarycolor),
                  Container(
                      //   width: Screens.width(context) / 2,
                      //   child: LinearProgressIndicator(
                      //     color: secondary,
                      //     backgroundColor: Colors.transparent,
                      //   ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
