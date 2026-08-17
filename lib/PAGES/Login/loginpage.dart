import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/constantvalues.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/LoginController/loginctrl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LoginCtrl>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        log("didPop::$didPop");
        if (didPop) return;
        // onbackpress();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: grey,
                height: Screens.fullHeight(context),
                width: Screens.width(context),
                child: Column(
                  children: [
                    Container(
                      height: Screens.padingHeight(context) * 0.3,
                      width: Screens.width(context),
                      decoration: BoxDecoration(
                          color: primarycolor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(180),
                          )),
                      child: Container(
                        width: Screens.width(context),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [secondary, primarycolor],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(230),
                            )),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Store - WMS",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "For Optimized Store Operations",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(
                              left: Screens.width(context) * 0.015),
                          width: Screens.width(context),
                          decoration: BoxDecoration(color: secondary),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: Screens.width(context) * 0.015,
                            ),
                            width: Screens.width(context),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    primarycolor,
                                    secondary,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                )),
                            child: Container(
                                padding: EdgeInsets.only(
                                    top: Screens.width(context) * 0.1,
                                    left: Screens.width(context) * 0.015),
                                width: Screens.width(context),
                                decoration: BoxDecoration(
                                    color: grey,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(100),
                                    )),
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: Screens.padingHeight(context) * 0.01,
                                    left: Screens.width(context) * 0.05,
                                    right: Screens.width(context) * 0.05,
                                  ),
                                  width: Screens.width(context),
                                  decoration: BoxDecoration(
                                      // color: Colors.amber,

                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                  )),
                                  child:
                                      context.watch<LoginCtrl>().isloading ==
                                              true
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                color: thirdcolor,
                                              ),
                                            )
                                          : SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  // Text(
                                                  //     "Welcome",
                                                  //     style: theme.textTheme.bodyMedium!
                                                  //         .copyWith(
                                                  //             color: thirdcolor,
                                                  //             fontWeight: FontWeight.w700,
                                                  //             fontSize: 35),
                                                  //   ),
                                                  Text(
                                                    "Login Now!",
                                                    style: theme
                                                        .textTheme.bodyMedium!
                                                        .copyWith(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                55, 55, 55),
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 20),
                                                  ),
                                                  Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: Screens.width(
                                                          context),
                                                      height:
                                                          Screens.padingHeight(
                                                                  context) *
                                                              0.03,
                                                      // color: Colors.amber,
                                                      child: Text(
                                                        context
                                                            .read<LoginCtrl>()
                                                            .loginerrormsg(),
                                                        style: theme.textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                color:
                                                                    Colors.red),
                                                      )),
                                                  Container(
                                                    // padding: EdgeInsets.symmetric(
                                                    //   horizontal: Screens.padingHeight(context)
                                                    // ),
                                                    // height:
                                                    //     Screens.padingHeight(
                                                    //         context)*0.6,
                                                    decoration: BoxDecoration(
                                                        color: grey,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  30),
                                                        )),
                                                    child: Form(
                                                      key: context
                                                          .read<LoginCtrl>()
                                                          .formKey,
                                                      child: Column(
                                                        children: [
                                                          //   Container(
                                                          //                      decoration: BoxDecoration(
                                                          //                        color: grey,
                                                          //                        borderRadius: BorderRadius.circular(10),
                                                          //                      ),
                                                          //                      child: TextFormField(
                                                          //                cursorColor: secondary,

                                                          //                        controller: context.read<LoginCtrl>().companyctrl,
                                                          // validator: (value){
                                                          //  if(value!.isEmpty){
                                                          //    return "Company Required";
                                                          //  }else{
                                                          //    return null;
                                                          //  }
                                                          // },
                                                          //                        decoration: InputDecoration(
                                                          //                         suffixIcon: IconButton(
                                                          //                           iconSize: 30,
                                                          //                           onPressed: (){

                                                          //                           }, icon: Icon(Icons.arrow_drop_down),),
                                                          //  fillColor: white,
                                                          //  filled: true,

                                                          //  hintText: "Company",
                                                          //  hintStyle:
                                                          //      TextStyle(color: Colors.grey),
                                                          //  border: OutlineInputBorder(
                                                          //      borderSide: BorderSide.none),
                                                          //  focusedBorder: OutlineInputBorder(
                                                          //      borderSide: BorderSide.none),
                                                          //  enabledBorder: OutlineInputBorder(
                                                          //      borderSide: BorderSide.none),
                                                          //  errorBorder: OutlineInputBorder(
                                                          //      borderSide: BorderSide.none),
                                                          //                        ),
                                                          //                      ),
                                                          //                   ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.02,
                                                          ),

                                                          Container(
                                                            decoration: BoxDecoration(
                                                                color: white,
                                                                border: Border.all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20))),
                                                            child: DropdownButtonFormField(
                                                                value: context.read<LoginCtrl>().valuedropdown,
                                                                validator: (val) {
                                                                  if (val ==
                                                                      null) {
                                                                    return "*Required";
                                                                  }
                                                                  return null;
                                                                },
                                                                decoration: InputDecoration(
                                                                    fillColor: white,
                                                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(20)),
                                                                      borderSide: BorderSide(
                                                                          color: Color.fromARGB(
                                                                              255,
                                                                              228,
                                                                              228,
                                                                              228)),
                                                                    ),
                                                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20))),
                                                                    errorBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.all(Radius.circular(20)))),
                                                                hint: Text(
                                                                  "Company",
                                                                  style: TextStyle(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          122,
                                                                          122,
                                                                          122),
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                                items: context.watch<LoginCtrl>().DropDownList.map((e) {
                                                                  return DropdownMenuItem(
                                                                      value:
                                                                          "${e.Database}",
                                                                      child:
                                                                          Text(
                                                                        "${e.Database}",
                                                                        style: theme
                                                                            .textTheme
                                                                            .bodyMedium!
                                                                            .copyWith(
                                                                                color: Colors.grey,
                                                                                fontSize: 13),
                                                                      ));
                                                                }).toList(),
                                                                onChanged: (val) {
                                                                  setState(() {
                                                                    context
                                                                        .read<
                                                                            LoginCtrl>()
                                                                        .valuedropdown = val.toString();
                                                                  });
                                                                }),
                                                          ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.02,
                                                          ),

                                                          TextFormField(
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13),
                                                            cursorColor:
                                                                secondary,
                                                            controller: context
                                                                .read<
                                                                    LoginCtrl>()
                                                                .branchcodectrl,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "*Required";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                              fillColor: white,
                                                              filled: true,
                                                              labelText:
                                                                  "Branch Code",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 14),
                                                              border:
                                                                  OutlineInputBorder(),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.02,
                                                          ),
                                                          TextFormField(
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13),
                                                            cursorColor:
                                                                secondary,
                                                            controller: context
                                                                .read<
                                                                    LoginCtrl>()
                                                                .usernamectrl,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "*Required";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor: white,
                                                              filled: true,
                                                              //  prefixIcon: Icon(Icons.person,
                                                              //   color: const Coolr.fromARGB(525, 93 ,93, 93),
                                                              //   ),
                                                              labelText:
                                                                  "User Name",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 14),

                                                              border:
                                                                  OutlineInputBorder(),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.02,
                                                          ),
                                                          TextFormField(
                                                            style: theme
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        13),
                                                            cursorColor:
                                                                secondary,
                                                            controller: context
                                                                .read<
                                                                    LoginCtrl>()
                                                                .passwordctrl,
                                                            validator: (value) {
                                                              if (value!
                                                                  .isEmpty) {
                                                                return "*Required";
                                                              } else {
                                                                return null;
                                                              }
                                                            },
                                                            decoration:
                                                                InputDecoration(
                                                              fillColor: white,
                                                              filled: true,
                                                              labelText:
                                                                  "Password",
                                                              hintStyle: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 14),
                                                              border:
                                                                  OutlineInputBorder(),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            20)),
                                                                borderSide: BorderSide(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            228,
                                                                            228,
                                                                            228)),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.02,
                                                          ),

                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              border: Border(
                                                                bottom:
                                                                    BorderSide
                                                                        .none,
                                                              ),
                                                              color: secondary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            width: Screens.width(
                                                                    context) *
                                                                0.6,
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.06,
                                                            child:
                                                                ElevatedButton(
                                                                    style: ElevatedButton.styleFrom(
                                                                        backgroundColor:
                                                                            thirdcolor,
                                                                        side: BorderSide
                                                                            .none),
                                                                    onPressed:
                                                                        () {
                                                                      setState(
                                                                          () {
                                                                        //             if(context.read<LoginCtrl>().formKey.currentState!.validate()){
                                                                        // log("hhgghh");
                                                                        //             }
                                                                        context
                                                                            .read<LoginCtrl>()
                                                                            .Validateuser();
                                                                      });
                                                                    },
                                                                    child: context.watch<LoginCtrl>().loginloading ==
                                                                            true
                                                                        ? Center(
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                            color:
                                                                                white,
                                                                          ))
                                                                        : Text(
                                                                            "Login",
                                                                            style: theme.textTheme.bodyMedium!.copyWith(
                                                                                color: white,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.w500),
                                                                          )),
                                                          ),
                                                          SizedBox(
                                                            height: Screens
                                                                    .padingHeight(
                                                                        context) *
                                                                0.08,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Text(
                                                                "Version :",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              ),
                                                              Text(
                                                                " ${ConstantValues.versionNum}",
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                  color: Colors
                                                                      .grey,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .underline,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                )),
                          )),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
