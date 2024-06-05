import 'package:api_with_bloc/features/models/post_data_ui_model.dart';

import 'package:http/http.dart' as http;

class PostsRepo {
  static Future<List<PostDataUiModel>> fetchPosts() async {
    var client = http.Client();
    List<PostDataUiModel> post = [];
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      post = postDataUiModelFromJson(response.body.toString());

      return post;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  static Future<bool> addPosts() async {
    var client = http.Client();
    try {
      var response = await client
          .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
        "title": 'uday kumar',
        "body": 'checking the post call',
        "userId": "102",
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else
        return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
