import '/controllers/graphql_controller.dart';
import '/controllers/auth_controller.dart';

const String kAppName = 'APP_NAME';

const bool kEnableWebsockets = true;
const String kGraphqlHttpUrl = "HTTPS_URL";
const String kGraphqlWsUrl = "WS_URL";
// const String kGraphqlWsUrl = "ws://hasura-eoxtmn5iya-uc.a.run.app/v1/graphql";

AuthController authController = AuthController.instance;
GraphqlController graphqlController = GraphqlController.instance;
