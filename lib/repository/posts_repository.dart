import 'dart:convert';

import 'package:bloc_rest_api_clean_arch/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostsRepository {
  Future<List<PostsModel>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body.map((e) {
        return PostsModel(
          id: e['id'] as int,
          postId: e['postId'] as int,
          email: e['email'] as String,
          body: e['body'] as String,
        );
      }).toList();
    }
    throw Exception('Error while fetching data.');
  }
}
