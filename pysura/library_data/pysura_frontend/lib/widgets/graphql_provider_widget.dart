import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '/common/constants.dart';

class GraphQLProviderWidget extends StatelessWidget {
  final Widget child;

  const GraphQLProviderWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final graphqlClient = graphqlController.client;
    if (graphqlClient == null) {
      return const Center(
        child: CircularProgressIndicator(),
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
