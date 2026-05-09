class AgreementResponseModel {
  final int totalClauses;
  final List results;

  AgreementResponseModel({
    required this.totalClauses,
    required this.results,
  });

  factory AgreementResponseModel.fromJson(Map<String, dynamic> json) {
    return AgreementResponseModel(
      totalClauses: json['total_clauses'] ?? 0,
      results: json['results'] ?? [],
    );
  }
}
