import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Results extends StatelessWidget {
  Results({@required this.calculation,@required this.result,@required this.advice});
  final String calculation;
  final String result;
  final String advice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESULTS'),
        centerTitle: true,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 30,top: 20,),
            child: Text(
             'Your Result',
              style:TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Container(

                width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  result.toUpperCase(),
                    style: TextStyle(
                      color: Color(0XFF36b878),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),


                  ),
                  SizedBox(height: 40),
                  Text(
                    calculation,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),



                  ),
                SizedBox(height: 40),
                Text(

                  advice.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(

                    color: Colors.white,
                    fontSize: 18,

                  ),),
                ],
              ),

                decoration: BoxDecoration(
                  color: Color(0XFF1d1f33),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
       GestureDetector(
         onTap: (){
           Navigator.pop(context);
         },
         child: Container(
              child: Center(child: Text('RE-CALCULATE',style: TextStyle(
                color:Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,

              ),)),
              width: double.infinity,
              color: Color(0XFFfe0167),
              height: 60.0,
              margin: EdgeInsets.only(top: 10),
            ),
       ),
        ],
      ),
    );
  }
}
