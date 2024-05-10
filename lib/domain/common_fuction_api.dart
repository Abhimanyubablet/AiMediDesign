import 'package:http/http.dart' as http;

const String baseUrl = 'https://smartmed.co.in:3000/api/';

Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
  final response = await http.get(Uri.parse(baseUrl + endpoint), headers: headers);
  return response.body;
}

Future<dynamic> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
  final response = await http.post(Uri.parse(baseUrl + endpoint), headers: headers, body: body);
  return response.body;
}

Future<dynamic> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
  final response = await http.put(Uri.parse(baseUrl + endpoint), headers: headers, body: body);
  return response.body;
}

Future<dynamic> delete(String endpoint, {Map<String, String>? headers}) async {
  final response = await http.delete(Uri.parse(baseUrl + endpoint), headers: headers);
  return response.body;
}
