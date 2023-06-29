import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '/common/utils.dart';
import '/graphql/actions.graphql.dart';
import '/graphql/query.graphql.dart';
import '/graphql/subscription.graphql.dart';
import '/pages/main/settings_popup.dart';
import '/providers/auth_provider.dart';
import '/providers/graphql_provider.dart';

class HomePageProvider extends ChangeNotifier {
  String _message = '';
  String get message => _message;
  set message(String value) {
    _message = value;
    notifyListeners();
  }

  int _number = 0;
  int get number => _number;
  set number(int value) {
    _number = value;
    notifyListeners();
  }

  bool _loadingSubscription = false;
  bool get loadingSubscription => _loadingSubscription;
  set loadingSubscription(bool value) {
    _loadingSubscription = value;
    notifyListeners();
  }

  bool _runningQueryAction = false;
  bool get runningQueryAction => _runningQueryAction;
  set runningQueryAction(bool value) {
    _runningQueryAction = value;
    notifyListeners();
  }

  bool _runningMutationAction = false;
  bool get runningMutationAction => _runningMutationAction;
  set runningMutationAction(bool value) {
    _runningMutationAction = value;
    notifyListeners();
  }

  final BuildContext context;

  late final AuthProvider authProvider;
  late final GraphqlProvider graphqlProvider;
  StreamSubscription<QueryResult<Subscription$ListenData>>? _subscription;

  HomePageProvider({required this.context}) {
    authProvider = context.read<AuthProvider>();
    graphqlProvider = context.read<GraphqlProvider>();

    _queryData();
  }

  @override
  dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  getToken(BuildContext context) async {
    final token = await graphqlProvider.getToken();
    await Clipboard.setData(ClipboardData(text: token));
    appLog('Token copied to clipboard');
  }

  /// get uid and graphql client
  Tuple2<String?, GraphQLClient?> _getUidAndGraphqlClient() {
    final uid = authProvider.user?.uid;
    if (uid == null) {
      return const Tuple2(null, null);
    }
    final graphqlClient = graphqlProvider.client;
    if (graphqlClient == null) {
      return const Tuple2(null, null);
    }
    return Tuple2(uid, graphqlClient);
  }

  _queryData() async {
    appLog('_queryData');
    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    loadingSubscription = true;
    final result = await graphqlClient.query$QueryData(
      Options$Query$QueryData(
        variables: Variables$Query$QueryData(
          user_id: uid,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    loadingSubscription = false;
    if (result.hasException) {
      appLog(result.exception.toString());
      return;
    }
    message = result.parsedData?.public_user_by_pk?.message ?? '';
    number = result.parsedData?.public_user_by_pk?.number ?? 0;

    _listenData();
  }

  _listenData() {
    appLog('_listenData');
    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    final controller = StreamController<QueryResult<Subscription$ListenData>>();
    controller.addStream(
      graphqlClient.subscribe$ListenData(
        Options$Subscription$ListenData(
          variables: Variables$Subscription$ListenData(
            user_id: uid,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      ),
    );

    loadingSubscription = true;
    _subscription?.cancel();
    _subscription = controller.stream.listen((event) {
      if (event.hasException) {
        loadingSubscription = false;
        appLog(event.exception.toString());
        return;
      }
      if (event.isLoading) {
        loadingSubscription = true;
        return;
      }
      message = event.parsedData?.public_user_by_pk?.message ?? '';
      number = event.parsedData?.public_user_by_pk?.number ?? 0;
      loadingSubscription = false;
    });
  }

  Future<Tuple2<String?, int?>> runActionPing() async {
    appLog('runActionPing');
    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return const Tuple2(null, null);

    runningQueryAction = true;
    final result = await graphqlClient.query$ActionPing(
      Options$Query$ActionPing(
        variables: Variables$Query$ActionPing(
          user_id: uid,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    runningQueryAction = false;
    if (result.hasException) {
      appLog(result.exception.toString());
      return const Tuple2(null, null);
    }
    final message = result.parsedData?.action_query_ping?.data?.message ?? '';
    final number = result.parsedData?.action_query_ping?.data?.number ?? 0;
    return Tuple2(message, number);
  }

  Future<bool> runActionPong(
      {required String message, required int number}) async {
    appLog('runActionPong');
    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return false;

    runningMutationAction = true;
    final result = await graphqlClient.mutate$ActionPong(
      Options$Mutation$ActionPong(
        variables: Variables$Mutation$ActionPong(
          user_id: uid,
          message: message,
          number: number,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    runningMutationAction = false;
    if (result.hasException) {
      appLog(result.exception.toString());
      return false;
    }
    final updatedUserId =
        result.parsedData?.action_mutation_pong?.data?.user_id;
    if (updatedUserId == null) {
      appLog('updatedUserId is null');
      return false;
    }
    if (updatedUserId != uid) {
      appLog('updatedUserId is not equal uid');
      return false;
    }
    return true;
  }

  void openSettings(BuildContext context) {
    showDialog(context: context, builder: (_) => const SettingsPopup());
  }
}
