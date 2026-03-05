import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/RequestController/request_controller.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
    @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
     context.read<RequestController>().init();
  
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor:  Colors.grey[200],
      appBar: AppBar(
            // centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: secondary,
            // leading: Icon(Icons.abc),
            title: Container(
              padding: EdgeInsets.symmetric(
                vertical: Screens.padingHeight(context)*0.01
              ),
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
               Row(
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                           Get.offAllNamed(ConstantRoutes.dashboard);
    });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Request",
                        style: theme.textTheme.bodyMedium!.copyWith(
                            color: white, fontWeight: FontWeight.w600, fontSize: 22),
                      ),
                    ],
                  ),
               
                ],
              ),
            ),
          ),

           body: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Screens.width(context) * 0.02,
                vertical: Screens.padingHeight(context) * 0.01),
            width: Screens.width(context),
            color:  Colors.grey[200],
            child:SingleChildScrollView(
              child: Column(
                children: [
               context.watch<RequestController>().isLoading==true?
               CircularProgressIndicator(
                color: secondary,
               ):context.read<RequestController>().requestsData.isEmpty?
                   Container(
                              // height: Screens.padingHeight(context),
                              // width: Screens., 
                              child: Column(
                                children: [
                                   SizedBox(height: Screens.padingHeight(context)*0.1),
                                  Image.asset("Assets/error-file.png",
                                  height: Screens.padingHeight(context)*0.08,
                                  width: Screens.width(context)*0.4,
                                  ),
                                   SizedBox(height: Screens.padingHeight(context)*0.02),

                                  Text("No Data..!"),
                                ],
                              )):
                               context.read<RequestController>().exception != ''?
                               Center(
                                 child: Text(
                                     "${context.read<RequestController>().exception}"),
                               ):

                        context.read<RequestController>().error != ''?
                        Center(
                          child: Text(
                                "${context.read<RequestController>().exception}"),
                        ):

               ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: context.read<RequestController>().requestsData.length,
                shrinkWrap: true,
                 itemBuilder: (BuildContext context, int index) {  
                return Container(
                                         padding: EdgeInsets.symmetric(
                                      horizontal: Screens.width(context)*0.01,
                                      vertical: Screens.width(context)*0.01
                 
                                    ),
                                      child: InkWell(
                                        onTap: (){
                                   context.read<RequestController>().showRequestPopup(context.read<RequestController>().requestsData[index].custCode,context.read<RequestController>().requestsData[index].creditVal.toString(),context.read<RequestController>().requestsData[index].requestCode.toString(),context.read<RequestController>().requestsData[index].approvalSpName.toString(),context.read<RequestController>().requestsData[index].rejectSpName.toString(),context);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: Screens.width(context) * 0.025,
                                              vertical:
                                                  Screens.padingHeight(context) * 0.01),
                                                  decoration: BoxDecoration(
                                                                            color: white,
                                        
                                        borderRadius: BorderRadius.circular(15),
                                          boxShadow: 
                                                                            [
                                                                              BoxShadow(
                                        color: Color.fromARGB(255, 239, 239, 239),
                                        blurRadius: 5,
                                        spreadRadius: 4
                                                                            )]           
                                                                            ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                      
                                              SizedBox(
                                                height: Screens.padingHeight(context) *
                                                    0.005,
                                              ),
                                            
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.spaceBetween,
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        Screens.width(context) * 0.4,
                 
                                                    child: Text(
                                                     context.read<RequestController>().requestsData[index].companyName.toString(),
                                                      style: theme.textTheme.bodyMedium!
                                                          .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  // Icon(Icons.arrow_forward,
                                                  
                                                  // ),
                                                  Container(
                                                    width:
                                                        Screens.width(context) * 0.45,
                                                    alignment: Alignment.centerRight,
                 
                                                    child: Text(
                                                     context.read<RequestController>().requestsData[index].requestName.toString(),
                                                      style: theme.textTheme.bodyMedium!
                                                          .copyWith(
                                                      fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                         
                                              SizedBox(
                                                height: Screens.padingHeight(context) *
                                                    0.009,
                                              ),
                                              Text(
                                                context.read<RequestController>().requestsData[index].requestMessage.toString(),
                                                style: theme.textTheme.bodyMedium!
                                                    .copyWith(
                                                 fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                          
                                           SizedBox(
                                                height: Screens.padingHeight(context) *
                                                    0.01,
                                              ),

                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                    },
               )
                ],
              ),
            ),)
    );
  }
  }
  


