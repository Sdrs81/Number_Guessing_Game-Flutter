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
        title: Text("Guessing Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Remaining right to guess: $remainingRightToGuess"),
            Text("Tip: $tip"),
            TextField(
              controller: tfGuess,
              maxLength: 2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Write your guess here",
                prefixIcon: Icon(Icons.tips_and_updates_outlined),
              ),
            ),
            ElevatedButton(
              child: Text("GUESS!"),
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
          ],
        ),
      ),
    );
  }
}
