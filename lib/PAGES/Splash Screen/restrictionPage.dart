
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/SplashController/splashctrl.dart';

class Restrictionpage extends StatefulWidget {
  const Restrictionpage({super.key});

  @override
  State<Restrictionpage> createState() => _RestrictionpageState();
}

class _RestrictionpageState extends State<Restrictionpage> {
  @override
  Widget build(BuildContext context) {
       final theme =Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Screens.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(),
            Container(
              child:  Lottie.asset('Assets/Animation - 1750340029797.json',
                              animate: true,
                              repeat: true,
                              // height: Screens.padingHeight(context) * 0.3,
                              width: Screens.width(context) * 0.5),
            ),
            SizedBox(
              height: Screens.padingHeight(context)*0.02,
            ),
            Container(
 
              child: Text("${context.read<Splachctrl>().Exception}",style: theme.textTheme.bodyMedium!.copyWith(
              
                color: theme.colorScheme.primary,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),textAlign: TextAlign.center,),
            ),
 
 
          ],
        ),
        )
        ),
    );
  }
}