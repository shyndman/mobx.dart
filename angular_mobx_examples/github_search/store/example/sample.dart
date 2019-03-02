//import 'package:github/server.dart';
import 'package:store/store.dart';
import 'package:http/http.dart' as http;
  main() async {
    var client = http.Client();
    var store = GithubStore(client,debounceMilliseconds: 1);
    for (var n = 0; n < 20; n++) {
      try {
         store.setSearchToken(n.toString());
        await store.fetchRepos();

        var repos = store.repositories;
        print('${store.status} Repos ${repos.length}');
        if (store.status == StoreStatus.rejected) {
          print(store.error);
          client.close();
          return;
        }
        if (repos.isNotEmpty) {
          print('${repos.first.fullName}');
        }
      } catch (error) {
        print('Error $error');
        store.close();
        return;
      }
    }
  }
