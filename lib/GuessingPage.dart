import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_number_guessing_game/ResultPage.dart';

class GuessingPage extends StatefulWidget {
  const GuessingPage({Key? key}) : super(key: key);

  @override
  State<GuessingPage> createState() => _GuessingPageState();
}

class _GuessingPageState extends State<GuessingPage> {

  var tfGuess = TextEditingController();
  int guessNumber = 0;
  int remainingRightToGuess = 3;
  String tip = "";

  @override
  void initState() {
    super.initState();
    guessNumber = Random().nextInt(11);
    print("Guess number: $guessNumber");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.pinkAccent,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Guessing Page",style: TextStyle(color: Colors.pinkAccent),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Remaining right to guess: $remainingRightToGuess",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 20),),
            Text("Tip: $tip",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: tfGuess,
                maxLength: 2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Write your guess here",
                  prefixIcon: Icon(Icons.tips_and_updates_outlined,color: Colors.deepPurple,),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                child: Text("GUESS!",style: TextStyle(color: Colors.pinkAccent,fontSize: 15),),
                onPressed: (){

                  if(tfGuess.text == ""){
                    setState(() {
                      tip = "Please enter your guess below!";
                    });
                  }else{
                    setState(() {
                      remainingRightToGuess--;
                    });

                    if(remainingRightToGuess == 0){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(didUserGuess: false,)));
                    }

                    int guessedNumberUser = int.parse(tfGuess.text);

                    if(guessNumber == guessedNumberUser){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(didUserGuess: true,)));
                    }

                    if(guessNumber != guessedNumberUser ){
                      if(guessNumber > guessedNumberUser){
                        setState(() {
                          tip = "Higher!";
                        });
                      }else{
                        setState(() {
                          tip = "Lower!";
                        });
                      }
                    }

                    tfGuess.text = "";
                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
