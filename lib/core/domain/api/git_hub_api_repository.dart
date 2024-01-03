import 'package:github_search/core/domain/api/api_constants.dart';
import 'package:http/http.dart' as http;

///
class GitHubApiRepository {
  ///
  Future<String> fetchGitHubRepositoryByName(
    String repositoryName,
  ) async {
    try {
      final finalUrl = apiUrl + repositoryName + sortAndPerPage;
      final url = Uri.parse(finalUrl);
      final response = await http.get(url);

      return response.statusCode == statusCode200 ? response.body : '';
    } catch (e) {
      return '';
    }
  }
}
