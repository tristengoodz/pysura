import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../../common/popups.dart';
import '../../../common/utils.dart';
import '../../../controllers/auth_controller.dart';
import '../../../controllers/graphql_controller.dart';
import '../../../graphql/user.graphql.dart';
import '../../../common/app_route.dart';

class HomePageController extends GetxController {
  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  final _queryResult = ''.obs;
  String get queryResult => _queryResult.value;
  set queryResult(String value) => _queryResult.value = value;

  final _mutationResult = ''.obs;
  String get mutationResult => _mutationResult.value;
  set mutationResult(String value) => _mutationResult.value = value;

  StreamSubscription<QueryResult<Subscription$ListenToPublicUserById>>?
      _subscription;
  final _subscriptionResult = ''.obs;
  String get subscriptionResult => _subscriptionResult.value;
  set subscriptionResult(String value) => _subscriptionResult.value = value;

  final authController = Get.find<AuthController>();
  final graphqlController = Get.find<GraphQLController>();
  final messageTextEditingController = TextEditingController();
  final numberTextEditingController = TextEditingController();

  @override
  onInit() {
    super.onInit();
    _setupSubscription();
  }

  @override
  void onClose() {
    _subscription?.cancel();
    super.onClose();
  }

  Tuple2<String?, GraphQLClient?> _getUidAndGraphqlClient(
      {bool ignoreLoading = false}) {
    final uid = authController.user?.uid;
    if (uid == null) {
      return const Tuple2(null, null);
    }
    final graphqlClient = graphqlController.client;
    if (graphqlClient == null) {
      return const Tuple2(null, null);
    }
    if (ignoreLoading) {
      return Tuple2(uid, graphqlClient);
    }
    if (loading) {
      return const Tuple2(null, null);
    }
    return Tuple2(uid, graphqlClient);
  }

  goToSettings() {
    Get.toNamed(AppRoute.kSettingsRoute);
  }

  _setupSubscription() {
    final checkData = _getUidAndGraphqlClient(ignoreLoading: true);
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    _subscription?.cancel();
    final controller =
        StreamController<QueryResult<Subscription$ListenToPublicUserById>>();
    controller.addStream(
      graphqlClient.subscribe$ListenToPublicUserById(
        Options$Subscription$ListenToPublicUserById(
          variables: Variables$Subscription$ListenToPublicUserById(
            id: uid,
          ),
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      ),
    );

    _subscription = controller.stream.listen((event) {
      if (event.hasException) {
        appLog(event.exception.toString());
        return;
      }
      if (event.isLoading) {
        return;
      }
      final data = event.parsedData?.public_user_by_pk;
      if (data == null) {
        return;
      }
      final message = data.message;
      final number = data.number;
      subscriptionResult = 'Message: $message, Number: $number';
    });
  }

  runQuery() async {
    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    loading = true;
    final result = await graphqlClient.query$GetPublicUserById(
      Options$Query$GetPublicUserById(
        variables: Variables$Query$GetPublicUserById(
          id: uid,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    loading = false;
    final data = result.parsedData?.public_user_by_pk;
    if (result.hasException) {
      queryResult = '';
      showSimpleSnackBar('Error getting public user data');
      appLog(result.exception.toString());
      return;
    }
    if (data == null) {
      queryResult = '';
      showSimpleSnackBar('No public user data found');
      return;
    }

    final message = data.message;
    final number = data.number;
    queryResult = 'Message: $message, Number: $number';
  }

  runMutation() async {
    final newMessage = messageTextEditingController.text;
    final newNumber = int.tryParse(numberTextEditingController.text);

    if (newMessage.isEmpty || newNumber == null) {
      showSimpleSnackBar('Please enter a valid message and number');
      return;
    }

    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    loading = true;
    final result = await graphqlClient.mutate$UpdatePublicUserById(
      Options$Mutation$UpdatePublicUserById(
        variables: Variables$Mutation$UpdatePublicUserById(
          id: uid,
          message: newMessage,
          number: newNumber,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    loading = false;
    final data = result.parsedData?.insert_public_user_one;
    if (result.hasException) {
      mutationResult = '';
      showSimpleSnackBar('Error updating public user data');
      appLog(result.exception.toString());
      return;
    }
    if (data == null) {
      queryResult = '';
      showSimpleSnackBar('No public user data found');
      return;
    }

    final message = data.message;
    final number = data.number;
    mutationResult = 'Message: $message, Number: $number';
  }
}
