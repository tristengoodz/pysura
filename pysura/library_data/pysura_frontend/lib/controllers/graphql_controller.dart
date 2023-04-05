import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../common/constants.dart';
import '../common/utils.dart';

class GraphQLController extends GetxController {
  final _client = Rxn<GraphQLClient>();
  GraphQLClient? get client {
    if (_client.value == null) {
      client = _graphqlClient();
    }
    return _client.value;
  }

  set client(GraphQLClient? value) => _client.value = value;

  final _token = Rxn<String>();
  String? get token => _token.value;
  set token(String? value) => _token.value = value;

  GraphQLClient _graphqlClient() {
    final httpLink = HttpLink(Constants.kGraphqlHttpUrl);

    final authLink = AuthLink(
      // ignore: undefined_identifier
      // this gets called when the user makes a graphql request
      getToken: getToken,
    );

    var link = authLink.concat(httpLink);
    if (Constants.kEnableWebsockets) {
      final websocketLink = WebSocketLink(Constants.kGraphqlWsUrl,
          config: SocketClientConfig(
              autoReconnect: true,
              inactivityTimeout: const Duration(seconds: 30),
              initialPayload: () async {
                return {
                  "headers": {
                    "Authorization": await authLink.getToken(),
                  }
                };
              }));

      link = Link.split(
        (request) => request.isSubscription,
        websocketLink,
        link,
      );
    }

    return GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    appLog("GraphqlController onInit");
    client = _graphqlClient();
  }

  Future<String> getToken() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return "";
    }

    var token = await user.getIdTokenResult(true);
    this.token = "Bearer ${token.token!}";
    return "Bearer ${token.token!}";
  }
}
