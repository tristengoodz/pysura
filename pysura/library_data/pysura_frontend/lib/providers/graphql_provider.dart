import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/common/constants.dart';
import '/common/utils.dart';

class GraphqlProvider extends ChangeNotifier {
  GraphQLClient? _client;
  GraphQLClient? get client {
    _client ??= _graphqlClient();
    return _client;
  }

  set client(GraphQLClient? value) {
    _client = value;
    notifyListeners();
  }

  String? _token;
  String? get token => _token;
  set token(String? value) {
    _token = value;
    notifyListeners();
  }

  GraphqlProvider() {
    appLog("GraphQLProvider created");
    client = _graphqlClient();
  }

  @override
  void dispose() {
    super.dispose();
    appLog("GraphQLProvider disposed");
  }

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

  Future<String> getToken() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      appLog('user is null');
      return "";
    }

    var token = await user.getIdTokenResult(true);
    this.token = "Bearer ${token.token!}";
    return "Bearer ${token.token!}";
  }
}
