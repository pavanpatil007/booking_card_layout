library booking_card_layout;

import 'package:booking_card_layout/constants.dart';
import 'package:booking_card_layout/tv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HotelBookingLayout{
  final BuildContext context;
  final String referenceNo;
  final String city;
  final String assCode;
  final String arrivalDatetime;
  final String depDatetime;
  final String statusCompany;
  final List<dynamic>people;
  final String statusTv;
  final String userName;
  final GestureTapCallback? onAcceptTap;
  final GestureTapCallback? onRejectTap;
  final GestureTapCallback? onAssignTap;
  final GestureTapCallback? onApproveTap;

  HotelBookingLayout({
    required this.context,
    required this.referenceNo,
    required this.city,
    required this.assCode,
    required this.arrivalDatetime,
    required this.depDatetime,
    required this.statusCompany,
    required this.people,
    required this.statusTv,
    required this.userName,
    this.onAcceptTap,
    this.onRejectTap,
    this.onAssignTap,
    this.onApproveTap
  });

  Widget normal(){

    showEmployeeDetails(){
      showDialog(context: context, builder: (BuildContext buContext){
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Employee Details",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 20),))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: (){Navigator.pop(context);},
                            icon: const Icon(Icons.cancel_outlined)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.call,color: Colors.green,),
                            onPressed: ()async{
                              await FlutterPhoneDirectCaller.callNumber(people[index].peopleContact.toString());
                            },
                          ),
                          subtitle: Text("${people[index].peopleContact}"),
                          title: Text(people[index].peopleName!,style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        );
      });
    }

    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        surfaceTintColor: TVTheme.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Constants.taxiCardTop,
              color: TVTheme.blackColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(city.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.header)),
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Arrival",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(arrivalDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(arrivalDatetime))} ${DateTime.parse(arrivalDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(arrivalDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(width: 2,),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Departure",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(depDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(depDatetime))} ${DateTime.parse(depDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(depDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Approver",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusCompany.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child:GestureDetector(
                    onTap: (){
                      showEmployeeDetails();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                alignment:Alignment.topLeft,
                                child: Text(
                                    "People",
                                    style: GoogleFonts.lato(fontSize: Constants.subHeader)
                                )
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    alignment:Alignment.topLeft,
                                    child: Text(
                                        people.length.toString(),
                                        style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600
                                        )
                                    )
                                ),

                                Icon(Icons.info_outline,size: Constants.iconSize,)
                              ],
                            )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Taxivaxi",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusTv.toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "SPOC",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  userName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      )

                    ],
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget newBookingAgent(){
    showEmployeeDetails(){
      showDialog(context: context, builder: (BuildContext buContext){
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Employee Details",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 20),))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: (){Navigator.pop(context);},
                            icon: const Icon(Icons.cancel_outlined)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.call,color: Colors.green,),
                            onPressed: ()async{
                              await FlutterPhoneDirectCaller.callNumber(people[index].peopleContact.toString());
                            },
                          ),
                          subtitle: Text("${people[index].peopleContact}"),
                          title: Text(people[index].peopleName!,style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        surfaceTintColor: TVTheme.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Constants.taxiCardTop,
              color: TVTheme.blackColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(city.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.header)),
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Arrival",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(arrivalDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(arrivalDatetime))} ${DateTime.parse(arrivalDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(arrivalDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(width: 2,),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Departure",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(depDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(depDatetime))} ${DateTime.parse(depDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(depDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Approver",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusCompany.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child:GestureDetector(
                    onTap: (){
                      showEmployeeDetails();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                alignment:Alignment.topLeft,
                                child: Text(
                                    "People",
                                    style: GoogleFonts.lato(fontSize: Constants.subHeader)
                                )
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    alignment:Alignment.topLeft,
                                    child: Text(
                                        people.length.toString(),
                                        style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600
                                        )
                                    )
                                ),

                                Icon(Icons.info_outline,size: Constants.iconSize,)
                              ],
                            )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Taxivaxi",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusTv.toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "SPOC",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  userName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      )

                    ],
                  ),
                ),

              ],
            ),
            statusTv =="Accepted"?
            Container(
              alignment: Alignment.topRight,
              child: ElevatedButton.icon(
                icon: Icon(Icons.edit,color: TVTheme.secondColor,),
                onPressed: onAssignTap,
                label: const Text("Assign"),),
            ):
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.thumb_down,color: Colors.redAccent,),
                  onPressed: onRejectTap,
                  label: const Text(
                      "Reject"
                  ),
                ),
                const SizedBox(width:10,),
                ElevatedButton.icon(
                  icon: const Icon(Icons.thumb_up,color: Colors.green,),
                  onPressed: onAcceptTap,
                  label: const Text(
                      "Accept"
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
  Widget newBookingApprover(){
    showEmployeeDetails(){
      showDialog(context: context, builder: (BuildContext buContext){
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                            alignment: Alignment.center,
                            child: Text("Employee Details",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 20),))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: (){Navigator.pop(context);},
                            icon: const Icon(Icons.cancel_outlined)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: people.length,
                      itemBuilder: (BuildContext context,int index){
                        return ListTile(
                          trailing: IconButton(
                            icon: const Icon(Icons.call,color: Colors.green,),
                            onPressed: ()async{
                              await FlutterPhoneDirectCaller.callNumber(people[index].peopleContact.toString());
                            },
                          ),
                          subtitle: Text("${people[index].peopleContact}"),
                          title: Text(people[index].peopleName!,style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
                        );
                      }
                  ),
                )
              ],
            ),
          ),
        );
      });
    }
    return Container(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 5,
        surfaceTintColor: TVTheme.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Constants.taxiCardTop,
              color: TVTheme.blackColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(city.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w600,color: TVTheme.primaryColor,fontSize: Constants.subHeader),),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.header)),
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Arrival",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(arrivalDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(arrivalDatetime))} ${DateTime.parse(arrivalDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(arrivalDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
                const SizedBox(width: 2,),
                Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                Icon(FontAwesomeIcons.hotel,size: Constants.iconSize,),
                                Text("Departure",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              ],
                            )
                        ),
                        Expanded(
                          flex:5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${DateTime.parse(depDatetime).day} ",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.title),),
                              Text("${DateFormat.MMM().format(DateTime.parse(depDatetime))} ${DateTime.parse(depDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                              Text(DateFormat.jm().format(DateTime.parse(depDatetime)),style: GoogleFonts.lato(fontSize: Constants.subHeader),),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
            const Divider(height: 2,),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Approver",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusCompany.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 3,
                  child:GestureDetector(
                    onTap: (){
                      showEmployeeDetails();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                                padding: const EdgeInsets.only(left: 10),
                                alignment:Alignment.topLeft,
                                child: Text(
                                    "People",
                                    style: GoogleFonts.lato(fontSize: Constants.subHeader)
                                )
                            )
                        ),
                        Expanded(
                            flex: 4,
                            child: Row(
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(right: 5),
                                    alignment:Alignment.topLeft,
                                    child: Text(
                                        people.length.toString(),
                                        style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600
                                        )
                                    )
                                ),

                                Icon(Icons.info_outline,size: Constants.iconSize,)
                              ],
                            )
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "Taxivaxi",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )
                      ),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  statusTv.toString(),
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 3,
                          child: Container(
                              padding: const EdgeInsets.only(left: 10),
                              alignment:Alignment.topLeft,
                              child: Text(
                                  "SPOC",
                                  style: GoogleFonts.lato(fontSize: Constants.subHeader)
                              )
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                              alignment:Alignment.topLeft,
                              child: Text(
                                  userName.toString(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Constants.subHeader
                                      )
                                  )
                              )
                          )
                      )

                    ],
                  ),
                ),

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.thumb_down,color: Colors.redAccent,),
                  onPressed: onRejectTap,
                  label: const Text(
                      "Reject"
                  ),
                ),
                const SizedBox(width:10,),
                ElevatedButton.icon(
                  icon: const Icon(Icons.thumb_up,color: Colors.green,),
                  onPressed: onApproveTap,
                  label: const Text(
                      "Approve"
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}

