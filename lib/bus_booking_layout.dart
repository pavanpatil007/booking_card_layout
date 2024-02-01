import 'package:booking_card_layout/tv_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'constants.dart';

class BusCardLayout {
  final BuildContext context;
  final String referenceNo;
  final String assessmentCode;
  final String pickupDatetime;
  final String pickupLocation;
  final String dropLocation;
  final String statusCompany;
  final List<dynamic> people;
  final String statusTv;
  final String spocName;
  final GestureTapCallback? onAcceptTap;
  final GestureTapCallback? onRejectTap;
  final GestureTapCallback? onAssignTap;
  final GestureTapCallback? onApproveTap;

  BusCardLayout({
    required this.context,
        required this.referenceNo,
        required this.assessmentCode,
        required this.pickupDatetime,
        required this.pickupLocation,
        required this.dropLocation,
        required this.statusCompany,
        required this.people,
        required this.statusTv,
        required this.spocName,
        this.onAcceptTap,
        this.onRejectTap,
        this.onAssignTap,
        this.onApproveTap,
      });


  Widget normal(){
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.subHeader)),
            ),
            const Divider(height: 2,),

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
                        Text("${DateFormat("MMM").format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
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
                            Icon(FontAwesomeIcons.locationDot,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(child: Text(" ${pickupLocation.toString()==""?pickupLocation.toString().toUpperCase():pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader),)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.locationArrow,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(
                                child: Text(
                                  dropLocation.toString() ==""?" Not Available ": " ${dropLocation.toString()} ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: Constants.subHeader,
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                )
                            ),
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
                                      textStyle:  TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: Constants.subHeader
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
                  child:
                  people.isEmpty?
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "No Peoples",
                        style: GoogleFonts.lato(fontSize: Constants.subHeader),
                      )
                  ):
                  GestureDetector(
                    onTap: (){
                      //showEmployeeDetails(coPassengers);
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
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Constants.subHeader
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
                                  spocName.toString(),
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
            const SizedBox(height: 5),

          ],
        ),
      ),
    );
  }

  Widget newBookingAgent(){
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.subHeader)),
            ),
            const Divider(height: 2,),
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
                        Text("${DateFormat("MMM").format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
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
                            Icon(FontAwesomeIcons.locationDot,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(child: Text(" ${pickupLocation.toString()==""?pickupLocation.toString().toUpperCase():pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader),)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.locationArrow,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(
                                child: Text(
                                  dropLocation.toString() ==""?" Not Available ": " ${dropLocation.toString()} ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: Constants.subHeader,
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                )
                            ),
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
                                      textStyle:  TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: Constants.subHeader
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
                  child:
                  people.isEmpty?
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "No Peoples",
                        style: GoogleFonts.lato(fontSize: Constants.subHeader),
                      )
                  ):
                  GestureDetector(
                    onTap: (){
                      //showEmployeeDetails(coPassengers);
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
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Constants.subHeader
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
                                  spocName.toString(),
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
            const SizedBox(height: 5),
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
            )
          ],
        ),
      ),
    );
  }

  Widget newBookingApprover(){
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("Assessment Code - ${assessmentCode.toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w500,color: TVTheme.blackColor,fontSize: Constants.subHeader)),
            ),
            const Divider(height: 2,),
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
                        Text("${DateFormat("MMM").format(DateTime.parse(pickupDatetime))} ${DateTime.parse(pickupDatetime).year}",style: GoogleFonts.lato(fontSize: Constants.subHeader),),
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
                            Icon(FontAwesomeIcons.locationDot,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(child: Text(" ${pickupLocation.toString()==""?pickupLocation.toString().toUpperCase():pickupLocation.toString()} ",overflow: TextOverflow.ellipsis,maxLines: 1,style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: Constants.subHeader),)),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.locationArrow,size: Constants.iconSize,color: TVTheme.secondColor,),
                            Expanded(
                                child: Text(
                                  dropLocation.toString() ==""?" Not Available ": " ${dropLocation.toString()} ",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: Constants.subHeader,
                                          fontWeight: FontWeight.w600
                                      )
                                  ),
                                )
                            ),
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
                                      textStyle:  TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: Constants.subHeader
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
                  child:
                  people.isEmpty?
                  Container(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "No Peoples",
                        style: GoogleFonts.lato(fontSize: Constants.subHeader),
                      )
                  ):
                  GestureDetector(
                    onTap: (){
                      //showEmployeeDetails(coPassengers);
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
                                        style: GoogleFonts.lato(
                                            fontWeight: FontWeight.w600,
                                            fontSize: Constants.subHeader
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
                                  spocName.toString(),
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
            const SizedBox(height: 5),
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