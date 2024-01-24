import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test/home_screen/repository/home_service.dart';
import 'package:test/home_screen/view_model/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final HomeController _controller = Get.put(HomeController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeService.getAnimals();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coinbase Currencies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<HomeController>(
          builder: (controller) => controller.loading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controller.homeModel?.data?.length,
                        itemBuilder: (context, index) {
                          var data = _controller.homeModel?.data?[index];
                          return ListTile(
                            title: Text(data?.name ?? ''),
                          );
                        },
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 40,
                      child: Column(
                        children: [
                          Text(
                            _controller.singleUserModel?.support?.text ?? '',
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _controller.animalList?.length,
                        itemBuilder: (context, index) {
                          var data = _controller.animalList?[index];
                          return ListTile(
                            title: Text(data?.description ?? ''),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Trigger data fetching when the button is pressed
          _controller.fetchUsers();
          _controller.fetchSampleUsers();
          _controller.fetchSingleUsers();
          _controller.fetchList();
          HomeService.createUser();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
