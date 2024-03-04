import 'package:get/get.dart';
import 'package:github_users/app/data/pages/user_details/user_details_controller.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/services/http/http_services.dart';

void setupUserDetails() {
  Get.put(
    UserDetailsController(
      githubRepository: GithubRepository(
        httpService: HttpServices()
      )
    )
  );
}