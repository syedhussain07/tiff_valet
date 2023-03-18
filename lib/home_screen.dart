import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'customer_food_delivery_tracking.dart';
import 'package:tiff_valet/customNavigationBar.dart';
import 'package:tiff_valet/enum.dart';
import 'package:tiff_valet/navigationDrawerWidget.dart';
import 'package:tiff_valet/enum.dart';

class home_screen extends StatefulWidget {
  final String delivered_customer_name;
  home_screen({Key? key, required this.delivered_customer_name}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState(this.delivered_customer_name);
}

bool _hasBeenPressed1 = false;
bool _hasBeenPressed2 = false;

class _home_screenState extends State<home_screen> {
  static const LatLng sourceLocation = LatLng(25.424486320327784, 81.83339795223421);

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
  List<double> customer_address_latitude = [
    25.4401055,
    25.435609996850403,
    25.425455629002617,
    25.418401327879625,
    25.42917641273111,
    25.431579357834696,
    25.43534662057496,
    25.43819435342683,
  ];
  List<double> customer_address_longitude = [
    81.8323777,
    81.79718716500525,
    81.82164891103655,
    81.81950314384082,
    81.84001667823198,
    81.82851536606287,
    81.83833984439642,
    81.83617749473224
  ];
  List<int> customer_phone_number = [
    1234567890,
    1234567890,
    1234568970,
    12345679870,
    1234569980,
    1234567333,
    1234567444,
    1234567999
  ];
  List<bool> isDelivered=[false,false,false,false,false,false,false,false];
  int _selectedIndex = 0;//for navigationbar

  List<String> customer_address=['23/87 Chowk, Prayagraj, Uttar Pradesh','879/98/1, Dhobi Ghat, Prayagraj, Uttar Pradesh', '988 Dhobi Ghat, Prayagraj, Uttar Pradesh', '87 dhomanganj, Prayagraj, Uttar Pradesh','23/87 Chowk, Prayagraj, Uttar Pradesh','879/98/1, Civil Lines, Prayagraj, Uttar Pradesh', '988 Alopibagh, Prayagraj, Uttar Pradesh', '87 Zero Road, Prayagraj, Uttar Pradesh'];
//customer will not be used on this page ...... this data will go to customer_food_delivery_tracking dart






  final String delivered_customer_name;

  _home_screenState(this.delivered_customer_name);




  void checkDeliveryStatus() {

    for (int i = 0; i < delivered_customer_name.length; i++) {
      String name = delivered_customer_name[i];
      int index = customer_name.indexOf(name);
      if (index != -1) {
        isDelivered[index] = true;
      }
    }
  }
// used in bottomNavigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {

    print(customer_name.toString()+"Init mein hai");
    checkDeliveryStatus();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(

      // bottomNavigationBar: BottomNavigationBar(
      //     showSelectedLabels: false, //selected item
      //     showUnselectedLabels: false,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Business',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'School',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.red,
      //   onTap: _onItemTapped,
      // ),
      drawer: navigationDrawer(),

      bottomNavigationBar: CustomBottomNavBar(selectedMenu:MenuState.home),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F8),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Center(
          child: Image.asset(
            'assets/images/title.png',
            fit: BoxFit.contain,
            //alignment: Alignment.center,
            height: 72,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add_alert,
              color: Colors.redAccent,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.redAccent),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: _hasBeenPressed2 ? Colors.green : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _hasBeenPressed2 = !_hasBeenPressed2;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: _hasBeenPressed2
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("Item Picked",
                                        style: TextStyle(
                                          color: _hasBeenPressed2
                                              ? Colors.white
                                              : Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: _hasBeenPressed1
                                ? Colors.green
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    _hasBeenPressed1 = !_hasBeenPressed1;
                                  });
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.check_circle_outline,
                                      color: _hasBeenPressed1
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Out for Delivery",
                                      style: TextStyle(
                                        color: _hasBeenPressed1
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(isDelivered.where((b) => b == true).length.toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600) ,),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Item Delivered",
                                      style: TextStyle(
                                        color:  Colors.black,
                                      ))
                                ],
                              ),
                            ),
                          ))),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [

                                  Text(isDelivered.where((b) => b == false).length.toString(),style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600) ,),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Not Delivered",
                                    style: TextStyle(
                                      color: Colors.black,

                                    ),
                                  )
                                ],
                              ),
                            ),
                          ))),
                ],
              ),
              SizedBox(
                height: 10,
              ),
             Divider(),




             ListView.builder(
               // physics: const AlwaysScrollableScrollPhysics(),
               // scrollDirection: Axis.vertical,
                 shrinkWrap: true,
                 physics: ClampingScrollPhysics(),

                 itemCount: customer_name.length,
                 itemBuilder: (context, index) {


                   return Column(
                     crossAxisAlignment:CrossAxisAlignment.center,
                     children: [
                       TextButton(
                         onPressed: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=> customer_food_delivery_tracking(
                             customer_name: customer_name[index],
                             order_id: order_id[index],
                             customer_lat: customer_address_latitude[index],
                             customer_long: customer_address_longitude[index],
                             customer_image: customer_image[index],
                             customer_meal: customer_meal[index],
                             customer_address: customer_address[index],
                           ))) ;

                         },

                         child:Container(
                           width: MediaQuery.of(context).size.width,
                           height: 100,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(10)
                           ),
                           child: Row(
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
                                                 fontWeight: FontWeight.w600),),],
                                       ),
                                       SizedBox(
                                         height: 2,
                                       ),
                                       Text(customer_meal[index],
                                         style: TextStyle(
                                             color: Colors.grey,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w500),),
                                       SizedBox(
                                         height: 2,
                                       ),
                                       Text("Order ID: #"+order_id[index].toString(),
                                         style: TextStyle(
                                             color: Colors.grey,
                                             fontSize: 14,
                                             fontWeight: FontWeight.w500),),

                                     ],




                                   ),
                                 ),
                               ),
                               SizedBox(width: 30,),
                               Expanded(
                                 child: Icon(
                                   Icons.maps_home_work,
                                   color: Color(0xffeb4647),
                                 ),
                               ),

                             ],
                           ),


                         ),
                       ),
                       SizedBox(height: 20,),
                     ],) ;
                 }),


            ],
          ),
        ),
      ),
    );
  }
}
//customer_name.contains(growableList[index]) == false? Container(height: 90,color: Colors.green,)




//  Container(
//    height: 400,
//    width: 400,
//    decoration: BoxDecoration(
//      color: Colors.white,
//      borderRadius: BorderRadius.circular(10),
//    ),
//    child: GoogleMap(
//        initialCameraPosition: CameraPosition(
//            target:
//                sourceLocation /*LatLng(currentLocation!.latitude!, currentLocation!.longitude!)*/,
//            zoom: 15),
//        markers: {
//          for (int x = 0; x < customer_address_latitude.length; x++)
//            Marker(
//              icon: sourceIcon,
//              markerId: MarkerId("Source"),
//              position: LatLng(customer_address_latitude[x],
//                  customer_address_longitude[x]),
//            ),
//        }),
//  ),
// SizedBox(
//   height: 50,
// ),
// Scrollable(viewportBuilder: viewportBuilder),