// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

import 'package:github_users/app/data/models/github_user_model.dart';
import 'package:github_users/app/services/http/http_services.dart';

class GithubRepository {
  final HttpServices httpService;

  GithubRepository({
    required this.httpService,
  });


  Future<List<GithubUserModel>> getGithubUsers() async {
    final Response response = await httpService.get('https://api.github.com/users');

    final List<GithubUserModel> users = [];

    if (response.statusCode == 200) {
      response.data.map((user) => users.add(GithubUserModel.fromMap(user))).toList();
    }

    return users;
  }

  Future<GithubUserModel?> getGitHubUser({required String username}) async {
    final Response response = await httpService.get('https://api.github.com/users/$username');

    GithubUserModel? user;

    if (response.statusCode == 200) {
      user = GithubUserModel.fromMap(response.data);
    }

    return user;
  }
}
