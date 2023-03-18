import 'package:flutter/material.dart';
import 'package:tiff_valet/orderHistory.dart';
import 'package:tiff_valet/reviewValet.dart';
import 'package:tiff_valet/customerHealthDataUpdate.dart';

class navigationDrawer extends StatelessWidget {
   navigationDrawer({Key? key}) : super(key: key);

  String valet_name="Rajesh Bro";
  String valet_id = "FES800973";

  @override
  Widget build(BuildContext context) {
    return  Container(

      width: MediaQuery.of(context).size.width * 0.70,

      color: Color.fromRGBO(230, 230, 230, 1.0),
      padding: EdgeInsets.only(top: 70, left: 20, right: 20,bottom: 50),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,

            children: [
              Container(
                height: 100,
                width: 100,
                //child: pickedImage==null? AssetImage('assets/images/G60.png') : FileImage(File(pickedImage.path)),
                decoration: BoxDecoration(
                  border:
                  Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/images/customer_image/cus7.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                valet_name,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                valet_id,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 40,),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> orderHistory()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff5f5f5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.timer_outlined,size: 20,),
                                  ),


                                ),
                                SizedBox(width: 10,),
                                Text("Order History"),
                              ],
                            ),
                          ),
                          Divider( ),

                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> reviewValet()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xfff5f5f5),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.star,size: 20,),
                                  ),


                                ),
                                SizedBox(width: 10,),
                                Text("Review and Rewards"),
                              ],
                            ),
                          ),



                        ],

                      )
                  )),
            ],
          ),











          MaterialButton(onPressed: (){

            // Navigator.push(context, MaterialPageRoute(builder: (context)=> home_screen(delivered_customer_name: customer_name)));
            // //   customer_name: customer_name,
            // //   order_id: order_id,
            // //
            // //   customer_image: customer_image,
            // //   customer_meal: customer_meal,
            // //   customer_address: customer_address,
            // // ))) ;


          },
            child: Ink(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Container(
                    height: 30,
                    constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text('Logout',style: TextStyle(color: Colors.white),)

                ),
              ),
            ),
          ),

        ],
      ),


    );
  }
}
