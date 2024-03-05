import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:github_users/app/data/models/github_user_model.dart';
import 'package:github_users/app/pages/user_details/user_details_binding.dart';
import 'package:github_users/app/pages/user_details/user_details_controller.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  late final UserDetailsController _controller;
  late final String username;

  @override
  void initState() {
    super.initState();

    setupUserDetails();

    _controller = Get.find<UserDetailsController>(); 
    username = Get.arguments['username'];
    _controller.getGithubUser(username: username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (_controller.githubUser == null) {
          return Center(
            child: Text("User '${_controller.githubUser!.name ?? 'unknown id.'}' not found."),
          );
        }

        final githubUser = _controller.githubUser!;
        return _userInfo(githubUser);
      }),
    );
  }

  Widget _userInfo(GithubUserModel githubUser) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              githubUser.avatarUrl,
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.emoji_people_rounded,
              color: Theme.of(context).primaryColor
            ),
            title: const Text(
              'Name',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              githubUser.name ?? 'No name',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.short_text_rounded,
              color: Theme.of(context).primaryColor
            ),
            title: Text(
              githubUser.type,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              githubUser.login,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.grain_outlined,
              color: Theme.of(context).primaryColor
            ),
            title: const Text(
              'Public repositories',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              (githubUser.publicReposCount ?? 0).toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.people_rounded,
              color: Theme.of(context).primaryColor
            ),
            title: const Text(
              'Followers',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              (githubUser.followersCount ?? 0).toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Icons.location_on_rounded,
              color: Theme.of(context).primaryColor
            ),
            title: const Text(
              'Location',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold
              ),
            ),
            subtitle: Text(
              githubUser.location ?? 'No info',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
      ),
    );
  }
}