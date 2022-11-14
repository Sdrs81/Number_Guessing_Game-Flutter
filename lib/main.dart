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
        title: Text("Home page",),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Guess The Number !",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.pinkAccent),),
            Image.asset("images/zar_resim.png",color: Colors.deepPurple,),
            ElevatedButton(
              child: Text("Start the game"),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GuessingPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
