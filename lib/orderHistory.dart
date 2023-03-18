import 'package:flutter/material.dart';


class orderHistory extends StatefulWidget {
  const orderHistory({Key? key}) : super(key: key);

  @override
  State<orderHistory> createState() => _orderHistoryState();
}

class _orderHistoryState extends State<orderHistory> {
  String deliveryStatus_Date="13th March, 2023";

  List<String> customer_name = [
    'Rahul Tewari',
    'Akansha Preet',
    'Viswapati Narayan',
    'Arpita Sukhdev',
    'Nancy Hellan',
    'Rakulpreet Taneja',
    'Malini Ayar',
    'Vishaka Agarwal'
  ]; // use customer id to call name ... used name for UI only
  List<String> customer_image=['assets/images/customer_image/cus1.png','assets/images/customer_image/cus2.png','assets/images/customer_image/cus3.png','assets/images/customer_image/cus4.png','assets/images/customer_image/cus5.png','assets/images/customer_image/cus6.png','assets/images/customer_image/cus7.png','assets/images/customer_image/cus8.png'];
  List<String> customer_meal = [
    'Vegetarian',
    'Healthy Non Vegetarian',
    'Vegetarian',
    'Healthy Non Vegetarian',
    'Non Vegetarian',
    'Vegetarian',
    'Healthy Vegetarian',
    'Healthy Vegetarian'
  ];
  List<int> order_id=[1878301,18729801,14818401,17827801,172874801,12462701,1427764201,1242401];

  List<String> deliveryTimeStatus=['On Time','On Time','Late','On Time','Late','On Time','On Time','On Time'];
  List<String> deliveryStatus=["Delivered","Not Delivered","Delivered","Not Delivered","Delivered","Delivered","Delivered","Delivered",];
  List<String> exactDeliveryTime=['12:42 ','14:33','16:29 ','14:27','19:15 ','13:22','13:56 ','23:33'];


  // int deliveryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Color(0xFFF5F5F5),
        title: Text('Order Status',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Color(0xFFF5F5F5),
      body: SingleChildScrollView(


        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                'Order History',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                    fontSize: 30),
              ),
              SizedBox(height: 5,),
              Text(deliveryStatus_Date,style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),),
              SizedBox(height: 20,),




              ListView.builder(

                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),

                  itemCount: customer_name.length,

                  itemBuilder: (context, index){

                    return  Column(
                      children: [
                        Container(

                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xfff5f5f5),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Icon(Icons.delivery_dining,size: 20,),
                                          ),


                                        ),
                                        SizedBox(width: 10,),
                                        Text("Delivery ID"),
                                      ],
                                    ),
                                    Text(order_id[index].toString())
                                  ],
                                ),
                                Divider(
                                ),
                                Row(

                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image:DecorationImage(
                                              fit: BoxFit.cover,
                                              image:AssetImage(customer_image[index],)

                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:20.0),
                                      child: Container(
                                        width: 180,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text(customer_name[index],
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w600),),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(customer_meal[index],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),),

                                              

                                          ],




                                        ),
                                      ),
                                    ),


                                  ],
                                ),

                                Divider(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Time"),
                                    Text(exactDeliveryTime[index])

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivery Time"),
                                    Text(deliveryTimeStatus[index],style: TextStyle(color:deliveryTimeStatus[index]=="On Time"? Colors.green: Colors.red))

                                  ],
                                ),
                                SizedBox(height: 5,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Delivery Status"),
                                    Text(deliveryStatus[index],style: TextStyle(color:deliveryStatus[index]=="Delivered"? Colors.green: Colors.red))

                                  ],
                                ),
                                SizedBox(height: 5,),



                              ],
                            ),
                          ),
                        ),


                        //space between container
                        SizedBox(height: 10,)
                      ],
                    );
                  })





            ],
          ),
        ),
      ),
    );
  }
}
