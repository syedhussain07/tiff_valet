import 'package:flutter/material.dart';

class not_deliverable extends StatefulWidget {
  final String customer_name;
  final int order_id;
  const not_deliverable({Key? key,required this.customer_name,
    required this.order_id,}) : super(key: key);

  @override
  State<not_deliverable> createState() => _not_deliverableState( this.customer_name,
    this.order_id,);
}


const List<String> list = <String>['Incorrect or incomplete address', 'Unavailable recipient', 'Inaccessible location', 'Refused delivery', 'Damaged or lost package','Customs issues','Weather or natural disasters'];

class _not_deliverableState extends State<not_deliverable> {
  final String customer_name;
  final int order_id;
  String dropdownValue = list.first;
  String? _selectedReason;



  _not_deliverableState( this.customer_name,this.order_id,);
  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 30, top: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Failed to Deliver : " + order_id.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: 10,),
            Divider(color: Colors.white,thickness:2,),
            SizedBox(height: 10,),
            Text(
              customer_name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(height:20,),






            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: DropdownButton<String>(
                  underline: Container(
                    height: 2,
                    color: Colors.white,
                  ),
                  hint: Text("Please provide a reason for the failed delivery"),
                  value: _selectedReason,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedReason = newValue;
                    });
                  },
                  isExpanded: true,
                  dropdownColor: Colors.white,
                  items: <String>['Incorrect or incomplete address', 'Unavailable recipient', 'Inaccessible location', 'Refused delivery', 'Damaged or lost package', 'Customs issues', 'Weather or natural disasters']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),




           Expanded(child: SizedBox()),

            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 50),
              child: MaterialButton(
                  onPressed: () {

                     },
                  padding: const EdgeInsets.only(right: 0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8639B1),
                          Color(0xFFEB2133),
                          Color(0xFFFD9E41)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: Container(
                      height: 30,
                        constraints: const BoxConstraints(
                            minWidth: 60.0,
                            minHeight: 60.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: Text(
                          'Set your delivery location',
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
            ),


          ],


        ),
      ),
    );
  }
}
