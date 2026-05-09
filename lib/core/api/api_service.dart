import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/agreement_response_model.dart';
import '../model/ask_response_model.dart';
import 'api_constants.dart';

class ApiService {
  Future<AskResponseModel> askQuestion(String question) async {
    try {
      final url =
          Uri.parse('${ApiConstants.baseUrl}${ApiConstants.askEndpoint}');

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'question': question,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return AskResponseModel.fromJson(data);
      } else {
        throw Exception(
          'Server Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<AgreementResponseModel> analyzeAgreement(String agreement) async {
    try {
      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.analyzeTextEndpoint}',
      );

      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'text': agreement,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return AgreementResponseModel.fromJson(data);
      } else {
        throw Exception(
          'Server Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<AskResponseModel> analyzePdf(String filePath) async {
    try {
      final url = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.analyzePdfEndpoint}',
      );

      var request = http.MultipartRequest(
        'POST',
        url,
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          filePath,
        ),
      );

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(
        streamedResponse,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return AskResponseModel.fromJson(data);
      } else {
        throw Exception(
          'Server Error: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
