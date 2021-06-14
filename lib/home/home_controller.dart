import 'package:dev_quiz/core/app_images.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/models/answer_model.dart';
import 'package:dev_quiz/shared/models/question_model.dart';
import 'package:dev_quiz/shared/models/quiz_model.dart';
import 'package:dev_quiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  //Usuário
  //Quizzes
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
        name: "Alex",
        photoUrl: "https://avatars.githubusercontent.com/u/15270558?v=4");

    state = HomeState.success;
  }

  // Simulação de uma chamada à uma API
  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questionAnswered: 1,
          questions: [
            QuestionModel(title: "Está curtiondo o Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Adorando"),
              AnswerModel(title: "Amando"),
              AnswerModel(title: "Muito top!", isRight: true),
            ]),
            QuestionModel(title: "Está curtiondo o Flutter?", answers: [
              AnswerModel(title: "Estou curtindo"),
              AnswerModel(title: "Adorando"),
              AnswerModel(title: "Amando"),
              AnswerModel(title: "Muito top!", isRight: true),
            ]),
          ],
          imagem: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
