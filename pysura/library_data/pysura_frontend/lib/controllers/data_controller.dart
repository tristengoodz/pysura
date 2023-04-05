import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tuple/tuple.dart';

import 'auth_controller.dart';
import 'graphql_controller.dart';

class DataController extends GetxController {
  static DataController instance = Get.find();

  bool _loading = false;

  Tuple2<String?, GraphQLClient?> _getUidAndGraphqlClient(
      {bool ignoreLoading = false}) {
    final authController = Get.find<AuthController>();
    final graphqlController = Get.find<GraphQLController>();
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
    if (_loading) {
      return const Tuple2(null, null);
    }
    return Tuple2(uid, graphqlClient);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
