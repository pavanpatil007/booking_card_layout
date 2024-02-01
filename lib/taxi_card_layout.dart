library booking_card_layout;

import 'package:booking_card_layout/constants.dart';
import 'package:booking_card_layout/tv_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class TaxiCardLayout {
  final BuildContext context;
  final String referenceNo;
  final String tourType;
  final String assessmentCode;
  final String pickupDatetime;
  final String pickupLocation;
  final String dropLocation;
  final String statusCompany;
  final List<dynamic> passengerList;
  final String statusTv;
  final GestureTapCallback? onAcceptTap;
  final GestureTapCallback? onRejectTap;
  final GestureTapCallback? onAssignTap;
  final GestureTapCallback? onApproveTap;

  TaxiCardLayout({
    required this.context,
    required this.referenceNo,required this.tourType,required this.assessmentCode, required this.pickupDatetime,
    required this.pickupLocation, required this.dropLocation, required this.statusCompany,
    required this.passengerList, required this.statusTv, this.onAcceptTap, this.onRejectTap, this.onAssignTap,this.onApproveTap
  });

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
                    itemCount: passengerList.length,
                    itemBuilder: (BuildContext context,int index){
                      return ListTile(
                        trailing: IconButton(
                          icon: const Icon(Icons.call,color: Colors.green,),
                          onPressed: ()async{
                            await FlutterPhoneDirectCaller.callNumber(passengerList[index].peopleContact.toString());
                          },
                        ),
                        subtitle: Text("${passengerList[index].peopleContact}"),
                        title: Text(passengerList[index].peopleName!,style: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),),
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

  Widget normal(){
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
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
                  child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(tourType.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w500,color: TVTheme.blackColor)),
          ),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("${DateTime.parse(pickupDatetime).day}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.title),),
                      Text("${DateFormat.MMM().format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.subHeader),),
                      Text(DateFormat.jm().format(DateTime.parse(pickupDatetime)),style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.locationDot,size: Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(child: Text(" ${pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.locationArrow,size:Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(
                              child: Text(
                                dropLocation.toString() ==""?" N/A ": " ${dropLocation.toString()} ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
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
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child:
                passengerList.isEmpty?
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "No Co-passengers",
                      style: GoogleFonts.lato(fontSize: Constants.subHeader),
                    )
                ):
                GestureDetector(
                  onTap: (){
                    showEmployeeDetails();
                    //showEmployeeDetails(passengerList);
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
                                style: GoogleFonts.lato(fontSize: Constants.subHeader),
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
                                      passengerList.length.toString(),
                                      style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader)
                                  )
                              ),

                              Icon(Icons.info_outline,size: Constants.iconSizeCard,)
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
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
                            child: const Text(
                                "Spoc Name"
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
    );
  }

  Widget agentNew(){
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
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
                  child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(tourType.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w500,color: TVTheme.blackColor)),
          ),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("${DateTime.parse(pickupDatetime).day}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.title),),
                      Text("${DateFormat.MMM().format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.subHeader),),
                      Text(DateFormat.jm().format(DateTime.parse(pickupDatetime)),style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.locationDot,size: Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(child: Text(" ${pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.locationArrow,size:Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(
                              child: Text(
                                dropLocation.toString() ==""?" N/A ": " ${dropLocation.toString()} ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
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
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child:
                passengerList.isEmpty?
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "No Co-passengers",
                      style: GoogleFonts.lato(fontSize: Constants.subHeader),
                    )
                ):
                GestureDetector(
                  onTap: (){
                    showEmployeeDetails();
                    //showEmployeeDetails(passengerList);
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
                                style: GoogleFonts.lato(fontSize: Constants.subHeader),
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
                                      passengerList.length.toString(),
                                      style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader)
                                  )
                              ),

                              Icon(Icons.info_outline,size: Constants.iconSizeCard,)
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
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
                            child: const Text(
                                "Spoc Name"
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
            padding: EdgeInsets.only(right: 10),
            child: ElevatedButton.icon(
              icon: Icon(Icons.edit,color: TVTheme.secondColor,),
              onPressed: onAssignTap,
              label: const Text(
                  "Assign"
              ),
            ),
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
          )
        ],
      ),
    );
  }

  Widget approverNew(){
    return Card(
      elevation: 5,
      surfaceTintColor: Colors.white,
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
                  child: Text(referenceNo.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader, fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(tourType.toString(),style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w600,color: TVTheme.primaryColor),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontSize: Constants.subHeader,fontWeight: FontWeight.w500,color: TVTheme.blackColor)),
          ),
          const Divider(height: 2),
          Padding(
            padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("${DateTime.parse(pickupDatetime).day}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.title),),
                      Text("${DateFormat.MMM().format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.ubuntu(fontWeight: FontWeight.w700,fontSize: Constants.subHeader),),
                      Text(DateFormat.jm().format(DateTime.parse(pickupDatetime)),style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FontAwesomeIcons.locationDot,size: Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(child: Text(" ${pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.locationArrow,size:Constants.iconSizeCard,color: TVTheme.secondColor,),
                          Expanded(
                              child: Text(
                                dropLocation.toString() ==""?" N/A ": " ${dropLocation.toString()} ",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: Constants.subHeader),)),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
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
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
                                )
                            )
                        )
                    ),
                  ],
                ),
              ),

              Expanded(
                flex: 3,
                child:
                passengerList.isEmpty?
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "No Co-passengers",
                      style: GoogleFonts.lato(fontSize: Constants.subHeader),
                    )
                ):
                GestureDetector(
                  onTap: (){
                    showEmployeeDetails();
                    //showEmployeeDetails(passengerList);
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
                                style: GoogleFonts.lato(fontSize: Constants.subHeader),
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
                                      passengerList.length.toString(),
                                      style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader)
                                  )
                              ),

                              Icon(Icons.info_outline,size: Constants.iconSizeCard,)
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
                                    fontWeight: FontWeight.w600,
                                    fontSize: Constants.subHeader
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
                            child: const Text(
                                "Spoc Name"
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
    );
  }

}
