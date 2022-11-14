import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {

  bool didUserGuess;
  ResultPage({required this.didUserGuess});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.didUserGuess ? Image.asset("images/mutlu_resim.png") : Image.asset("images/uzgun_resim.png"),
            widget.didUserGuess ? Text("You won!"): Text("You lost!"),
            ElevatedButton(
              child: Text("Play Again"),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
