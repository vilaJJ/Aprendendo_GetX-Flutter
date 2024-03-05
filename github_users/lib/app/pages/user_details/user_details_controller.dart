// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:github_users/app/data/models/github_user_model.dart';

import 'package:github_users/app/data/repositories/github_repository.dart';

class UserDetailsController extends GetxController {
  final GithubRepository githubRepository;
  
  UserDetailsController({
    required this.githubRepository,
  });

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  GithubUserModel? _githubUser;
  GithubUserModel? get githubUser => _githubUser;

  Future<void> getGithubUser({required String username}) async {
    _isLoading.value = true;

    final user = await githubRepository.getGitHubUser(username: username);
    _githubUser = user;

    _isLoading.value = false;
  }
}
