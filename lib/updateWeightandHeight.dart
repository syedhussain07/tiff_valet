import 'package:flutter/material.dart';
import 'package:tiff_valet/search_Fliter_listview.dart';
import 'package:tiff_valet/scratch.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class updateWeight extends StatefulWidget {
  final customer_health_update data;

  const updateWeight({Key? key, required this.data}) : super(key: key);
  @override
  State<updateWeight> createState() => _updateWeightState();
}

class _updateWeightState extends State<updateWeight> {
  final _formKey = GlobalKey<FormState>();
  double? _height, _weight, _bmi, _bsa, _whr, _bmr, _ibw, _lbm, _tbw, _bfp, _whtr, _rhr;

  double _calculateBMI() {
    return _weight! / pow(_height! / 100, 2);
  }
  double _calculateBSA() {
    return sqrt(_height! * _weight! / 3600);
  }
  double _calculateWHR() {
    return _weight! / _height!;
  }
  double _calculateBMR() {
    return 655 +
        (9.6 * _weight!) +
        (1.8 * _height!) -
        (4.7 * widget.data.customer_age);
  }
  double _calculateIBW() {
    return 50 +
        2.3 * (_height! / 2.54 - 60) +
        (widget.data.customer_age > 40 ? -2 : 0);
  }
  double _calculateLBM() {
    return 0.407 * _weight! + 0.267 * _height! - 19.2;
  }
  double _calculateTBW() {
    return 2.447 -
        0.09145 * widget.data.customer_age +
        0.1074 * _height! +
        0.3362 * _weight!;
  }
  double _calculateBFP() {
    return 1.2 * _calculateBMI() +
        0.23 * widget.data.customer_age -
        10.8 * (1 - (widget.data.customer_gender == "Male" ? 1 : 0));
  }
  double _calculateWHtR() {
    return _weight! / (_height! / 100);
  }
  double _calculateRHR() {
    return (Random().nextInt(41) + 60).toDouble();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
       _bmi = _calculateBMI();
       _bsa= _calculateBSA();
       _bmr =_calculateBMR();
        _whr= _calculateWHR();
       _lbm= _calculateLBM();
        _ibw =_calculateIBW();
        _tbw=_calculateTBW();
       _bfp= _calculateBFP();
        _whtr=_calculateWHtR();
        _rhr=_calculateRHR();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.data.name,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                    fontSize: 30),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Member ID :" + widget.data.customer_ID.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10,right: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your height (in centimeters)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _height = double.parse(value!);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                padding: EdgeInsets.only(left: 10,right: 10, top: 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your weight (in kg)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your weight';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _weight = double.parse(value!);
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                  onPressed: _submitForm,
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
                        constraints: const BoxConstraints(
                            minWidth: 60.0,
                            minHeight: 40.0), // min sizes for Material buttons
                        alignment: Alignment.center,
                        child: Text(
                          'Update',
                          style: TextStyle(color: Colors.white),
                        )),
                  )),
              SizedBox(
                height: 20,
              ),
              if (_bmi != null)Container(
                //height: 300,
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

                      Center(
                        child: Text(
                          'Last Updated On: ${DateFormat.yMMMd().format(DateTime.now())}',
                          style: TextStyle(color: Colors.grey.shade600,fontSize: 16),
                        ),
                      ),
                      Divider( ),
                      SizedBox(height: 10,),
                      //Body Mass Index
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
                                  child: Icon(Icons.accessibility,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Body Mass Index"),
                            ],
                          ),
                          Text(_bmi!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),



                      //Body fat percentage
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
                                  child: Icon(Icons.accessibility_sharp,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Body fat percentage "),
                            ],
                          ),

                          Text(_bfp!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),


                      //Body surface area
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
                                  child: Icon(Icons.straighten,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Body surface area"),
                            ],
                          ),

                          Text(_bsa!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),

                      //Waist-to-Hip Ratio
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
                                  child: Icon(Icons.aspect_ratio,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Waist-to-Hip Ratio"),
                            ],
                          ),

                          Text(_whr!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),
                        //Basal Metabolic Rate
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
                                  child: Icon(Icons.directions_run,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Basal Metabolic Rate"),
                            ],
                          ),

                          Text(_bmr!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),

                      //Ideal Body Weight
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
                                  child: Icon(Icons.accessibility_new,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Ideal Body Weight"),
                            ],
                          ),

                          Text(_ibw!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),


                    //Lean body mass
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
                                  child: Icon(Icons.fitness_center,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Lean body mass"),
                            ],
                          ),

                          Text(_lbm!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),

                    //Total body water
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
                                  child: Icon(Icons.opacity,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Total body water"),
                            ],
                          ),

                          Text(_tbw!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),

                      //Waist-to-Height Ratio

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
                                  child: Icon(Icons.height,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Waist-to-Height Ratio"),
                            ],
                          ),

                          Text(_whtr!.toStringAsFixed(1)),
                        ],
                      ),
                      Divider( ),

                      //Resting Heart Rate
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
                                  child: Icon(Icons.favorite,size: 20,),
                                ),


                              ),
                              SizedBox(width: 10,),
                              Text("Resting Heart Rate "),
                            ],
                          ),

                          Text(_rhr!.toStringAsFixed(1)),
                        ],
                      ),


                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
