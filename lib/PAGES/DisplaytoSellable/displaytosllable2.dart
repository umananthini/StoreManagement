


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:warehousemanagement/CONSTANT/color.dart';
import 'package:warehousemanagement/CONSTANT/constantrouts.dart';
import 'package:warehousemanagement/CONSTANT/screens.dart';
import 'package:warehousemanagement/CONTROLLER/Displaytosellable/displaytosellable.dart';
import 'package:warehousemanagement/PAGES/Scanner/scannerpage.dart';

class DisplaytoSellable2screen extends StatefulWidget {
  const DisplaytoSellable2screen({super.key});

  @override
  State<DisplaytoSellable2screen> createState() => _DisplaytoSellable2screenState();
}

class _DisplaytoSellable2screenState extends State<DisplaytoSellable2screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DisplayToSellablectrl>().init();
    });
  }
  @override
  Widget build(BuildContext context) {
    final theme= Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                           Get.offAllNamed(ConstantRoutes.displaytosellable);

                            
                          });
                        },
                        child: Icon(Icons.arrow_back,)),
                        SizedBox(width: Screens.width(context)*0.015,),
                      Text(
                        "Display To Sellable",
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
        color: Colors.grey[200],
        padding: EdgeInsets.symmetric(
          horizontal: Screens.padingHeight(context)*0.02,
          vertical: Screens.width(context)*0.02
        ),
        child: Form(
          key: context.read<DisplayToSellablectrl>().formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Screens.width(context)*0.02,
                  vertical: Screens.padingHeight(context)*0.01
                ),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                
                ),
                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
            
                 Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Container(
                      // color: Colors.amber,
                      width: Screens.width(context)*0.3,
                       child: Text("Product Serial Number ",style:  theme.textTheme.bodyMedium!.copyWith(
                             fontWeight: FontWeight.bold ,
                             fontSize: 15,                
                       ),),
                     ),
                     Container(
                                            child: Text(": ",style:  theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 15,  
                                            ),),
                                          ),
                     
                     Container(
                      alignment: Alignment.centerLeft,
                      width: Screens.width(context)*0.5,
                       child: Text(" ${context.watch<DisplayToSellablectrl>() .displayproductserial.text}",style:  theme.textTheme.bodyMedium!.copyWith(
                 fontSize: 15,  
                       ),),
                     ),
                     
                     
                  
                   ],
                 ),
                        SizedBox(
                  height: Screens.padingHeight(context) * 0.01,
                ),
                Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Container(
                      // color: Colors.amber,
                      width: Screens.width(context)*0.3,
                       child: Text("Item Code ",style:  theme.textTheme.bodyMedium!.copyWith(
                             fontWeight: FontWeight.bold ,
                             fontSize: 15,                
                       ),),
                     ),
                     Container(
                                            child: Text(": ",style:  theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 15,  
                                            ),),
                                          ),
                     
                     Container(
                      alignment: Alignment.centerLeft,
                      width: Screens.width(context)*0.5,
                       child: Text(" ${context.read<DisplayToSellablectrl>() .productseriallist[0].ItemCode}",style:  theme.textTheme.bodyMedium!.copyWith(
                 fontSize: 15,  
                       ),),
                     ),
                     
                     
                  
                   ],
                 ),
                 SizedBox(
                  height: Screens.padingHeight(context)*0.01,
                 ),
                  Row(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Container(
                      // color: Colors.amber,
                      width: Screens.width(context)*0.3,
                       child: Text("Item Name ",style:  theme.textTheme.bodyMedium!.copyWith(
                             fontWeight: FontWeight.bold        ,
                             fontSize: 15,         
                       ),),
                     ),
                     Container(
                                            child: Text(": ",style:  theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 15,  
                                            ),),
                                          ),
                     
                     Container(
                      alignment: Alignment.centerLeft,
                      width: Screens.width(context)*0.5,
                       child: Text(" ${context.read<DisplayToSellablectrl>() .productseriallist[0].ItemName}",style:  theme.textTheme.bodyMedium!.copyWith(
                 fontSize: 15,  
                       ),),
                     ),
                     
                     
                  
                   ],
                 ),
                 SizedBox(
                  height: Screens.padingHeight(context)*0.01,
                 ),
                   Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Container(
                      // color: Colors.amber,
                      width: Screens.width(context)*0.3,
                       child: Text("Box Serial Number ",style:  theme.textTheme.bodyMedium!.copyWith(
                             fontWeight: FontWeight.bold  ,
                               fontSize: 15,             
                       ),),
                     ),
                     Container(
                                            child: Text(": ",style:  theme.textTheme.bodyMedium!.copyWith(
                                      fontSize: 15,  
                                            ),),
                                          ),
                     
                     Container(
                      alignment: Alignment.centerLeft,
                      width: Screens.width(context)*0.5,
                     
                       child: Text(" ${context.read<DisplayToSellablectrl>() .productseriallist[0].DistNumber}",style:  theme.textTheme.bodyMedium!.copyWith(
                   fontSize: 15,  
                       ),),
                     ),
                     
                     
                  
                   ],
                 ),
                 SizedBox(
                  height: Screens.padingHeight(context)*0.01,
                 ),
                  Row(
                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Row(
                       children: [
                         Container(
                          // color: Colors.amber,
                          width: Screens.width(context)*0.3,
                           child: Text("Box No ",style:  theme.textTheme.bodyMedium!.copyWith(
                                 fontWeight: FontWeight.bold   ,
                                 fontSize: 15,              
                           ),),
                         ),
                         Container(
                       child: Text(": ",style:  theme.textTheme.bodyMedium!.copyWith(
                 fontSize: 15,  
                       ),),
                     ),
                       ],
                     ),
                     
                     Container(
                      alignment: Alignment.centerLeft,
                      // width: Screens.width(context)*0.5,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:fourth,
                        borderRadius: BorderRadius.circular(10)
                      ),
                       child: Text(" ${context.read<DisplayToSellablectrl>() .productseriallist[0].BoxNo}",style:  theme.textTheme.bodyMedium!.copyWith(
                 fontSize: 14,
                 fontWeight: FontWeight.w500
                       ),),
                     ),
                     
                     
                  
                   ],
                 ),
                                   
                
                        
                                    
                                    ],
                                  ),
              ),
                                SizedBox(
                                  height: Screens.padingHeight(context)*0.02,
                                ),
                               context.watch<DisplayToSellablectrl>() .displayproductserial
                          .text
                          .isNotEmpty? 
                           Container(
                            width: Screens.width(context),
                            height: Screens.padingHeight(context) * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(05),
                                // color: Colors.red
                               ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(
                                    left: Screens.width(context)*0.02,
                                  ),
                                  alignment: Alignment.center,
                                  width: Screens.width(context) * 0.75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13),
                                  color: Colors.white,
                    
                                  ),
                          
                                  child: TextFormField(
                                 
                                 controller: context
                                      .read<DisplayToSellablectrl>().diaplayboxsereial,
                                     
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Box Serial Required *";
                                    }
              
                                    return null;
                                  },
                                    decoration: InputDecoration(
                                      
                                        hintText: 'Product Serial Number',
                                        hintStyle: theme.textTheme.bodyMedium!.copyWith(
                                          fontSize: 15,
                                          color: Colors.grey[500]
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical:
                                                Screens.padingHeight(context) *
                                                    0.01,
                                            horizontal:
                                                Screens.width(context) * 0.01),
                                        border: InputBorder.none),
                    
                                onEditingComplete: () {
                                context
                                        .read<DisplayToSellablectrl>()
                                        . boxscanvalue = context
                                        .read<DisplayToSellablectrl>()
                                        .  diaplayboxsereial.text;
                                    context
                                        .read<DisplayToSellablectrl>()
                                        .afterboxscan(
                                            context
                                                .read<DisplayToSellablectrl>()
                                                .boxscanvalue
                                                .toString(),
                                            context);
                                  },
                                  ),
                                ),
                                InkWell(
                                onTap: (){
                                context
                                        .read<DisplayToSellablectrl>()
                                        . boxscanvalue=null;
                                      
          setState(() {
              QRscannerState.dis2sellbox =true;
          
            Navigator.push(context, MaterialPageRoute(builder: (context)=>QRscanner())).then((value) {
                context
                                        .read<DisplayToSellablectrl>()
                                        .  diaplayboxsereial.text=context
                                        .read<DisplayToSellablectrl>()
                                        . boxscanvalue.toString();
                                    context
                                        .read<DisplayToSellablectrl>()
                                        .afterboxscan(
                                            context
                                                .read<DisplayToSellablectrl>()
                                                .boxscanvalue
                                                .toString(),
                                            context);
          
            });
          });
                              },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Screens.width(context) * 0.018,
                                          vertical: Screens.padingHeight(context) *0.01
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                    color: secondary,
                    
                                          ),
                                      child: Icon(
                                        Icons.qr_code,
                                        color: white,
                                        size: 30,
                                      )),
                                ),
                              ],
                            ),
                          )
                          :Container(),
                             SizedBox(
                                  height: Screens.padingHeight(context)*0.02,
                                ),
                                Expanded(child: Container()),
                      Container(
                width: Screens.width(context),
                height: Screens.padingHeight(context)* 0.06,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: secondary),
                    onPressed: context.watch<DisplayToSellablectrl>().finalloading ==true?(){}:() {
                      context.read<DisplayToSellablectrl>().finalvalidate(context);
                      
                    },
                    child:context.watch<DisplayToSellablectrl>().finalloading ==true?CircularProgressIndicator(): Text('Submit')),
              ),
            ],
          ),
        ),
              
              
      ), 
      
    );
  }
}