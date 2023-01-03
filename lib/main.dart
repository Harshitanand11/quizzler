import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper=[];

  // List<String> questions = [
  //    'You can lead a cow down stairs but not up stairs.',
  //     'Approximately one quarter of human bones are in the feet.',
  //     'A slug\'s blood is green.',
  // ];
  // List<bool> ans=[false,true,true ];

  int questoinno=0;
  int countt=0;
  int countf=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(questoinno),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
             style: TextButton.styleFrom(
                 primary: Colors.white,
               backgroundColor: Colors.green,
               ),

              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctans = quizBrain.getCorrectAnswer(questoinno);
                setState(() {
                  if(correctans==true){
                    scorekeeper.add(Icon(Icons.check_box, color: Colors.green));
                    countt++;
                  }else {
                    scorekeeper.add(Icon(Icons.close_rounded, color: Colors.red));
                    countf++;
                  }
                  if(questoinno<12) {
                    questoinno++;
                  }else {


                      print('game over \n Number of correct answer $countt \n number of wrong anwers $countf'
                          '\n accuracy->${countt/13*100}');

                    Alert(context: context, title: "QUIZ", desc: "GAME OVER",buttons: [
                    DialogButton(
                    child: Text(
                    "Check Score",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  onPressed: () => print('Number of correct answer $countt \n number of wrong anwers $countf'
                      '\n accuracy->${countt/13*100}'),
                  width: 170,
                  )
                  ],).show();

                  }

                });

                quizBrain.getQuestionText(questoinno) ;

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style:TextButton.styleFrom(
               primary: Colors.red,
                backgroundColor: Colors.red,
              ) ,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctans = quizBrain.getCorrectAnswer(questoinno);
                setState(() {
                  if(correctans==false){
                    scorekeeper.add(Icon(Icons.check_box, color: Colors.green));
                    countt++;
                  }else {
                    (scorekeeper.add(Icon(Icons.close_rounded, color: Colors.red))

                  );
                    countf++;
                  }
                  if(questoinno<12) {
                    questoinno++;
                  }else {
                    print('game over \n ')
                    ;
                    Alert(context: context, title: "QUIZ", desc: "GAME OVER ",buttons: [
                      DialogButton(
                        child: Text(
                          "Check Sore",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () => print('Number of correct answer $countt \n number of wrong anwers $countf'
                  '\n accuracy->${countt/13*100}'),

                        width: 170,
                      )
                    ],).show();
                  }

                });

                quizBrain.getQuestionText(questoinno);
                //The user picked false.
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper;
        Row(
          children: scorekeeper,


        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
