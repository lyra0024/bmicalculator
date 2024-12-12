import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  title: "BMI Calculator",
  home: BMICalculator(),
));

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final fromController=TextEditingController();
  final anotherController=TextEditingController();
  var result = "BMI Index";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height/2,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>
              [
                Text("Weight"),
                ListTile
                  (
                  title: TextField(
                    controller: fromController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  trailing: Text("Kg"),
                ),
                Text("Height"),
                ListTile
                  (
                  title: TextField(
                    controller: anotherController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                  ),
                  trailing: Text("m"),
                ),
                IconButton(onPressed: ()=>convert(context), icon: Icon(Icons.arrow_downward)),
                ListTile(
                  title: Chip(label: Text(result,style: Theme.of(context).textTheme.displaySmall,)),
                  trailing: Text("BMI"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void convert(BuildContext context){
    var height = double.parse(anotherController.text);
    var weight = double.parse(fromController.text);
    var bmi=weight/(height*height);

    if (bmi <= 18.5){
      result="Underweight";
    }
    else if (bmi >= 30){
      result="Overweight";
    }
    else{
      result="Normal";
    }
    
    setState(() {

    });
  }
}