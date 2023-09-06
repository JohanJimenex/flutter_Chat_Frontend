class YesNoModel {
  late String fromWho;
  late String answer;
  late String imgaeUrl;

  YesNoModel(Map<String, dynamic> jsonResponse) {
    fromWho = "other";
    answer = jsonResponse["answer"];
    imgaeUrl = jsonResponse["image"];
  }

  //Forma comun y original de Fernando Herrera
  // YesNoModel(
  // {required this.fromWho, required this.answer, required this.imgaeUrl});

  // factory YesNoModel.fromJsonObj(Map<String, dynamic> jsonObj) {
  //   return YesNoModel(
  //       fromWho: "other",
  //       answer: jsonObj["answer"],
  //       imgaeUrl: jsonObj["image"]);
  // }
}
