// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GithubUserModel {
  final String login;
  final String avatarUrl;
  final String type;
  final String? location;
  final String? name;
  final int? followersCount;
  final int? publicReposCount;

  GithubUserModel({
    required this.login, 
    required this.avatarUrl,
    this.type = 'User',
    this.location, 
    this.name, 
    this.followersCount, 
    this.publicReposCount
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'login': login,
      'avatar_url': avatarUrl,
      'type' : type,
      'location': location,
      'name': name,
      'followers': followersCount,
      'public_repos': publicReposCount,
    };
  }

  factory GithubUserModel.fromMap(Map<String, dynamic> map) {
    return GithubUserModel(
      login: map['login'],
      avatarUrl: map['avatar_url'],
      type: map['type'] ?? 'User',
      location: map['location'],
      name: map['name'],
      followersCount: map['followers'],
      publicReposCount: map['public_repos'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GithubUserModel.fromJson(String source) => GithubUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
