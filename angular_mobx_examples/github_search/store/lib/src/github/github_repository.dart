import 'dart:async';
import 'package:http/http.dart';

import 'models/models.dart';
import 'github_cache.dart';
import 'github_client.dart';

GithubRepository createRepository(Client httpClient) {
  var githubClient = GithubClient(httpClient: httpClient);
  var cache = GithubCache();
  return GithubRepository(cache, githubClient);
}

class GithubRepository {
  final GithubCache cache;
  final GithubClient client;

  GithubRepository(this.cache, this.client);

  Future<SearchResult> search(String term) async {
    if (cache.contains(term)) {
      return cache.get(term);
    } else {
      final result = await client.search(term);
      cache.set(term, result);
      return result;
    }
  }
}
