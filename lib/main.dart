import 'package:flutter/material.dart';
import 'package:flutter_number_guessing_game/GuessingPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page",style: TextStyle(color: Colors.pinkAccent),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Guess The Number !",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
            GestureDetector(
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.deepPurple,
                  duration: Duration(seconds: 3),
                  content: Text("Hit the button below, not me!",style: TextStyle(color: Colors.pinkAccent),),
                  )
                );
              },
                child: Image.asset("images/zar_resim.png",color: Colors.deepPurple,)
            ),
            Text("\"Guess the number that between 0-10\"",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pinkAccent,
                ),
                child: Text("Start the game",style: TextStyle(fontSize: 15,color: Colors.deepPurple),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GuessingPage()));
                },
              ),
            ),
            Text("Powered by Sdrs81",style: TextStyle(color: Colors.deepPurple)),
          ],
        ),
      ),
    );
  }
}
