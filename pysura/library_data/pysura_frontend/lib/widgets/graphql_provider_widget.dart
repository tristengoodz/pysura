import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:get/get.dart';

import '../common/app_color.dart';
import '../controllers/graphql_controller.dart';

class GraphQLProviderWidget extends StatelessWidget {
  final Widget child;
  const GraphQLProviderWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final graphqlController = Get.find<GraphQLController>();
    final graphqlClient = graphqlController.client;
    if (graphqlClient == null) {
      return Center(
        child: CircularProgressIndicator(
          color: AppColor.primary,
        ),
      );
    }
    final client = ValueNotifier<GraphQLClient>(
      graphqlClient,
    );

    return GraphQLProvider(
      client: client,
      child: CacheProvider(
        child: child,
      ),
    );
  }
}
