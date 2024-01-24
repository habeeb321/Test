import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:test/home_screen/model/animal_model.dart';
import 'package:test/home_screen/model/home_model.dart';
import 'package:test/home_screen/model/list_model.dart';
import 'package:test/home_screen/model/sample_model.dart';
import 'package:test/home_screen/model/single_user_model.dart';
import 'package:test/home_screen/repository/home_service.dart';

class HomeController extends GetxController {
  HomeModel? homeModel;
  List<SampleModel>? sampleModelList;
  SingleUserModel? singleUserModel;
  ListModel? listModel;
  List<AnimalModel>? animalList;
  bool loading = false;

  Future<void> fetchUsers() async {
    loading = true;
    try {
      HomeModel? result = await HomeService.getUsers();
      if (result != null) {
        homeModel = result;
        update();
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
    loading = false;
  }

  Future<void> fetchSingleUsers() async {
    try {
      SingleUserModel? result = await HomeService.getSingleUser();
      if (result != null) {
        singleUserModel = result;
        update();
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> fetchList() async {
    try {
      ListModel? result = await HomeService.getList();
      if (result != null) {
        listModel = result;
        update();
      }
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> fetchSampleUsers() async {
    loading = true;
    update();
    try {
      List<AnimalModel>? result = await HomeService.getAnimals();
      animalList = result;
      update();
    } catch (e) {
      print("Error fetching users: $e");
    }
    loading = false;
    update();
  }
}
