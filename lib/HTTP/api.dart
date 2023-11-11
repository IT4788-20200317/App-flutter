import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Local {
  static String username = "";
  static String email = "";
}

Future<http.Response> requestHttp(String route, String method,
    {bool isToken = true, dynamic body}) async {
  //SharedPreferences prefs = await SharedPreferences.getInstance();

  String baseUrl = 'http://10.0.2.2:3333/';

  http.Response response;
  var headers = {
    'Content-Type': 'application/json',
    'Authorization': '',
  };

  switch (method) {
    case 'GET':
      response = await http.get(Uri.parse('$baseUrl$route'), headers: headers);
      break;
    case 'POST':
      response = await http.post(Uri.parse('$baseUrl$route'),
          headers: headers, body: body);
      print("Code = " + response.statusCode.toString());
      break;
    case 'PUT':
      response = await http.put(Uri.parse('$baseUrl$route'),
          headers: headers, body: body);
      break;
    case 'DELETE':
      response =
          await http.delete(Uri.parse('$baseUrl$route'), headers: headers);
      break;
    default:
      throw Exception('Invalid HTTP method');
  }

  return response;
}
