// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

import 'package:github_users/app/data/models/github_user_model.dart';
import 'package:github_users/app/data/repositories/github_repository.dart';

/// _Controller_ da tela **Home**.
class HomeController extends GetxController {
  /// Injetando o _repository_ do GitHub.
  final GithubRepository githubRepository;

  /// Construtor do _controller_.
  HomeController({
    required this.githubRepository,
  });
  
  /// Lista privada que armazenará os usuários do GitHub.
  final List<GithubUserModel> _users = <GithubUserModel>[].obs;
  /// Lista de usuários do GitHub.
  List<GithubUserModel> get users => _users;

  /// Propriedade privada que indica se a consulta de usuários está sendo executada.
  final RxBool _isLoading = false.obs;
  /// Indica se há alguma consulta de usuários do GitHub.
  RxBool get isLoading => _isLoading;

  /// Obtêm os usuários do GitHub e armazena-os na lista local.
  Future<void> getGithubUsers() async {
    _isLoading.value = true;

    final response = await githubRepository.getGithubUsers();
    _users.addAll(response);

    _isLoading.value = false;
  }

  void goToUserDetailPage(String username) {
    Get.toNamed(
      '/users/details',
      arguments: {
        'username': username
      }
    );
    // Get.off -> exclui ultima página
    // Get.offAll -> pushReplacement
    // Get.back -> pop
  }
}
