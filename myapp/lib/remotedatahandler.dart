import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class RemoteDataHandler {


static Future<http.Response> getTodos() async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    print(responseJson);
    return response;
  }


  static Future<http.Response> addTodo(TodoItem item, String title, bool done) async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    var body = json.encode({"title": title, "done": done});

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.post(url, body: body, headers: headers);
    final responseJson = json.decode(response.body);
    //item.id = responseJson[responseJson.length-1]["id"];
    return response;
  }

  static Future<http.Response> removeTodo(String id) async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos/$id?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";

    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.delete(url, headers: headers);
    return response;
  }

static Future<String> getLastId() async {
    var url =
        "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    String id;
    Map<String, String> headers = {
      'Content-type': 'application/json',
    };

    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    id = responseJson[responseJson.length-1]["id"];
    return id;
  }
}