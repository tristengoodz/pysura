import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tuple/tuple.dart';

import '../../../common/utils.dart';
import '../../../controllers/auth_controller.dart';
import '../../../graphql/actions.graphql.dart';
import '../../../common/popups.dart';
import '../../../controllers/graphql_controller.dart';

class ActionPageController extends GetxController {
  final _queryResult = ''.obs;
  String get queryResult => _queryResult.value;
  set queryResult(String value) => _queryResult.value = value;

  final _mutationResult = ''.obs;
  String get mutationResult => _mutationResult.value;
  set mutationResult(String value) => _mutationResult.value = value;

  final _loading = false.obs;
  bool get loading => _loading.value;
  set loading(bool value) => _loading.value = value;

  final queryMessageTextEditingController = TextEditingController();
  final queryNumberTextEditingController = TextEditingController();
  final mutationMessageTextEditingController = TextEditingController();
  final mutationNumberTextEditingController = TextEditingController();

  final authController = Get.find<AuthController>();
  final graphqlController = Get.find<GraphQLController>();

  @override
  onInit() {
    super.onInit();
  }

  @override
  void onClose() {
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

  ping() async {
    final newMessage = queryMessageTextEditingController.text;
    final newNumber = int.tryParse(queryNumberTextEditingController.text);

    if (newMessage.isEmpty || newNumber == null) {
      showSimpleSnackBar('Please enter a valid message and number');
      return;
    }

    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    loading = true;
    final result = await graphqlClient.query$ActionQueryPing(
      Options$Query$ActionQueryPing(
        variables: Variables$Query$ActionQueryPing(
          message: newMessage,
          number: newNumber,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    loading = false;
    final data = result.parsedData?.action_query_ping;
    if (result.hasException) {
      queryResult = '';
      showSimpleSnackBar('Error with ping action');
      appLog(result.exception.toString());
      return;
    }
    if (data == null) {
      queryResult = '';
      showSimpleSnackBar('No data found');
      appLog('data is null');
      return;
    }

    final userData = data.data;

    if (userData == null) {
      queryResult = '';
      showSimpleSnackBar('No user data found');
      appLog('user data is null');
      return;
    }
    final message = userData.message;
    final number = userData.number;
    queryResult = 'Message: $message, Number: $number';
  }

  pong() async {
    final newMessage = mutationMessageTextEditingController.text;
    final newNumber = int.tryParse(mutationNumberTextEditingController.text);

    if (newMessage.isEmpty || newNumber == null) {
      showSimpleSnackBar('Please enter a valid message and number');
      return;
    }

    final checkData = _getUidAndGraphqlClient();
    final uid = checkData.item1;
    final graphqlClient = checkData.item2;
    if (uid == null || graphqlClient == null) return;

    loading = true;
    final result = await graphqlClient.mutate$ActionMutationPong(
      Options$Mutation$ActionMutationPong(
        variables: Variables$Mutation$ActionMutationPong(
          message: newMessage,
          number: newNumber,
        ),
        fetchPolicy: FetchPolicy.networkOnly,
      ),
    );
    loading = false;
    final data = result.parsedData?.action_mutation_pong;
    if (result.hasException) {
      mutationResult = '';
      showSimpleSnackBar('Error with pong action');
      appLog(result.exception.toString());
      return;
    }
    if (data == null) {
      mutationResult = '';
      showSimpleSnackBar('No data found');
      appLog('data is null');
      return;
    }

    final userData = data.data;

    if (userData == null) {
      mutationResult = '';
      showSimpleSnackBar('No user data found');
      appLog('user data is null');
      return;
    }
    final message = userData.message;
    final number = userData.number;
    mutationResult = 'Message: $message, Number: $number';
  }
}
