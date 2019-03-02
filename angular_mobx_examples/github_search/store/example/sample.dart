//import 'package:github/server.dart';
import 'package:store/store.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

main() async {
  var client = http.Client();
  var store = GithubStore(client, debounceMilliseconds: 3000);
  ReactionDisposer disposer;
  disposer = autorun((_) {
    print(store.storeStatusString);
    if (store.hasResults ||
        store.fetchReposFuture.status == FutureStatus.rejected) {
      print('Closing');
      disposer();
      client.close();
    }
  });
  store.setSearchToken('111111111');
  store.setSearchToken('22222222');
  store.setSearchToken('objectory');
}
