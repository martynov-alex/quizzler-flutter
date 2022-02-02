import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int numberOfRightAnswers = 0;

  List scoreKeeper = List<Icon>.filled(
      quizBrain.getNumberOfQuestions(),
      Icon(
        Icons.check_box_outline_blank_outlined,
        color: Colors.yellow[200],
      ),
      growable: true);

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    void fillScoreKeeper() {
      if (userPickedAnswer == correctAnswer) {
        scoreKeeper[quizBrain.getNumberCurrentQuestion()] = Icon(
          Icons.check,
          color: Colors.green,
        );
        numberOfRightAnswers++;
      } else {
        scoreKeeper[quizBrain.getNumberCurrentQuestion()] = Icon(
          Icons.close,
          color: Colors.red,
        );
        Alert(
          context: context,
          title: '${quizBrain.getQuestionText()}',
          desc: 'Правильный ответ: ${quizBrain.getQuestionAnswerDetails()}',
          style: AlertStyle(
            isCloseButton: false,
            overlayColor: Colors.black45,
          ),
          buttons: [
            DialogButton(
              child: Text(
                "Ясно",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ).show();
      }
    }

    setState(() {
      if (quizBrain.isFinished()) {
        fillScoreKeeper();
        Alert(
          context: context,
          style: AlertStyle(
            //animationType: AnimationType.fromLeft,
            descStyle: TextStyle(fontSize: 17),
            isCloseButton: false,
            overlayColor: Colors.black45,
            //isOverlayTapDismiss: false,
            animationDuration: Duration(milliseconds: 300),
          ),
          type: AlertType.success,
          title: 'Все вопросы закончились',
          desc:
              'Правильных ответов $numberOfRightAnswers из ${quizBrain.getNumberOfQuestions()}',
          buttons: [
            DialogButton(
              child: Text(
                'Еще раз',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              width: 120,
            )
          ],
        ).show();
        scoreKeeper = List<Icon>.filled(
            quizBrain.getNumberOfQuestions(),
            Icon(
              Icons.check_box_outline_blank_outlined,
              color: Colors.yellow[200],
            ),
            growable: true);
        quizBrain.reset();
        numberOfRightAnswers = 0;
      } else {
        fillScoreKeeper();
        quizBrain.nextQuestion();
      }
    });
  }

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
                quizBrain.getQuestionText(),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              child: Text(
                'Да',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text(
                'Нет',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
              },
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Прогресс:',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Wrap(
                children: scoreKeeper,
              ),
            ],
          ),
        )
      ],
    );
  }
}
