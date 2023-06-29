import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ActionPing {
  factory Variables$Query$ActionPing({required String user_id}) =>
      Variables$Query$ActionPing._({
        r'user_id': user_id,
      });

  Variables$Query$ActionPing._(this._$data);

  factory Variables$Query$ActionPing.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    return Variables$Query$ActionPing._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Variables$Query$ActionPing<Variables$Query$ActionPing>
      get copyWith => CopyWith$Variables$Query$ActionPing(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$ActionPing) ||
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

abstract class CopyWith$Variables$Query$ActionPing<TRes> {
  factory CopyWith$Variables$Query$ActionPing(
    Variables$Query$ActionPing instance,
    TRes Function(Variables$Query$ActionPing) then,
  ) = _CopyWithImpl$Variables$Query$ActionPing;

  factory CopyWith$Variables$Query$ActionPing.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ActionPing;

  TRes call({String? user_id});
}

class _CopyWithImpl$Variables$Query$ActionPing<TRes>
    implements CopyWith$Variables$Query$ActionPing<TRes> {
  _CopyWithImpl$Variables$Query$ActionPing(
    this._instance,
    this._then,
  );

  final Variables$Query$ActionPing _instance;

  final TRes Function(Variables$Query$ActionPing) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user_id = _undefined}) =>
      _then(Variables$Query$ActionPing._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$ActionPing<TRes>
    implements CopyWith$Variables$Query$ActionPing<TRes> {
  _CopyWithStubImpl$Variables$Query$ActionPing(this._res);

  TRes _res;

  call({String? user_id}) => _res;
}

class Query$ActionPing {
  Query$ActionPing({
    this.action_query_ping,
    this.$__typename = 'query_root',
  });

  factory Query$ActionPing.fromJson(Map<String, dynamic> json) {
    final l$action_query_ping = json['action_query_ping'];
    final l$$__typename = json['__typename'];
    return Query$ActionPing(
      action_query_ping: l$action_query_ping == null
          ? null
          : Query$ActionPing$action_query_ping.fromJson(
              (l$action_query_ping as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ActionPing$action_query_ping? action_query_ping;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$action_query_ping = action_query_ping;
    _resultData['action_query_ping'] = l$action_query_ping?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$action_query_ping = action_query_ping;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$action_query_ping,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ActionPing) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$action_query_ping = action_query_ping;
    final lOther$action_query_ping = other.action_query_ping;
    if (l$action_query_ping != lOther$action_query_ping) {
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

extension UtilityExtension$Query$ActionPing on Query$ActionPing {
  CopyWith$Query$ActionPing<Query$ActionPing> get copyWith =>
      CopyWith$Query$ActionPing(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ActionPing<TRes> {
  factory CopyWith$Query$ActionPing(
    Query$ActionPing instance,
    TRes Function(Query$ActionPing) then,
  ) = _CopyWithImpl$Query$ActionPing;

  factory CopyWith$Query$ActionPing.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionPing;

  TRes call({
    Query$ActionPing$action_query_ping? action_query_ping,
    String? $__typename,
  });
  CopyWith$Query$ActionPing$action_query_ping<TRes> get action_query_ping;
}

class _CopyWithImpl$Query$ActionPing<TRes>
    implements CopyWith$Query$ActionPing<TRes> {
  _CopyWithImpl$Query$ActionPing(
    this._instance,
    this._then,
  );

  final Query$ActionPing _instance;

  final TRes Function(Query$ActionPing) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? action_query_ping = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionPing(
        action_query_ping: action_query_ping == _undefined
            ? _instance.action_query_ping
            : (action_query_ping as Query$ActionPing$action_query_ping?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ActionPing$action_query_ping<TRes> get action_query_ping {
    final local$action_query_ping = _instance.action_query_ping;
    return local$action_query_ping == null
        ? CopyWith$Query$ActionPing$action_query_ping.stub(_then(_instance))
        : CopyWith$Query$ActionPing$action_query_ping(
            local$action_query_ping, (e) => call(action_query_ping: e));
  }
}

class _CopyWithStubImpl$Query$ActionPing<TRes>
    implements CopyWith$Query$ActionPing<TRes> {
  _CopyWithStubImpl$Query$ActionPing(this._res);

  TRes _res;

  call({
    Query$ActionPing$action_query_ping? action_query_ping,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ActionPing$action_query_ping<TRes> get action_query_ping =>
      CopyWith$Query$ActionPing$action_query_ping.stub(_res);
}

const documentNodeQueryActionPing = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ActionPing'),
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
        name: NameNode(value: 'action_query_ping'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'action_query_ping_input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'data'),
            alias: null,
            arguments: [],
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
Query$ActionPing _parserFn$Query$ActionPing(Map<String, dynamic> data) =>
    Query$ActionPing.fromJson(data);
typedef OnQueryComplete$Query$ActionPing = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ActionPing?,
);

class Options$Query$ActionPing extends graphql.QueryOptions<Query$ActionPing> {
  Options$Query$ActionPing({
    String? operationName,
    required Variables$Query$ActionPing variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ActionPing? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ActionPing? onComplete,
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
                    data == null ? null : _parserFn$Query$ActionPing(data),
                  ),
          onError: onError,
          document: documentNodeQueryActionPing,
          parserFn: _parserFn$Query$ActionPing,
        );

  final OnQueryComplete$Query$ActionPing? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ActionPing
    extends graphql.WatchQueryOptions<Query$ActionPing> {
  WatchOptions$Query$ActionPing({
    String? operationName,
    required Variables$Query$ActionPing variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ActionPing? typedOptimisticResult,
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
          document: documentNodeQueryActionPing,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ActionPing,
        );
}

class FetchMoreOptions$Query$ActionPing extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ActionPing({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$ActionPing variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryActionPing,
        );
}

extension ClientExtension$Query$ActionPing on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ActionPing>> query$ActionPing(
          Options$Query$ActionPing options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$ActionPing> watchQuery$ActionPing(
          WatchOptions$Query$ActionPing options) =>
      this.watchQuery(options);
  void writeQuery$ActionPing({
    required Query$ActionPing data,
    required Variables$Query$ActionPing variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryActionPing),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ActionPing? readQuery$ActionPing({
    required Variables$Query$ActionPing variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryActionPing),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ActionPing.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ActionPing> useQuery$ActionPing(
        Options$Query$ActionPing options) =>
    graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$ActionPing> useWatchQuery$ActionPing(
        WatchOptions$Query$ActionPing options) =>
    graphql_flutter.useWatchQuery(options);

class Query$ActionPing$Widget extends graphql_flutter.Query<Query$ActionPing> {
  Query$ActionPing$Widget({
    widgets.Key? key,
    required Options$Query$ActionPing options,
    required graphql_flutter.QueryBuilder<Query$ActionPing> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$ActionPing$action_query_ping {
  Query$ActionPing$action_query_ping({
    this.data,
    this.$__typename = 'ActionQueryPingOutput',
  });

  factory Query$ActionPing$action_query_ping.fromJson(
      Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$ActionPing$action_query_ping(
      data: l$data == null
          ? null
          : Query$ActionPing$action_query_ping$data.fromJson(
              (l$data as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ActionPing$action_query_ping$data? data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$data = data;
    _resultData['data'] = l$data?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$data,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ActionPing$action_query_ping) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
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

extension UtilityExtension$Query$ActionPing$action_query_ping
    on Query$ActionPing$action_query_ping {
  CopyWith$Query$ActionPing$action_query_ping<
          Query$ActionPing$action_query_ping>
      get copyWith => CopyWith$Query$ActionPing$action_query_ping(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ActionPing$action_query_ping<TRes> {
  factory CopyWith$Query$ActionPing$action_query_ping(
    Query$ActionPing$action_query_ping instance,
    TRes Function(Query$ActionPing$action_query_ping) then,
  ) = _CopyWithImpl$Query$ActionPing$action_query_ping;

  factory CopyWith$Query$ActionPing$action_query_ping.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionPing$action_query_ping;

  TRes call({
    Query$ActionPing$action_query_ping$data? data,
    String? $__typename,
  });
  CopyWith$Query$ActionPing$action_query_ping$data<TRes> get data;
}

class _CopyWithImpl$Query$ActionPing$action_query_ping<TRes>
    implements CopyWith$Query$ActionPing$action_query_ping<TRes> {
  _CopyWithImpl$Query$ActionPing$action_query_ping(
    this._instance,
    this._then,
  );

  final Query$ActionPing$action_query_ping _instance;

  final TRes Function(Query$ActionPing$action_query_ping) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionPing$action_query_ping(
        data: data == _undefined
            ? _instance.data
            : (data as Query$ActionPing$action_query_ping$data?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ActionPing$action_query_ping$data<TRes> get data {
    final local$data = _instance.data;
    return local$data == null
        ? CopyWith$Query$ActionPing$action_query_ping$data.stub(
            _then(_instance))
        : CopyWith$Query$ActionPing$action_query_ping$data(
            local$data, (e) => call(data: e));
  }
}

class _CopyWithStubImpl$Query$ActionPing$action_query_ping<TRes>
    implements CopyWith$Query$ActionPing$action_query_ping<TRes> {
  _CopyWithStubImpl$Query$ActionPing$action_query_ping(this._res);

  TRes _res;

  call({
    Query$ActionPing$action_query_ping$data? data,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ActionPing$action_query_ping$data<TRes> get data =>
      CopyWith$Query$ActionPing$action_query_ping$data.stub(_res);
}

class Query$ActionPing$action_query_ping$data {
  Query$ActionPing$action_query_ping$data({
    this.message,
    required this.number,
    this.$__typename = 'ActionQueryPingOutputData',
  });

  factory Query$ActionPing$action_query_ping$data.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Query$ActionPing$action_query_ping$data(
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
    if (!(other is Query$ActionPing$action_query_ping$data) ||
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

extension UtilityExtension$Query$ActionPing$action_query_ping$data
    on Query$ActionPing$action_query_ping$data {
  CopyWith$Query$ActionPing$action_query_ping$data<
          Query$ActionPing$action_query_ping$data>
      get copyWith => CopyWith$Query$ActionPing$action_query_ping$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ActionPing$action_query_ping$data<TRes> {
  factory CopyWith$Query$ActionPing$action_query_ping$data(
    Query$ActionPing$action_query_ping$data instance,
    TRes Function(Query$ActionPing$action_query_ping$data) then,
  ) = _CopyWithImpl$Query$ActionPing$action_query_ping$data;

  factory CopyWith$Query$ActionPing$action_query_ping$data.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionPing$action_query_ping$data;

  TRes call({
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ActionPing$action_query_ping$data<TRes>
    implements CopyWith$Query$ActionPing$action_query_ping$data<TRes> {
  _CopyWithImpl$Query$ActionPing$action_query_ping$data(
    this._instance,
    this._then,
  );

  final Query$ActionPing$action_query_ping$data _instance;

  final TRes Function(Query$ActionPing$action_query_ping$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionPing$action_query_ping$data(
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

class _CopyWithStubImpl$Query$ActionPing$action_query_ping$data<TRes>
    implements CopyWith$Query$ActionPing$action_query_ping$data<TRes> {
  _CopyWithStubImpl$Query$ActionPing$action_query_ping$data(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ActionPong {
  factory Variables$Mutation$ActionPong({
    required String user_id,
    required String message,
    required int number,
  }) =>
      Variables$Mutation$ActionPong._({
        r'user_id': user_id,
        r'message': message,
        r'number': number,
      });

  Variables$Mutation$ActionPong._(this._$data);

  factory Variables$Mutation$ActionPong.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    final l$number = data['number'];
    result$data['number'] = (l$number as int);
    return Variables$Mutation$ActionPong._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  String get message => (_$data['message'] as String);
  int get number => (_$data['number'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    final l$message = message;
    result$data['message'] = l$message;
    final l$number = number;
    result$data['number'] = l$number;
    return result$data;
  }

  CopyWith$Variables$Mutation$ActionPong<Variables$Mutation$ActionPong>
      get copyWith => CopyWith$Variables$Mutation$ActionPong(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$ActionPong) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$message = message;
    final l$number = number;
    return Object.hashAll([
      l$user_id,
      l$message,
      l$number,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ActionPong<TRes> {
  factory CopyWith$Variables$Mutation$ActionPong(
    Variables$Mutation$ActionPong instance,
    TRes Function(Variables$Mutation$ActionPong) then,
  ) = _CopyWithImpl$Variables$Mutation$ActionPong;

  factory CopyWith$Variables$Mutation$ActionPong.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ActionPong;

  TRes call({
    String? user_id,
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Variables$Mutation$ActionPong<TRes>
    implements CopyWith$Variables$Mutation$ActionPong<TRes> {
  _CopyWithImpl$Variables$Mutation$ActionPong(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ActionPong _instance;

  final TRes Function(Variables$Mutation$ActionPong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Variables$Mutation$ActionPong._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
        if (message != _undefined && message != null)
          'message': (message as String),
        if (number != _undefined && number != null) 'number': (number as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ActionPong<TRes>
    implements CopyWith$Variables$Mutation$ActionPong<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ActionPong(this._res);

  TRes _res;

  call({
    String? user_id,
    String? message,
    int? number,
  }) =>
      _res;
}

class Mutation$ActionPong {
  Mutation$ActionPong({
    this.action_mutation_pong,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$ActionPong.fromJson(Map<String, dynamic> json) {
    final l$action_mutation_pong = json['action_mutation_pong'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionPong(
      action_mutation_pong: l$action_mutation_pong == null
          ? null
          : Mutation$ActionPong$action_mutation_pong.fromJson(
              (l$action_mutation_pong as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ActionPong$action_mutation_pong? action_mutation_pong;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$action_mutation_pong = action_mutation_pong;
    _resultData['action_mutation_pong'] = l$action_mutation_pong?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$action_mutation_pong = action_mutation_pong;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$action_mutation_pong,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ActionPong) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$action_mutation_pong = action_mutation_pong;
    final lOther$action_mutation_pong = other.action_mutation_pong;
    if (l$action_mutation_pong != lOther$action_mutation_pong) {
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

extension UtilityExtension$Mutation$ActionPong on Mutation$ActionPong {
  CopyWith$Mutation$ActionPong<Mutation$ActionPong> get copyWith =>
      CopyWith$Mutation$ActionPong(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Mutation$ActionPong<TRes> {
  factory CopyWith$Mutation$ActionPong(
    Mutation$ActionPong instance,
    TRes Function(Mutation$ActionPong) then,
  ) = _CopyWithImpl$Mutation$ActionPong;

  factory CopyWith$Mutation$ActionPong.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ActionPong;

  TRes call({
    Mutation$ActionPong$action_mutation_pong? action_mutation_pong,
    String? $__typename,
  });
  CopyWith$Mutation$ActionPong$action_mutation_pong<TRes>
      get action_mutation_pong;
}

class _CopyWithImpl$Mutation$ActionPong<TRes>
    implements CopyWith$Mutation$ActionPong<TRes> {
  _CopyWithImpl$Mutation$ActionPong(
    this._instance,
    this._then,
  );

  final Mutation$ActionPong _instance;

  final TRes Function(Mutation$ActionPong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? action_mutation_pong = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionPong(
        action_mutation_pong: action_mutation_pong == _undefined
            ? _instance.action_mutation_pong
            : (action_mutation_pong
                as Mutation$ActionPong$action_mutation_pong?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$ActionPong$action_mutation_pong<TRes>
      get action_mutation_pong {
    final local$action_mutation_pong = _instance.action_mutation_pong;
    return local$action_mutation_pong == null
        ? CopyWith$Mutation$ActionPong$action_mutation_pong.stub(
            _then(_instance))
        : CopyWith$Mutation$ActionPong$action_mutation_pong(
            local$action_mutation_pong, (e) => call(action_mutation_pong: e));
  }
}

class _CopyWithStubImpl$Mutation$ActionPong<TRes>
    implements CopyWith$Mutation$ActionPong<TRes> {
  _CopyWithStubImpl$Mutation$ActionPong(this._res);

  TRes _res;

  call({
    Mutation$ActionPong$action_mutation_pong? action_mutation_pong,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$ActionPong$action_mutation_pong<TRes>
      get action_mutation_pong =>
          CopyWith$Mutation$ActionPong$action_mutation_pong.stub(_res);
}

const documentNodeMutationActionPong = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ActionPong'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'user_id')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'action_mutation_pong'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'action_mutation_pong_input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'user_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'message'),
                value: VariableNode(name: NameNode(value: 'message')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'number'),
                value: VariableNode(name: NameNode(value: 'number')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'data'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'user_id'),
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
Mutation$ActionPong _parserFn$Mutation$ActionPong(Map<String, dynamic> data) =>
    Mutation$ActionPong.fromJson(data);
typedef OnMutationCompleted$Mutation$ActionPong = FutureOr<void> Function(
  Map<String, dynamic>?,
  Mutation$ActionPong?,
);

class Options$Mutation$ActionPong
    extends graphql.MutationOptions<Mutation$ActionPong> {
  Options$Mutation$ActionPong({
    String? operationName,
    required Variables$Mutation$ActionPong variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionPong? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ActionPong? onCompleted,
    graphql.OnMutationUpdate<Mutation$ActionPong>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$ActionPong(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationActionPong,
          parserFn: _parserFn$Mutation$ActionPong,
        );

  final OnMutationCompleted$Mutation$ActionPong? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ActionPong
    extends graphql.WatchQueryOptions<Mutation$ActionPong> {
  WatchOptions$Mutation$ActionPong({
    String? operationName,
    required Variables$Mutation$ActionPong variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionPong? typedOptimisticResult,
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
          document: documentNodeMutationActionPong,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ActionPong,
        );
}

extension ClientExtension$Mutation$ActionPong on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ActionPong>> mutate$ActionPong(
          Options$Mutation$ActionPong options) async =>
      await this.mutate(options);
  graphql.ObservableQuery<Mutation$ActionPong> watchMutation$ActionPong(
          WatchOptions$Mutation$ActionPong options) =>
      this.watchMutation(options);
}

class Mutation$ActionPong$HookResult {
  Mutation$ActionPong$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ActionPong runMutation;

  final graphql.QueryResult<Mutation$ActionPong> result;
}

Mutation$ActionPong$HookResult useMutation$ActionPong(
    [WidgetOptions$Mutation$ActionPong? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ActionPong());
  return Mutation$ActionPong$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ActionPong> useWatchMutation$ActionPong(
        WatchOptions$Mutation$ActionPong options) =>
    graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ActionPong
    extends graphql.MutationOptions<Mutation$ActionPong> {
  WidgetOptions$Mutation$ActionPong({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionPong? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ActionPong? onCompleted,
    graphql.OnMutationUpdate<Mutation$ActionPong>? update,
    graphql.OnError? onError,
  })  : onCompletedWithParsed = onCompleted,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          onCompleted: onCompleted == null
              ? null
              : (data) => onCompleted(
                    data,
                    data == null ? null : _parserFn$Mutation$ActionPong(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationActionPong,
          parserFn: _parserFn$Mutation$ActionPong,
        );

  final OnMutationCompleted$Mutation$ActionPong? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ActionPong
    = graphql.MultiSourceResult<Mutation$ActionPong> Function(
  Variables$Mutation$ActionPong, {
  Object? optimisticResult,
  Mutation$ActionPong? typedOptimisticResult,
});
typedef Builder$Mutation$ActionPong = widgets.Widget Function(
  RunMutation$Mutation$ActionPong,
  graphql.QueryResult<Mutation$ActionPong>?,
);

class Mutation$ActionPong$Widget
    extends graphql_flutter.Mutation<Mutation$ActionPong> {
  Mutation$ActionPong$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ActionPong? options,
    required Builder$Mutation$ActionPong builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ActionPong(),
          builder: (
            run,
            result,
          ) =>
              builder(
            (
              variables, {
              optimisticResult,
              typedOptimisticResult,
            }) =>
                run(
              variables.toJson(),
              optimisticResult:
                  optimisticResult ?? typedOptimisticResult?.toJson(),
            ),
            result,
          ),
        );
}

class Mutation$ActionPong$action_mutation_pong {
  Mutation$ActionPong$action_mutation_pong({
    this.data,
    this.$__typename = 'ActionMutationPongOutput',
  });

  factory Mutation$ActionPong$action_mutation_pong.fromJson(
      Map<String, dynamic> json) {
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionPong$action_mutation_pong(
      data: l$data == null
          ? null
          : Mutation$ActionPong$action_mutation_pong$data.fromJson(
              (l$data as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ActionPong$action_mutation_pong$data? data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$data = data;
    _resultData['data'] = l$data?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$data,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ActionPong$action_mutation_pong) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
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

extension UtilityExtension$Mutation$ActionPong$action_mutation_pong
    on Mutation$ActionPong$action_mutation_pong {
  CopyWith$Mutation$ActionPong$action_mutation_pong<
          Mutation$ActionPong$action_mutation_pong>
      get copyWith => CopyWith$Mutation$ActionPong$action_mutation_pong(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionPong$action_mutation_pong<TRes> {
  factory CopyWith$Mutation$ActionPong$action_mutation_pong(
    Mutation$ActionPong$action_mutation_pong instance,
    TRes Function(Mutation$ActionPong$action_mutation_pong) then,
  ) = _CopyWithImpl$Mutation$ActionPong$action_mutation_pong;

  factory CopyWith$Mutation$ActionPong$action_mutation_pong.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong;

  TRes call({
    Mutation$ActionPong$action_mutation_pong$data? data,
    String? $__typename,
  });
  CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> get data;
}

class _CopyWithImpl$Mutation$ActionPong$action_mutation_pong<TRes>
    implements CopyWith$Mutation$ActionPong$action_mutation_pong<TRes> {
  _CopyWithImpl$Mutation$ActionPong$action_mutation_pong(
    this._instance,
    this._then,
  );

  final Mutation$ActionPong$action_mutation_pong _instance;

  final TRes Function(Mutation$ActionPong$action_mutation_pong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionPong$action_mutation_pong(
        data: data == _undefined
            ? _instance.data
            : (data as Mutation$ActionPong$action_mutation_pong$data?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> get data {
    final local$data = _instance.data;
    return local$data == null
        ? CopyWith$Mutation$ActionPong$action_mutation_pong$data.stub(
            _then(_instance))
        : CopyWith$Mutation$ActionPong$action_mutation_pong$data(
            local$data, (e) => call(data: e));
  }
}

class _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong<TRes>
    implements CopyWith$Mutation$ActionPong$action_mutation_pong<TRes> {
  _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong(this._res);

  TRes _res;

  call({
    Mutation$ActionPong$action_mutation_pong$data? data,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> get data =>
      CopyWith$Mutation$ActionPong$action_mutation_pong$data.stub(_res);
}

class Mutation$ActionPong$action_mutation_pong$data {
  Mutation$ActionPong$action_mutation_pong$data({
    required this.user_id,
    this.$__typename = 'ActionMutationPongOutputData',
  });

  factory Mutation$ActionPong$action_mutation_pong$data.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionPong$action_mutation_pong$data(
      user_id: (l$user_id as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String user_id;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$user_id = user_id;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ActionPong$action_mutation_pong$data) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (l$user_id != lOther$user_id) {
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

extension UtilityExtension$Mutation$ActionPong$action_mutation_pong$data
    on Mutation$ActionPong$action_mutation_pong$data {
  CopyWith$Mutation$ActionPong$action_mutation_pong$data<
          Mutation$ActionPong$action_mutation_pong$data>
      get copyWith => CopyWith$Mutation$ActionPong$action_mutation_pong$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> {
  factory CopyWith$Mutation$ActionPong$action_mutation_pong$data(
    Mutation$ActionPong$action_mutation_pong$data instance,
    TRes Function(Mutation$ActionPong$action_mutation_pong$data) then,
  ) = _CopyWithImpl$Mutation$ActionPong$action_mutation_pong$data;

  factory CopyWith$Mutation$ActionPong$action_mutation_pong$data.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong$data;

  TRes call({
    String? user_id,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ActionPong$action_mutation_pong$data<TRes>
    implements CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> {
  _CopyWithImpl$Mutation$ActionPong$action_mutation_pong$data(
    this._instance,
    this._then,
  );

  final Mutation$ActionPong$action_mutation_pong$data _instance;

  final TRes Function(Mutation$ActionPong$action_mutation_pong$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionPong$action_mutation_pong$data(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong$data<TRes>
    implements CopyWith$Mutation$ActionPong$action_mutation_pong$data<TRes> {
  _CopyWithStubImpl$Mutation$ActionPong$action_mutation_pong$data(this._res);

  TRes _res;

  call({
    String? user_id,
    String? $__typename,
  }) =>
      _res;
}
