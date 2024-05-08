import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
void main(){
  runApp(myApp());

}
class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Home(),
   );
  }

}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController ageControler = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController wightController= TextEditingController();

  double? result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.grey,
        actions: [
          IconButton(onPressed: (){
            dispose();
          }, icon: Icon(Icons.replay)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert_outlined)),
        ],
      ),
      body:
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: ageControler,
                      decoration: InputDecoration(
                        labelText: "Age",


                      ),

                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: ftController,
                      decoration: InputDecoration(
                        labelText: "Ht(ft)",


                      ),

                    ),
                  ),


                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: inchController,
                      decoration: InputDecoration(
                        labelText: "Ht(inch)",


                      ),

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: ()
                  {

                  },
                      icon: Icon(Icons.male_rounded)),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.safety_divider)),
                  IconButton(onPressed: (){},
                      icon: Icon(Icons.female_rounded)),
                  SizedBox(
                    width: 70,
                    child: TextFormField(
                      controller: wightController,
                      decoration: InputDecoration(
                        labelText: "Wight",


                      ),

                    ),
                  ),
                  IconButton(onPressed: (){
                    // double? ft = double.tryParse(ftController.text) ?? 0;
                    // double? inch = double.tryParse(inchController.text) ?? 0;
                    // double? wt = double.tryParse(wightController.text) ?? 0;
                    // double? meter = (ft*12+inch) * (0.0254) ?? 0;
                    //  ans = wt / (meter * meter);
                    double? f = double.tryParse(ftController.text) ?? 0;
                    double? i = double.tryParse(inchController.text) ?? 0;
                    double? w = double.tryParse(wightController.text) ?? 0;

                    double? meter = (f * 12 + i) * (0.0254) ?? 0;
                    result = (w / (meter * meter));
                    setState(() {

                    });
                    print(result);

                  },
                      icon: Icon(Icons.check)),




                ],
              ),
              SizedBox(
                width: 250,
                child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 15, maximum: 40,
                          ranges: <GaugeRange>[
                            GaugeRange(startValue: 15, endValue: 18, color:Colors.orange),
                            GaugeRange(startValue: 19,endValue: 25,color: Colors.green),
                            GaugeRange(startValue: 25,endValue: 40,color: Colors.red)],
                          pointers: <GaugePointer>[
                            NeedlePointer(value: result?.toDouble() ?? 0)],
                          annotations: <GaugeAnnotation>[
                            GaugeAnnotation(widget: Container(child:
                            Text(
                                result!.toStringAsFixed(2).toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,))),
                                angle: 90, positionFactor: 0.5,
                            )]
                      )]),
              ),
              SizedBox(
                height: 36,
              ),
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Very Severaly UnderWeight",style:
                     TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 24,
                       color: (result?.toDouble() ?? 0) <15.9
                         ? Colors.green
                           : Colors.black,
                       letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text("<-15.9",style:
                       TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold, color: (result?.toDouble() ?? 0) <15.9
                           ? Colors.green
                           : Colors.black,
                           letterSpacing: .4
                       ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Severaly UnderWeight",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24,
                         color: (result?.toDouble() ?? 0) >=16.0 &&
                           (result?.toDouble() ?? 0) <=16.9
                             ? Colors.green
                             : Colors.black,
                       letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text("16.0-16.9",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold, color: (result?.toDouble() ?? 0) >=16.0 &&
                         (result?.toDouble() ?? 0) <=16.9
                         ? Colors.green
                         : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("UnderWeight",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24,
                         color: (result?.toDouble() ?? 0) >=17.0 &&
                             (result?.toDouble() ?? 0) <=18.4
                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text("17.0-18.4",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,color: (result?.toDouble() ?? 0) >=17.0 &&
                         (result?.toDouble() ?? 0) <=18.4
                         ? Colors.green
                         : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Normal",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24, color: (result?.toDouble() ?? 0) >=18.5 &&
                         (result?.toDouble() ?? 0) <=24.9
                         ? Colors.green
                         : Colors.black,
                         letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text("18.5-24.9",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: (result?.toDouble() ?? 0) >=18.5 &&
                             (result?.toDouble() ?? 0) <=24.9
                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Over Weight",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24
                     )
                       ,),
                     Spacer(),
                     Text("25.0-29.9",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: (result?.toDouble() ?? 0) >=25.0 &&
                             (result?.toDouble() ?? 0) <=29.9
                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("obese Class |",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24
                     )
                       ,),
                     Spacer(),
                     Text("25.0-29.9",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold, color: (result?.toDouble() ?? 0) >=25.0 &&
                         (result?.toDouble() ?? 0) <=29.9
                         ? Colors.green
                         : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Obese Classs ||",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24,
                         color: ((result?.toDouble() ?? 0) >=30.0 &&
                             (result?.toDouble() ?? 0) <=34.9)
                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text("30.0-34.9",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: ((result?.toDouble() ?? 0) >=30.0 &&
                             (result?.toDouble() ?? 0) <=34.9)
                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4

                     ),
                     )
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Text("Obese Class |||",style:
                     TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 24,
                         color: (result?.toDouble() ?? 0) >=35.0

                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     )
                       ,),
                     Spacer(),
                     Text(">35.0",style:
                     TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: (result?.toDouble() ?? 0) >=35.0

                             ? Colors.green
                             : Colors.black,
                         letterSpacing: .4
                     ),
                     )
                   ],
                 ),


               ],
             )
            ],



          ),

        ),
      )

    );
  }
  @override
  void dispose() {

    super.dispose();
    ageControler.clear();
    ftController.clear();
    wightController.clear();
    inchController.clear();


  }
}
