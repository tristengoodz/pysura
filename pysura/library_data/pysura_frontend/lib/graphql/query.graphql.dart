import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$QueryData {
  factory Variables$Query$QueryData({required String user_id}) =>
      Variables$Query$QueryData._({
        r'user_id': user_id,
      });

  Variables$Query$QueryData._(this._$data);

  factory Variables$Query$QueryData.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    return Variables$Query$QueryData._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Query$QueryData<Variables$Query$QueryData> get copyWith =>
      CopyWith$Variables$Query$QueryData(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$QueryData) ||
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

abstract class CopyWith$Variables$Query$QueryData<TRes> {
  factory CopyWith$Variables$Query$QueryData(
    Variables$Query$QueryData instance,
    TRes Function(Variables$Query$QueryData) then,
  ) = _CopyWithImpl$Variables$Query$QueryData;

  factory CopyWith$Variables$Query$QueryData.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$QueryData;

  TRes call({String? user_id});
}

class _CopyWithImpl$Variables$Query$QueryData<TRes>
    implements CopyWith$Variables$Query$QueryData<TRes> {
  _CopyWithImpl$Variables$Query$QueryData(
    this._instance,
    this._then,
  );

  final Variables$Query$QueryData _instance;

  final TRes Function(Variables$Query$QueryData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user_id = _undefined}) =>
      _then(Variables$Query$QueryData._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$QueryData<TRes>
    implements CopyWith$Variables$Query$QueryData<TRes> {
  _CopyWithStubImpl$Variables$Query$QueryData(this._res);

  TRes _res;

  call({String? user_id}) => _res;
}

class Query$QueryData {
  Query$QueryData({
    this.public_user_by_pk,
    this.$__typename = 'query_root',
  });

  factory Query$QueryData.fromJson(Map<String, dynamic> json) {
    final l$public_user_by_pk = json['public_user_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$QueryData(
      public_user_by_pk: l$public_user_by_pk == null
          ? null
          : Query$QueryData$public_user_by_pk.fromJson(
              (l$public_user_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$QueryData$public_user_by_pk? public_user_by_pk;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$public_user_by_pk = public_user_by_pk;
    _resultData['public_user_by_pk'] = l$public_user_by_pk?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$public_user_by_pk = public_user_by_pk;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$public_user_by_pk,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$QueryData) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$public_user_by_pk = public_user_by_pk;
    final lOther$public_user_by_pk = other.public_user_by_pk;
    if (l$public_user_by_pk != lOther$public_user_by_pk) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$QueryData on Query$QueryData {
  CopyWith$Query$QueryData<Query$QueryData> get copyWith =>
      CopyWith$Query$QueryData(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$QueryData<TRes> {
  factory CopyWith$Query$QueryData(
    Query$QueryData instance,
    TRes Function(Query$QueryData) then,
  ) = _CopyWithImpl$Query$QueryData;

  factory CopyWith$Query$QueryData.stub(TRes res) =
      _CopyWithStubImpl$Query$QueryData;

  TRes call({
    Query$QueryData$public_user_by_pk? public_user_by_pk,
    String? $__typename,
  });
  CopyWith$Query$QueryData$public_user_by_pk<TRes> get public_user_by_pk;
}

class _CopyWithImpl$Query$QueryData<TRes>
    implements CopyWith$Query$QueryData<TRes> {
  _CopyWithImpl$Query$QueryData(
    this._instance,
    this._then,
  );

  final Query$QueryData _instance;

  final TRes Function(Query$QueryData) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public_user_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$QueryData(
        public_user_by_pk: public_user_by_pk == _undefined
            ? _instance.public_user_by_pk
            : (public_user_by_pk as Query$QueryData$public_user_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$QueryData$public_user_by_pk<TRes> get public_user_by_pk {
    final local$public_user_by_pk = _instance.public_user_by_pk;
    return local$public_user_by_pk == null
        ? CopyWith$Query$QueryData$public_user_by_pk.stub(_then(_instance))
        : CopyWith$Query$QueryData$public_user_by_pk(
            local$public_user_by_pk, (e) => call(public_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$QueryData<TRes>
    implements CopyWith$Query$QueryData<TRes> {
  _CopyWithStubImpl$Query$QueryData(this._res);

  TRes _res;

  call({
    Query$QueryData$public_user_by_pk? public_user_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$QueryData$public_user_by_pk<TRes> get public_user_by_pk =>
      CopyWith$Query$QueryData$public_user_by_pk.stub(_res);
}

const documentNodeQueryQueryData = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'QueryData'),
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
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$QueryData _parserFn$Query$QueryData(Map<String, dynamic> data) =>
    Query$QueryData.fromJson(data);
typedef OnQueryComplete$Query$QueryData = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$QueryData?,
);

class Options$Query$QueryData extends graphql.QueryOptions<Query$QueryData> {
  Options$Query$QueryData({
    String? operationName,
    required Variables$Query$QueryData variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$QueryData? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$QueryData? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null ? null : _parserFn$Query$QueryData(data),
                  ),
          onError: onError,
          document: documentNodeQueryQueryData,
          parserFn: _parserFn$Query$QueryData,
        );

  final OnQueryComplete$Query$QueryData? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$QueryData
    extends graphql.WatchQueryOptions<Query$QueryData> {
  WatchOptions$Query$QueryData({
    String? operationName,
    required Variables$Query$QueryData variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$QueryData? typedOptimisticResult,
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
          document: documentNodeQueryQueryData,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$QueryData,
        );
}

class FetchMoreOptions$Query$QueryData extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$QueryData({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$QueryData variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryQueryData,
        );
}

extension ClientExtension$Query$QueryData on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$QueryData>> query$QueryData(
          Options$Query$QueryData options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$QueryData> watchQuery$QueryData(
          WatchOptions$Query$QueryData options) =>
      this.watchQuery(options);
  void writeQuery$QueryData({
    required Query$QueryData data,
    required Variables$Query$QueryData variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryQueryData),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$QueryData? readQuery$QueryData({
    required Variables$Query$QueryData variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryQueryData),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$QueryData.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$QueryData> useQuery$QueryData(
        Options$Query$QueryData options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$QueryData> useWatchQuery$QueryData(
        WatchOptions$Query$QueryData options) =>
    graphql_flutter.useWatchQuery(options);

class Query$QueryData$Widget extends graphql_flutter.Query<Query$QueryData> {
  Query$QueryData$Widget({
    widgets.Key? key,
    required Options$Query$QueryData options,
    required graphql_flutter.QueryBuilder<Query$QueryData> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$QueryData$public_user_by_pk {
  Query$QueryData$public_user_by_pk({
    this.message,
    required this.number,
    this.$__typename = 'public_user',
  });

  factory Query$QueryData$public_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Query$QueryData$public_user_by_pk(
      message: (l$message as String?),
      number: (l$number as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String? message;

  final int number;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$number = number;
    _resultData['number'] = l$number;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$message,
      l$number,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$QueryData$public_user_by_pk) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$QueryData$public_user_by_pk
    on Query$QueryData$public_user_by_pk {
  CopyWith$Query$QueryData$public_user_by_pk<Query$QueryData$public_user_by_pk>
      get copyWith => CopyWith$Query$QueryData$public_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$QueryData$public_user_by_pk<TRes> {
  factory CopyWith$Query$QueryData$public_user_by_pk(
    Query$QueryData$public_user_by_pk instance,
    TRes Function(Query$QueryData$public_user_by_pk) then,
  ) = _CopyWithImpl$Query$QueryData$public_user_by_pk;

  factory CopyWith$Query$QueryData$public_user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$QueryData$public_user_by_pk;

  TRes call({
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$QueryData$public_user_by_pk<TRes>
    implements CopyWith$Query$QueryData$public_user_by_pk<TRes> {
  _CopyWithImpl$Query$QueryData$public_user_by_pk(
    this._instance,
    this._then,
  );

  final Query$QueryData$public_user_by_pk _instance;

  final TRes Function(Query$QueryData$public_user_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$QueryData$public_user_by_pk(
        message:
            message == _undefined ? _instance.message : (message as String?),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$QueryData$public_user_by_pk<TRes>
    implements CopyWith$Query$QueryData$public_user_by_pk<TRes> {
  _CopyWithStubImpl$Query$QueryData$public_user_by_pk(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}
