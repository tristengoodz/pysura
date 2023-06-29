import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Subscription$ListenData {
  factory Variables$Subscription$ListenData({required String user_id}) =>
      Variables$Subscription$ListenData._({
        r'user_id': user_id,
      });

  Variables$Subscription$ListenData._(this._$data);

  factory Variables$Subscription$ListenData.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    return Variables$Subscription$ListenData._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Subscription$ListenData<Variables$Subscription$ListenData>
      get copyWith => CopyWith$Variables$Subscription$ListenData(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$ListenData) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    return Object.hashAll([l$user_id]);
  }
}

abstract class CopyWith$Variables$Subscription$ListenData<TRes> {
  factory CopyWith$Variables$Subscription$ListenData(
    Variables$Subscription$ListenData instance,
    TRes Function(Variables$Subscription$ListenData) then,
  ) = _CopyWithImpl$Variables$Subscription$ListenData;

  factory CopyWith$Variables$Subscription$ListenData.stub(TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ListenData;

  TRes call({String? user_id});
}

class _CopyWithImpl$Variables$Subscription$ListenData<TRes>
    implements CopyWith$Variables$Subscription$ListenData<TRes> {
  _CopyWithImpl$Variables$Subscription$ListenData(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ListenData _instance;

  final TRes Function(Variables$Subscription$ListenData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user_id = _undefined}) =>
      _then(Variables$Subscription$ListenData._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$ListenData<TRes>
    implements CopyWith$Variables$Subscription$ListenData<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ListenData(this._res);

  TRes _res;

  call({String? user_id}) => _res;
}

class Subscription$ListenData {
  Subscription$ListenData({this.public_user_by_pk});

  factory Subscription$ListenData.fromJson(Map<String, dynamic> json) {
    final l$public_user_by_pk = json['public_user_by_pk'];
    return Subscription$ListenData(
        public_user_by_pk: l$public_user_by_pk == null
            ? null
            : Subscription$ListenData$public_user_by_pk.fromJson(
                (l$public_user_by_pk as Map<String, dynamic>)));
  }

  final Subscription$ListenData$public_user_by_pk? public_user_by_pk;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public_user_by_pk = public_user_by_pk;
    _resultData['public_user_by_pk'] = l$public_user_by_pk?.toJson();
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public_user_by_pk = public_user_by_pk;
    return Object.hashAll([l$public_user_by_pk]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenData) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$public_user_by_pk = public_user_by_pk;
    final lOther$public_user_by_pk = other.public_user_by_pk;
    if (l$public_user_by_pk != lOther$public_user_by_pk) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$ListenData on Subscription$ListenData {
  CopyWith$Subscription$ListenData<Subscription$ListenData> get copyWith =>
      CopyWith$Subscription$ListenData(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Subscription$ListenData<TRes> {
  factory CopyWith$Subscription$ListenData(
    Subscription$ListenData instance,
    TRes Function(Subscription$ListenData) then,
  ) = _CopyWithImpl$Subscription$ListenData;

  factory CopyWith$Subscription$ListenData.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenData;

  TRes call({Subscription$ListenData$public_user_by_pk? public_user_by_pk});
  CopyWith$Subscription$ListenData$public_user_by_pk<TRes>
      get public_user_by_pk;
}

class _CopyWithImpl$Subscription$ListenData<TRes>
    implements CopyWith$Subscription$ListenData<TRes> {
  _CopyWithImpl$Subscription$ListenData(
    this._instance,
    this._then,
  );

  final Subscription$ListenData _instance;

  final TRes Function(Subscription$ListenData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? public_user_by_pk = _undefined}) =>
      _then(Subscription$ListenData(
          public_user_by_pk: public_user_by_pk == _undefined
              ? _instance.public_user_by_pk
              : (public_user_by_pk
                  as Subscription$ListenData$public_user_by_pk?)));
  CopyWith$Subscription$ListenData$public_user_by_pk<TRes>
      get public_user_by_pk {
    final local$public_user_by_pk = _instance.public_user_by_pk;
    return local$public_user_by_pk == null
        ? CopyWith$Subscription$ListenData$public_user_by_pk.stub(
            _then(_instance))
        : CopyWith$Subscription$ListenData$public_user_by_pk(
            local$public_user_by_pk, (e) => call(public_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenData<TRes>
    implements CopyWith$Subscription$ListenData<TRes> {
  _CopyWithStubImpl$Subscription$ListenData(this._res);

  TRes _res;

  call({Subscription$ListenData$public_user_by_pk? public_user_by_pk}) => _res;
  CopyWith$Subscription$ListenData$public_user_by_pk<TRes>
      get public_user_by_pk =>
          CopyWith$Subscription$ListenData$public_user_by_pk.stub(_res);
}

const documentNodeSubscriptionListenData = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenData'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'public_user_by_pk'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'user_id'),
            value: VariableNode(name: NameNode(value: 'user_id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'message'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'number'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  ),
]);
Subscription$ListenData _parserFn$Subscription$ListenData(
        Map<String, dynamic> data) =>
    Subscription$ListenData.fromJson(data);

class Options$Subscription$ListenData
    extends graphql.SubscriptionOptions<Subscription$ListenData> {
  Options$Subscription$ListenData({
    String? operationName,
    required Variables$Subscription$ListenData variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenData? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionListenData,
          parserFn: _parserFn$Subscription$ListenData,
        );
}

class WatchOptions$Subscription$ListenData
    extends graphql.WatchQueryOptions<Subscription$ListenData> {
  WatchOptions$Subscription$ListenData({
    String? operationName,
    required Variables$Subscription$ListenData variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenData? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionListenData,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenData,
        );
}

class FetchMoreOptions$Subscription$ListenData
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenData({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$ListenData variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionListenData,
        );
}

extension ClientExtension$Subscription$ListenData on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenData>> subscribe$ListenData(
          Options$Subscription$ListenData options) =>
      this.subscribe(options);
  graphql.ObservableQuery<Subscription$ListenData> watchSubscription$ListenData(
          WatchOptions$Subscription$ListenData options) =>
      this.watchQuery(options);
}

graphql.QueryResult<Subscription$ListenData> useSubscription$ListenData(
        Options$Subscription$ListenData options) =>
    graphql_flutter.useSubscription(options);

class Subscription$ListenData$Widget
    extends graphql_flutter.Subscription<Subscription$ListenData> {
  Subscription$ListenData$Widget({
    widgets.Key? key,
    required Options$Subscription$ListenData options,
    required graphql_flutter.SubscriptionBuilder<Subscription$ListenData>
        builder,
    graphql_flutter.OnSubscriptionResult<Subscription$ListenData>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}

class Subscription$ListenData$public_user_by_pk {
  Subscription$ListenData$public_user_by_pk({
    this.message,
    required this.number,
  });

  factory Subscription$ListenData$public_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$number = json['number'];
    return Subscription$ListenData$public_user_by_pk(
      message: (l$message as String?),
      number: (l$number as int),
    );
  }

  final String? message;

  final int number;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$number = number;
    _resultData['number'] = l$number;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    return Object.hashAll([
      l$message,
      l$number,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenData$public_user_by_pk) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (l$number != lOther$number) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Subscription$ListenData$public_user_by_pk
    on Subscription$ListenData$public_user_by_pk {
  CopyWith$Subscription$ListenData$public_user_by_pk<
          Subscription$ListenData$public_user_by_pk>
      get copyWith => CopyWith$Subscription$ListenData$public_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenData$public_user_by_pk<TRes> {
  factory CopyWith$Subscription$ListenData$public_user_by_pk(
    Subscription$ListenData$public_user_by_pk instance,
    TRes Function(Subscription$ListenData$public_user_by_pk) then,
  ) = _CopyWithImpl$Subscription$ListenData$public_user_by_pk;

  factory CopyWith$Subscription$ListenData$public_user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenData$public_user_by_pk;

  TRes call({
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Subscription$ListenData$public_user_by_pk<TRes>
    implements CopyWith$Subscription$ListenData$public_user_by_pk<TRes> {
  _CopyWithImpl$Subscription$ListenData$public_user_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$ListenData$public_user_by_pk _instance;

  final TRes Function(Subscription$ListenData$public_user_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Subscription$ListenData$public_user_by_pk(
        message:
            message == _undefined ? _instance.message : (message as String?),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
      ));
}

class _CopyWithStubImpl$Subscription$ListenData$public_user_by_pk<TRes>
    implements CopyWith$Subscription$ListenData$public_user_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$ListenData$public_user_by_pk(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
  }) =>
      _res;
}
