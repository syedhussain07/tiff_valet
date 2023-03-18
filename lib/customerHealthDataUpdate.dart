import 'package:flutter/material.dart';
import 'package:tiff_valet/customNavigationBar.dart';
import 'package:tiff_valet/enum.dart';
import 'package:tiff_valet/search_Fliter_listview.dart';
import 'package:tiff_valet/updateWeightandHeight.dart';

class customerWeightUpdate extends StatefulWidget {
  const customerWeightUpdate({Key? key}) : super(key: key);

  @override
  State<customerWeightUpdate> createState() => _customerWeightUpdateState();
}

class _customerWeightUpdateState extends State<customerWeightUpdate> {
  final controller = TextEditingController();
  List<customer_health_update> searchId = searchCustomer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5),
          title: Text(
            'Customer Health Profile',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar:
            CustomBottomNavBar(selectedMenu: MenuState.customerWeight),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: Column(
            children: [
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search Member ID",
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                    onChanged: searchIdCustomer,
                  ),
                ),),
              SizedBox(height: 20,),
              Expanded(
                  child: ListView.builder(
                      itemCount: searchId.length,
                      itemBuilder: (context, index) {
                        final searchIds = searchId[index];

                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xfff5f5f5),
                                                    borderRadius:
                                                        BorderRadius.circular(5),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5.0),
                                                    child: Icon(
                                                      Icons.credit_card,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text("Member ID"),
                                              ],
                                            ),
                                            Text(searchId[index]
                                                .customer_ID
                                                .toString())
                                          ],
                                        ),
                                        Divider(),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: AssetImage(
                                                        searchId[index].image,
                                                      )),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(

                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    searchId[index].name,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w600),
                                                  ),

                                                  // SizedBox(
                                                  //   height: 2,
                                                  // ),
                                                  Text(searchId[index].customer_age.toString(),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500),),
                                                  Text(searchId[index].customer_gender,
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500),),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),




                                      ],
                                    ),
                                  ),
                                  MaterialButton(
                                      onPressed:(){
                                         Navigator.push(context, MaterialPageRoute(builder: (context) => updateWeight(data: searchId[index]) ));
                                      },
                                      padding: const EdgeInsets.only(right:0.0),
                                      child: Ink(
                                        decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          ),
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0),bottomRight: Radius.circular(5.0)),
                                        ),
                                        child: Container(
                                          height: 40,
                                           width: double.infinity,
                                           // constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0), // min sizes for Material buttons
                                            alignment: Alignment.center,
                                            child: Text('Update health card',style: TextStyle(color: Colors.white),)

                                        ),
                                      )
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),

                          ],
                        );
                      })),

            ],
          ),
        ));
  }

  void searchIdCustomer(String query){
    final suggestions=searchCustomer.where((searchId)
    {
      final searchOrderId= searchId.customer_ID.toString();
      final input=query.toLowerCase();
      return searchOrderId.contains(input);
    }).toList();

    setState(() {
      searchId=suggestions;
    });
  }
}
