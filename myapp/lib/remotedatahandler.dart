import 'dart:convert';
import 'package:http/http.dart' as http;

import 'model.dart';

class RemoteDataHandler {

  static Future<http.Response> getTodos() async {
    var url ="https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    return response;
  }

  static Future<http.Response> addTodo(TodoItem item, String title, bool done) async {
    var url = "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    var body = json.encode({"title": title, "done": done});
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.post(url, body: body, headers: headers);
    return response;
  }

  static Future<http.Response> removeTodo(String id) async {
    var url = "https://todoapp-api-vldfm.ondigitalocean.app/todos/$id?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.delete(url, headers: headers);
    return response;
  }

  static Future<http.Response> updateTodo(String id, String title, bool done) async {
    var url ="https://todoapp-api-vldfm.ondigitalocean.app/todos/$id?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    var body = json.encode({"title": title, "done": done});
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.put(url, body: body, headers: headers);
    return response;
  }

  static Future<String> getLastId() async {
    var url = "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    String id = responseJson[responseJson.length - 1]["id"];
    return id;
  }

  static Future<String> getId(int index) async {
    var url = "https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    String id = responseJson[index]["id"];
    return id;
  }

  static Future<String> getTitle(int index) async {
    var url ="https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    String title = responseJson[index]["title"];
    return title;
  }

  static Future<bool> getDone(int index) async {
    var url ="https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    bool done = responseJson[index]["done"];
    return done;
  }

  static Future<int> getLengthOfList() async {
    var url ="https://todoapp-api-vldfm.ondigitalocean.app/todos?key=8c369cde-628d-431c-b83c-8b9e1f765b9c";
    Map<String, String> headers = {'Content-type': 'application/json',};
    final response = await http.get(url, headers: headers);
    final responseJson = json.decode(response.body);
    int length = responseJson.length;
    return length;
  }
}
