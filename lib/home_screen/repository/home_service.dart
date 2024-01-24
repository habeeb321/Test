import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test/home_screen/model/animal_model.dart';
import 'package:test/home_screen/model/bpi_model.dart';
import 'package:test/home_screen/model/create_user_model.dart';
import 'package:test/home_screen/model/home_model.dart';
import 'package:test/home_screen/model/list_model.dart';
import 'package:test/home_screen/model/sample_model.dart';
import 'package:test/home_screen/model/single_user_model.dart';
import 'package:test/utils/constants.dart';

class HomeService {
  static Future<HomeModel?> getUsers() async {
    try {
      final url = Uri.parse('https://api.coinbase.com/v2/currencies');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return HomeModel.fromJson(result);
      }
    } catch (e) {
      print("Error getting user: $e");
    }
    return null;
  }

  static Future<SingleUserModel?> getSingleUser() async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}/api/users/2");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return SingleUserModel.fromJson(result);
      }
    } catch (e) {
      print("Error getting user: $e");
    }
    return null;
  }

  static Future<ListModel?> getList() async {
    try {
      final url = Uri.parse("${ApiConstants.baseUrl}/api/users?page=2");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return ListModel.fromJson(result);
      }
    } catch (e) {
      print("Error getting user: $e");
    }
    return null;
  }

  static var body = {"email": "hello@gmail.com", "password": "123"};

  static Future<CreateUserModel?> createUser() async {
    try {
      final url = Uri.parse('https://reqres.in/api/users');
      var response = await http.post(url, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body);
        return CreateUserModel.fromJson(result);
      }
    } catch (e) {
      print("Error getting user11: $e");
    }
    return null;
  }

  static Future<List<SampleModel>?> getSampleUsers() async {
    try {
      final url = Uri.parse('http://192.168.0.3:3000/user');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List result = jsonDecode(response.body);
        return result.map((e) => SampleModel.fromJson(e)).toList();
      }
    } catch (e) {
      print("Error getting user: $e");
    }
    return null;
  }

  static Future<List<AnimalModel>?> getAnimals() async {
    try {
      Uri url = Uri.parse('https://api.publicapis.org/entries');
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List result = jsonDecode(response.body)['entries'];
        return result.map((e) => AnimalModel.fromJson(e)).toList();
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  static Future<BpiModel?> getCrypto() async {
    try {
      Uri url =
          Uri.parse('https://api.artic.edu/api/v1/artworks/search?q=cats');
      http.Response response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> result = jsonDecode(response.body)['pagination'];
        return BpiModel.fromJson(result);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
