import 'dart:convert';
import 'package:http/http.dart' as http;

class RemoteDataHandler {

Future<http.Response> getTodos() async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=2e496760-194a-4ee5-80f5-126ab31b9b0c";

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return response;
  }

  Future<http.Response> addTodo(String title, bool done) async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=2e496760-194a-4ee5-80f5-126ab31b9b0c";
    var body = json.encode({"title": title, "done": done});

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
    print(responseJson[1]);
    return response;
  }

  Future<http.Response> removeTodo(String id) async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos/$id?key=2e496760-194a-4ee5-80f5-126ab31b9b0c";

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.delete(url, headers: headers);
    return response;
  }
}