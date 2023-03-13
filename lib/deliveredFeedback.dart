import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; //rating bar
import 'package:tiff_valet/home_screen.dart';
class deliveredFeedback extends StatefulWidget {
  final String customer_name;
  final int order_id;
  final String customer_image;
  final String customer_meal;
  final String customer_address;
  const deliveredFeedback(
      {Key? key,
      required this.customer_name,
      required this.order_id,
      required this.customer_image,
      required this.customer_meal,
      required this.customer_address})
      : super(key: key);

  @override
  State<deliveredFeedback> createState() => _deliveredFeedbackState(
      this.customer_name,
      this.order_id,
      this.customer_image,
      this.customer_meal,
      this.customer_address);
}

class _deliveredFeedbackState extends State<deliveredFeedback> {
  final String customer_name;
  final int order_id;
  final String customer_image;
  final String customer_meal;
  final String customer_address;
  _deliveredFeedbackState(this.customer_name, this.order_id,
      this.customer_image, this.customer_meal, this.customer_address);

// variables for rating option
  late final _ratingController;
  late double _rating;

  double _userRating = 0.0;
  int _ratingBarMode = 1;
  double _initialRating = 0.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 30, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Delivery ID : " + order_id.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xfffffffff),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Help"),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            customer_image,
                          )),
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        customer_name,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        customer_meal,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        customer_address.toString(),
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Call"),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.call,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Please rate your \n"
                  "experience with customer",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(
              height: 20,
            ),
            Center(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),


            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 2,
            ),

            Expanded(
              child: SizedBox(

              ),
            ),

            Expanded(
              child: MaterialButton(onPressed: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=> home_screen(delivered_customer_name: customer_name)));
                //   customer_name: customer_name,
                //   order_id: order_id,
                //
                //   customer_image: customer_image,
                //   customer_meal: customer_meal,
                //   customer_address: customer_address,
                // ))) ;


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
                        child: Text('Submit',style: TextStyle(color: Colors.white),)

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
