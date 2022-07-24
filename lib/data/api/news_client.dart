import 'package:dfa_test_project/data/api/news_api.dart';
import 'package:dio/dio.dart';

class NewsClient implements NewsApi {

  final Dio dio;

  NewsClient({required this.dio});

  @override
  Future<List<dynamic>> getNewsList(String url) async {
    List<dynamic> newsJson = [];

    final response = await dio.get(
        url,
    );
    final responseJson = response.data;
    if (responseJson.isNotEmpty) {
      newsJson.addAll(responseJson);
    }
    else {
      throw Exception('Empty response');
    }
    return newsJson;
  }
}