import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class reviewValet extends StatefulWidget {
  const reviewValet({Key? key}) : super(key: key);

  @override
  State<reviewValet> createState() => _reviewValetState();
}

class _reviewValetState extends State<reviewValet> {

  int fiveStar=543;
  int fourStar=162;
  int threeStar=29;
  int twoStar=41;
  int oneStar=12;


  int bonusAmount=1200;
  int reedemedAmount=8902;



  @override
  Widget build(BuildContext context) {
    int total=fiveStar+fourStar+threeStar+twoStar+oneStar;
    print((fiveStar/total).toDouble(),);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Color(0xFFF5F5F5),
          title: Text('Review',style: TextStyle(color: Colors.black),),
        ),
        backgroundColor: Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
          child: Column(
            children: [
              Text(
                'Total Reviews',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xff000000),
                    fontSize: 30),
              ),
              SizedBox(height:5,),
              Text("Earn bonus on extra stars",style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,) ,),
              SizedBox(height:40,),
              Container(
                // height: 300,
                // width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0,bottom: 20.0, left: 10,right: 10),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child:Stack(

                                    children: [
                                      ShaderMask(
                                          shaderCallback: (bounds) => LinearGradient(
                                            colors:[Color(0xFF8639B1),
                                              Color(0xFFEB2133),
                                              Color(0xFFFD9E41)],).createShader(bounds),


                                          child: Icon(Icons.star,size: 30,color: Colors.white,)),
                                      Positioned.fill(
                                        top: 0,
                                        right: 0,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '5',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )

                                ),


                              ),
                              SizedBox(width: 10,),
                              LinearPercentIndicator(

                                width:280,
                                lineHeight: 10,
                                percent: (fiveStar/total).toDouble(),
                                barRadius: Radius.circular(10),
                                linearGradient:  LinearGradient(colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],

                              ),
                                //backgroundColor: Color(0xfff5f5f5),

                              ),
                             // Text('HI'),
                            ],
                          ),
                          Text(fiveStar.toString()),





                        ],
                      ),
                      Divider( ),
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
                                    child:Stack(

                                      children: [
                                        ShaderMask(
                                            shaderCallback: (bounds) => LinearGradient(
                                              colors:[Color(0xFF8639B1),
                                                Color(0xFFEB2133),
                                                Color(0xFFFD9E41)],).createShader(bounds),


                                            child: Icon(Icons.star,size: 30,color: Colors.white,)),
                                        Positioned.fill(
                                          top: 0,
                                          right: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '4',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                ),


                              ),
                              SizedBox(width: 10,),
                              LinearPercentIndicator(

                                width:280,
                                lineHeight: 10,
                                percent: (fourStar/total).toDouble(),
                                barRadius: Radius.circular(10),
                                linearGradient:  LinearGradient(colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],

                                ),
                                //backgroundColor: Color(0xfff5f5f5),

                              ),
                            ],
                          ),

                          Text(fourStar.toString()),





                        ],
                      ),
                      Divider( ),
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
                                    child:Stack(

                                      children: [
                                        ShaderMask(
                                            shaderCallback: (bounds) => LinearGradient(
                                              colors:[Color(0xFF8639B1),
                                                Color(0xFFEB2133),
                                                Color(0xFFFD9E41)],).createShader(bounds),


                                            child: Icon(Icons.star,size: 30,color: Colors.white,)),
                                        Positioned.fill(
                                          top: 0,
                                          right: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '3',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                ),


                              ),
                              SizedBox(width: 10,),
                              LinearPercentIndicator(

                                width:280,
                                lineHeight: 10,
                                percent: (threeStar/total).toDouble(),
                                barRadius: Radius.circular(10),
                                linearGradient:  LinearGradient(colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],

                                ),
                                //backgroundColor: Color(0xfff5f5f5),

                              ),
                            ],
                          ),

                          Text(threeStar.toString()),





                        ],
                      ),
                      Divider( ),
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
                                    child:Stack(

                                      children: [
                                        ShaderMask(
                                            shaderCallback: (bounds) => LinearGradient(
                                              colors:[Color(0xFF8639B1),
                                                Color(0xFFEB2133),
                                                Color(0xFFFD9E41)],).createShader(bounds),


                                            child: Icon(Icons.star,size: 30,color: Colors.white,)),
                                        Positioned.fill(
                                          top: 0,
                                          right: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '2',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                ),


                              ),
                              SizedBox(width: 10,),
                              LinearPercentIndicator(

                                width:280,
                                lineHeight: 10,
                                percent: (twoStar/total).toDouble(),
                                barRadius: Radius.circular(10),
                                linearGradient:  LinearGradient(colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],

                                ),
                                //backgroundColor: Color(0xfff5f5f5),

                              ),
                            ],
                          ),

                          Text(twoStar.toString()),





                        ],
                      ),

                      Divider( ),
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
                                    child:Stack(

                                      children: [
                                        ShaderMask(
                                            shaderCallback: (bounds) => LinearGradient(
                                              colors:[Color(0xFF8639B1),
                                                Color(0xFFEB2133),
                                                Color(0xFFFD9E41)],).createShader(bounds),


                                            child: Icon(Icons.star,size: 30,color: Colors.white,)),
                                        Positioned.fill(
                                          top: 0,
                                          right: 0,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              '1',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )

                                ),


                              ),
                              SizedBox(width: 10,),
                              LinearPercentIndicator(

                                width:280,
                                lineHeight: 10,
                                percent: (oneStar/total).toDouble(),
                                barRadius: Radius.circular(10),
                                linearGradient:  LinearGradient(colors: [Color(0xFF8639B1), Color(0xFFEB2133), Color(0xFFFD9E41)],

                                ),
                                //backgroundColor: Color(0xfff5f5f5),

                              ),
                            ],
                          ),

                          Text(oneStar.toString()),





                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height:40,),
              TabBar(
                  indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8639B1),
                          Color(0xFFEB2133),
                          Color(0xFFFD9E41)
                        ],
                      ),
                      borderRadius: BorderRadius.circular(5)

                  ),
                  unselectedLabelColor: Colors.black,

                  tabs: [
                    Tab(text:'Reward',),
                    Tab(text:'Redeemed',),
                  ]),
              SizedBox(height:10,),
              SizedBox(
                height: 120,

                child: TabBarView(
                  children: [ 
                    Container(

                    decoration: BoxDecoration(
                      color: Color(0xffffffff),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0,bottom: 20.0, left: 10,right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Bonus Earned',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('You have earned a bonus of',style: TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.w500,
                              ),),
                              Text("₹ "+bonusAmount.toString(),style: TextStyle(
                                fontSize:16,
                                fontWeight: FontWeight.w500,
                              ),),

                            ],
                          )
                        ],

                      ),
                    ),
                  ),
                    Container(

                      decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0,bottom: 20.0, left: 10,right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amount Settled',style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('You have reedemed a bonus of',style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w500,
                                ),),
                                Text("₹ "+reedemedAmount.toString(),style: TextStyle(
                                  fontSize:16,
                                  fontWeight: FontWeight.w500,
                                ),),

                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),

            ],),
        ),


      ),
    );
  }
}
