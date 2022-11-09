import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/constants.dart';
import 'results.dart';
import '../components/reusableComponents.dart';

enum Gender{
  male,
  female
}
int height=170;
int weight=80;
int age=10;
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(

              children: [
                Expanded(
                  child: reusableCard(
                    onPress:  (){
                      setState(() {
                   selectedGender=Gender.male;
                         });
                         },
                    childCard: reusableColumn(
                      icon:FontAwesomeIcons.mars,
                      text: 'MALE',
                    ),
                      colour:selectedGender==Gender.male?KActiveColor:kDeactiveColor),
                ),
                SizedBox(width: 5,),
                Expanded(

                  child: reusableCard(
                    onPress: (){
                       setState(() {
                 selectedGender=Gender.female;
                          });
                           },
                    colour:selectedGender==Gender.female?KActiveColor:kDeactiveColor,
                    childCard: reusableColumn(
                      icon: FontAwesomeIcons.venus,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              colour: kDeactiveColor,
              childCard: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'HEIGHT',
                    style: KLabelStyle,

                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(),
                        style: KNumbersStyle,

                      ),  Text(
                        'cm',
                      style: TextStyle( color: Colors.white,)
                      ),

                    ],
                  ),
                  SliderTheme(
                    data:SliderTheme.of(context).copyWith(
                       thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape:RoundSliderOverlayShape(overlayRadius: 30) ,
                      overlayColor: Color(0x29EB1555),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0XFFfe0167),
                            ),
                    child: Slider(
                      min: 120,
                        max: 220,

                        inactiveColor: Color(0XFF4e4e5f),
                        value:height.toDouble(),
                        onChanged:(value){
                          setState(() {
                            height=value.round();
                          });
                        },
                    ),
                  ),
                ],
              ),
            ),

          ),
          Expanded(
            child: Row(

              children: [
                Expanded(
                  child: reusableCard(
                    colour: kDeactiveColor,
                    childCard: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KLabelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style:KNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           RoundedIconButton(
                             icon: FontAwesomeIcons.add,
                             function: (){
                               setState(() {
                                 weight++;
                               });
                             },
                           ),
                            SizedBox(width:10),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 5,),
                Expanded(

                  child: reusableCard(
                    colour: kDeactiveColor,
                    childCard:Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: KLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style:KNumbersStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButton(
                              icon: FontAwesomeIcons.add,
                              function: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(width:10),
                            RoundedIconButton(
                              icon: FontAwesomeIcons.minus,
                              function: (){
                                setState(() {
                                 age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
         GestureDetector(
           onTap: (){
             CalculatorBrain calc=new CalculatorBrain(height: height,weight: weight);
             Navigator.push(context,
                 MaterialPageRoute(builder:(context)=>Results(
                   calculation:calc.calculator(),
                   result:calc.getResult(),
                   advice:calc.getAdvice() ,


                 )));
           },
           child: Container(
             child: Center(child: Text('CALCULATE',style: TextStyle(
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
class RoundedIconButton extends StatelessWidget {

  RoundedIconButton({this.icon,this.function});
  IconData icon;
  Function function;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
      ),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
       onPressed: function,
      fillColor: Color(0XFF444355),

      shape: CircleBorder() ,


    );
  }
}


