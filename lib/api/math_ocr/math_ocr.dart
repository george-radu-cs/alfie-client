import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

const String mathOcrURIStringified = "http://10.0.2.2:8185/ocr/image-to-tex";

class MathOcrClient {
  final Uri mathOcrURI = Uri.parse(mathOcrURIStringified);

  MathOcrClient._privateConstructor();
  static final MathOcrClient instance = MathOcrClient._privateConstructor();

  Future<MathOcrResponse> convertImageToTex(Uint8List image, String token) async {
    var request = http.MultipartRequest("POST", mathOcrURI);
    var multipartFile = http.MultipartFile.fromBytes("file", image);
    request.files.add(multipartFile);
    Map<String, String> headers = {"authorization": "Bearer $token"};
    request.headers.addAll(headers);

    var response = await request.send();
    if (response.statusCode == 429) {
      return MathOcrResponse(success: false, message: "Too many requests. Please try again later!");
    }

    String responseStringified = await response.stream.bytesToString();
    Map responseJson = jsonDecode(responseStringified);
    bool responseHasError = responseJson["error"];
    String responseMessage = responseJson["message"];

    return MathOcrResponse(success: !responseHasError, message: responseMessage);
  }
}

class MathOcrResponse {
  final bool success;
  final String message;

  MathOcrResponse({required this.success, required this.message});
}
