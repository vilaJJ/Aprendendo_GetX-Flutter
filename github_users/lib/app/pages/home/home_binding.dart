import 'package:get/instance_manager.dart';
import 'package:github_users/app/pages/home/home_controller.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';
import 'package:github_users/app/services/http/http_services.dart';

void setupHome() {
  Get.put<HomeController>(
    HomeController(
      githubRepository: GithubRepository(
        httpService: HttpServices()
      )
    )
  );
}