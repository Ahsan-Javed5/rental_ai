class AskResponseModel {
  final String answer;

  AskResponseModel({
    required this.answer,
  });

  factory AskResponseModel.fromJson(Map<String, dynamic> json) {
    return AskResponseModel(
      answer: json['answer'] ?? '',
    );
  }
}
