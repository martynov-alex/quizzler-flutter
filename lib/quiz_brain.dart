import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      'Тараканы на нашей планете существуют около 250 миллионов лет и с тех пор эволюционным изменениям не поддавались.',
      true,
      'Правда.',
    ),
    Question(
      'В производстве динамита используют арахис.',
      true,
      'Правда.',
    ),
    Question(
      'В Англии больше всего автомобилей «роллс-ройс» при расчете на душу населения.',
      false,
      'Нет, в Гонконге.',
    ),
    Question(
      'В Мексике было время, когда мыло было дефицитным товаром и даже выполняло роль денег.',
      true,
      'Да, в 1841 году.',
    ),
    Question(
      'Согласно статистике, в мире раскрываются три кражи из семи.',
      false,
      'Нет, одна из семи.',
    ),
    Question(
      'Женщины с рыжими волосами часто лысеют.',
      false,
      'Неправильно, практически не лысеют.',
    ),
    Question(
      'Огонь кипяток гасит быстрее, чем вода другой температуры.',
      true,
      'Да, благодаря парообразованию.',
    ),
    Question(
      'Когда лошадь фыркает, она просто предупреждает об опасности.',
      false,
      'Нет, лошадь прочищает ноздри, чтобы обострить обоняние.',
    ),
    Question(
      'Куклачев (клоун) для дрессировки кошек применял пистолет.',
      true,
      'Да, водяной.',
    ),
    Question(
      'В США бумажные деньги, которые уже износились, измельчают в порошок.',
      true,
      'Да, из экологических соображений.',
    ),
    Question(
      'Если посчитать суммарное население Китая и Индии, оно превысит треть населения всей планеты.',
      true,
      'Правда.',
    ),
    Question(
      'В число равноапостольных святых церковью включена Мария Магдалина.',
      true,
      'Да.',
    ),
    Question(
      'Диснейленд в Париже является самым посещаемым парком развлечений.',
      false,
      'Нет, самый посещаемый – Диснейленд, который находится в Токио.',
    ),
    Question(
      'Самые огромные доспехи для животных изготавливались для коней рыцарей.',
      false,
      'Нет, для боевых слонов.',
    ),
    Question(
      'Если самолет будет разгоняться по ветру, он взлетит быстрее.',
      false,
      'Нет, быстрее взлетит при разгоне против ветра.',
    ),
    Question(
      'Куры глотают камни, получая из них полезные минералы.',
      false,
      'Ложь, камни помогают перетирать пищу в желудке.',
    ),
    Question(
      'У птиц-хищников самка сильнее и крупнее самца.',
      true,
      'Да.',
    ),
    Question(
      'Оконное окно хорошо пропускает ультрафиолетовые лучи.',
      false,
      'Нет, ультрафиолет хорошо проходит через кварцевое стекло.',
    ),
    Question(
      'Термитник состоит из слюны, навоза и земли.',
      true,
      'Верно.',
    ),
    Question(
      'В момент опасности кенгуру могут развить скорость до 65 километров в час.',
      true,
      'Да.',
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  int getNumberOfQuestions() => _questionBank.length;
  int getNumberCurrentQuestion() => _questionNumber;
  String getQuestionText() => _questionBank[_questionNumber].questionText;
  bool getCorrectAnswer() => _questionBank[_questionNumber].questionAnswer;
  String getQuestionAnswerDetails() =>
      _questionBank[_questionNumber].questionAnswerDetails;

  bool isFinished() {
    bool result = _questionNumber == (_questionBank.length - 1);
    print('${_questionNumber + 1} - ${_questionBank.length}');
    print('Is it last question? - $result');
    return result;
  }

  void reset() => _questionNumber = 0;
}
