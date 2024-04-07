class Homework {
  late List<String> courseInvolved;
  late String homeWorkTitle;
  late String description;
  late String creationDate;
  late List<HomeWorkQuestion> questions;

  Homework(
      {required this.courseInvolved,
      required this.homeWorkTitle,
      required this.description,
      required this.questions,
      required this.creationDate});
}

class HomeWorkQuestion {
  late String question;
  late String description;
  late String instruction;
  late String courseName;

  HomeWorkQuestion(
      {required this.courseName,
      required this.description,
      required this.instruction,
      required this.question});
}

class Communication {
  late String title;
  late String content;
  late String type;
  late String publishedDate;

  Communication(
      {required this.title,
      required this.content,
      required this.type,
      required this.publishedDate});
}
