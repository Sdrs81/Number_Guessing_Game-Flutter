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
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.pinkAccent,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Result Page",style: TextStyle(color: Colors.pinkAccent),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.didUserGuess ? Image.asset("images/mutlu_resim.png",color: Colors.deepPurple,)
                : Image.asset("images/uzgun_resim.png",color: Colors.deepPurple,),
            widget.didUserGuess ? Text("You won!",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 40),)
                : Text("You lost!",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 40),),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                child: Text("Play Again",style: TextStyle(color: Colors.pinkAccent,fontSize: 15)),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
