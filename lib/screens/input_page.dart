import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/calulator_brain.dart';
import 'package:new_project/screens/result_page.dart';

import '../components/bottom_button.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget{
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage>{
  Gender? selectedGender;

  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: ReusableCard(
                onPress: (){

                },
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    lable: 'MALE',
                  ),
                  colour: selectedGender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
              ),
              ),
              Expanded(
                  child: ReusableCard(
                    onPress: (){

                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      lable: 'MALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                  ),
              ),
            ],
          ),
          ),
          Expanded(child: ReusableCard(
            colour: kActiveCardColour,
            cardChild:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(data: SliderTheme.of(context).copyWith(
                  activeTickMarkColor: Colors.white,
                  inactiveTrackColor: Color(0xFF8D8E98),
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 15.0),
                  overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 30.0),
                ), child: Slider(value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue){
                  setState(() {
                    height = newValue.round();
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
                  Expanded(child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon : FontAwesomeIcons.minus,
                              onPress: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPress: (){
                                  setState(() {
                                    weight++;
                                  });
                                }
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Age',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                age.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundIconButton(
                                    icon : FontAwesomeIcons.minus,
                                    onPress: (){
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  ),
                                  RoundIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: (){
                                        setState(() {
                                          age++;
                                        });
                                      }
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
                ],
              ),
          ),

          BottumButton(
            bottomTital : "CALCULATE",
            onTap: (){
              // Create an object of CalculatroBrain class and pass values to constructor;
              CalculatroBrain calc = CalculatroBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    // bmiTesult: calc.calculaotorBMI()
                    bmiTesult: calc.calculaotorBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.geeInterpretatiion(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
    throw UnimplementedError();
  }
}