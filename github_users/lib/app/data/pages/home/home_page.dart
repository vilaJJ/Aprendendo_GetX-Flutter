import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/pages/home/home_binding.dart';
import 'package:github_users/app/data/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// _Controller_ de HomePage.
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();

    setupHome();

    _controller = Get.find<HomeController>();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GitHub Users"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator()
            );
        }
        
        if (_controller.users.isEmpty) {
          return const Center(
            child: Text("No users found."),
          );
        }

        return ListView.separated(
          separatorBuilder: (_, __) => const Divider(height: 0),
          itemCount: _controller.users.length,
          itemBuilder: (_, index) {
            final user = _controller.users[index];

            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.01
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                  ),
                ),
                title: Text(
                  user.type,
                  style: const TextStyle(color: Colors.black54),
                ),
                subtitle: Text(
                  user.login,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onTap: () => _controller.goToUserDetailPage(user.login),
              ),
            );
          },
        );
      }),
    );
  }
}