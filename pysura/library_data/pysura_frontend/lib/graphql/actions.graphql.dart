import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$ActionQueryPing {
  factory Variables$Query$ActionQueryPing({
    String? message,
    int? number,
  }) =>
      Variables$Query$ActionQueryPing._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
      });

  Variables$Query$ActionQueryPing._(this._$data);

  factory Variables$Query$ActionQueryPing.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    return Variables$Query$ActionQueryPing._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get message => (_$data['message'] as String?);
  int? get number => (_$data['number'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message;
    }
    if (_$data.containsKey('number')) {
      final l$number = number;
      result$data['number'] = l$number;
    }
    return result$data;
  }

  CopyWith$Variables$Query$ActionQueryPing<Variables$Query$ActionQueryPing>
      get copyWith => CopyWith$Variables$Query$ActionQueryPing(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$ActionQueryPing) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (_$data.containsKey('message') != other._$data.containsKey('message')) {
      return false;
    }
    if (l$message != lOther$message) {
      return false;
    }
    final l$number = number;
    final lOther$number = other.number;
    if (_$data.containsKey('number') != other._$data.containsKey('number')) {
      return false;
    }
    if (l$number != lOther$number) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    return Object.hashAll([
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$ActionQueryPing<TRes> {
  factory CopyWith$Variables$Query$ActionQueryPing(
    Variables$Query$ActionQueryPing instance,
    TRes Function(Variables$Query$ActionQueryPing) then,
  ) = _CopyWithImpl$Variables$Query$ActionQueryPing;

  factory CopyWith$Variables$Query$ActionQueryPing.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$ActionQueryPing;

  TRes call({
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Variables$Query$ActionQueryPing<TRes>
    implements CopyWith$Variables$Query$ActionQueryPing<TRes> {
  _CopyWithImpl$Variables$Query$ActionQueryPing(
    this._instance,
    this._then,
  );

  final Variables$Query$ActionQueryPing _instance;

  final TRes Function(Variables$Query$ActionQueryPing) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Variables$Query$ActionQueryPing._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$ActionQueryPing<TRes>
    implements CopyWith$Variables$Query$ActionQueryPing<TRes> {
  _CopyWithStubImpl$Variables$Query$ActionQueryPing(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
  }) =>
      _res;
}

class Query$ActionQueryPing {
  Query$ActionQueryPing({
    this.action_query_ping,
    this.$__typename = 'query_root',
  });

  factory Query$ActionQueryPing.fromJson(Map<String, dynamic> json) {
    final l$action_query_ping = json['action_query_ping'];
    final l$$__typename = json['__typename'];
    return Query$ActionQueryPing(
      action_query_ping: l$action_query_ping == null
          ? null
          : Query$ActionQueryPing$action_query_ping.fromJson(
              (l$action_query_ping as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$ActionQueryPing$action_query_ping? action_query_ping;

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
    if (!(other is Query$ActionQueryPing) || runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$ActionQueryPing on Query$ActionQueryPing {
  CopyWith$Query$ActionQueryPing<Query$ActionQueryPing> get copyWith =>
      CopyWith$Query$ActionQueryPing(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$ActionQueryPing<TRes> {
  factory CopyWith$Query$ActionQueryPing(
    Query$ActionQueryPing instance,
    TRes Function(Query$ActionQueryPing) then,
  ) = _CopyWithImpl$Query$ActionQueryPing;

  factory CopyWith$Query$ActionQueryPing.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionQueryPing;

  TRes call({
    Query$ActionQueryPing$action_query_ping? action_query_ping,
    String? $__typename,
  });
  CopyWith$Query$ActionQueryPing$action_query_ping<TRes> get action_query_ping;
}

class _CopyWithImpl$Query$ActionQueryPing<TRes>
    implements CopyWith$Query$ActionQueryPing<TRes> {
  _CopyWithImpl$Query$ActionQueryPing(
    this._instance,
    this._then,
  );

  final Query$ActionQueryPing _instance;

  final TRes Function(Query$ActionQueryPing) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? action_query_ping = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionQueryPing(
        action_query_ping: action_query_ping == _undefined
            ? _instance.action_query_ping
            : (action_query_ping as Query$ActionQueryPing$action_query_ping?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$ActionQueryPing$action_query_ping<TRes> get action_query_ping {
    final local$action_query_ping = _instance.action_query_ping;
    return local$action_query_ping == null
        ? CopyWith$Query$ActionQueryPing$action_query_ping.stub(
            _then(_instance))
        : CopyWith$Query$ActionQueryPing$action_query_ping(
            local$action_query_ping, (e) => call(action_query_ping: e));
  }
}

class _CopyWithStubImpl$Query$ActionQueryPing<TRes>
    implements CopyWith$Query$ActionQueryPing<TRes> {
  _CopyWithStubImpl$Query$ActionQueryPing(this._res);

  TRes _res;

  call({
    Query$ActionQueryPing$action_query_ping? action_query_ping,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$ActionQueryPing$action_query_ping<TRes>
      get action_query_ping =>
          CopyWith$Query$ActionQueryPing$action_query_ping.stub(_res);
}

const documentNodeQueryActionQueryPing = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'ActionQueryPing'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'message')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'number')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
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
            name: NameNode(value: 'response_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'response_value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'errors'),
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
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
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
Query$ActionQueryPing _parserFn$Query$ActionQueryPing(
        Map<String, dynamic> data) =>
    Query$ActionQueryPing.fromJson(data);
typedef OnQueryComplete$Query$ActionQueryPing = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$ActionQueryPing?,
);

class Options$Query$ActionQueryPing
    extends graphql.QueryOptions<Query$ActionQueryPing> {
  Options$Query$ActionQueryPing({
    String? operationName,
    Variables$Query$ActionQueryPing? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ActionQueryPing? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$ActionQueryPing? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Query$ActionQueryPing(data),
                  ),
          onError: onError,
          document: documentNodeQueryActionQueryPing,
          parserFn: _parserFn$Query$ActionQueryPing,
        );

  final OnQueryComplete$Query$ActionQueryPing? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$ActionQueryPing
    extends graphql.WatchQueryOptions<Query$ActionQueryPing> {
  WatchOptions$Query$ActionQueryPing({
    String? operationName,
    Variables$Query$ActionQueryPing? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$ActionQueryPing? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryActionQueryPing,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$ActionQueryPing,
        );
}

class FetchMoreOptions$Query$ActionQueryPing extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$ActionQueryPing({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$ActionQueryPing? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryActionQueryPing,
        );
}

extension ClientExtension$Query$ActionQueryPing on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$ActionQueryPing>> query$ActionQueryPing(
          [Options$Query$ActionQueryPing? options]) async =>
      await this.query(options ?? Options$Query$ActionQueryPing());
  graphql.ObservableQuery<Query$ActionQueryPing> watchQuery$ActionQueryPing(
          [WatchOptions$Query$ActionQueryPing? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$ActionQueryPing());
  void writeQuery$ActionQueryPing({
    required Query$ActionQueryPing data,
    Variables$Query$ActionQueryPing? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryActionQueryPing),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$ActionQueryPing? readQuery$ActionQueryPing({
    Variables$Query$ActionQueryPing? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryActionQueryPing),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$ActionQueryPing.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$ActionQueryPing> useQuery$ActionQueryPing(
        [Options$Query$ActionQueryPing? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$ActionQueryPing());
graphql.ObservableQuery<Query$ActionQueryPing> useWatchQuery$ActionQueryPing(
        [WatchOptions$Query$ActionQueryPing? options]) =>
    graphql_flutter
        .useWatchQuery(options ?? WatchOptions$Query$ActionQueryPing());

class Query$ActionQueryPing$Widget
    extends graphql_flutter.Query<Query$ActionQueryPing> {
  Query$ActionQueryPing$Widget({
    widgets.Key? key,
    Options$Query$ActionQueryPing? options,
    required graphql_flutter.QueryBuilder<Query$ActionQueryPing> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$ActionQueryPing(),
          builder: builder,
        );
}

class Query$ActionQueryPing$action_query_ping {
  Query$ActionQueryPing$action_query_ping({
    required this.response_name,
    required this.response_value,
    this.errors,
    this.data,
    this.$__typename = 'ActionQueryPingOutput',
  });

  factory Query$ActionQueryPing$action_query_ping.fromJson(
      Map<String, dynamic> json) {
    final l$response_name = json['response_name'];
    final l$response_value = json['response_value'];
    final l$errors = json['errors'];
    final l$data = json['data'];
    final l$$__typename = json['__typename'];
    return Query$ActionQueryPing$action_query_ping(
      response_name: (l$response_name as String),
      response_value: (l$response_value as int),
      errors: (l$errors as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Query$ActionQueryPing$action_query_ping$errors.fromJson(
                  (e as Map<String, dynamic>)))
          .toList(),
      data: l$data == null
          ? null
          : Query$ActionQueryPing$action_query_ping$data.fromJson(
              (l$data as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final String response_name;

  final int response_value;

  final List<Query$ActionQueryPing$action_query_ping$errors?>? errors;

  final Query$ActionQueryPing$action_query_ping$data? data;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$response_name = response_name;
    _resultData['response_name'] = l$response_name;
    final l$response_value = response_value;
    _resultData['response_value'] = l$response_value;
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e?.toJson()).toList();
    final l$data = data;
    _resultData['data'] = l$data?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$response_name = response_name;
    final l$response_value = response_value;
    final l$errors = errors;
    final l$data = data;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$response_name,
      l$response_value,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$data,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ActionQueryPing$action_query_ping) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$response_name = response_name;
    final lOther$response_name = other.response_name;
    if (l$response_name != lOther$response_name) {
      return false;
    }
    final l$response_value = response_value;
    final lOther$response_value = other.response_value;
    if (l$response_value != lOther$response_value) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
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

extension UtilityExtension$Query$ActionQueryPing$action_query_ping
    on Query$ActionQueryPing$action_query_ping {
  CopyWith$Query$ActionQueryPing$action_query_ping<
          Query$ActionQueryPing$action_query_ping>
      get copyWith => CopyWith$Query$ActionQueryPing$action_query_ping(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ActionQueryPing$action_query_ping<TRes> {
  factory CopyWith$Query$ActionQueryPing$action_query_ping(
    Query$ActionQueryPing$action_query_ping instance,
    TRes Function(Query$ActionQueryPing$action_query_ping) then,
  ) = _CopyWithImpl$Query$ActionQueryPing$action_query_ping;

  factory CopyWith$Query$ActionQueryPing$action_query_ping.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping;

  TRes call({
    String? response_name,
    int? response_value,
    List<Query$ActionQueryPing$action_query_ping$errors?>? errors,
    Query$ActionQueryPing$action_query_ping$data? data,
    String? $__typename,
  });
  TRes errors(
      Iterable<Query$ActionQueryPing$action_query_ping$errors?>? Function(
              Iterable<
                  CopyWith$Query$ActionQueryPing$action_query_ping$errors<
                      Query$ActionQueryPing$action_query_ping$errors>?>?)
          _fn);
  CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> get data;
}

class _CopyWithImpl$Query$ActionQueryPing$action_query_ping<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping<TRes> {
  _CopyWithImpl$Query$ActionQueryPing$action_query_ping(
    this._instance,
    this._then,
  );

  final Query$ActionQueryPing$action_query_ping _instance;

  final TRes Function(Query$ActionQueryPing$action_query_ping) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? response_name = _undefined,
    Object? response_value = _undefined,
    Object? errors = _undefined,
    Object? data = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionQueryPing$action_query_ping(
        response_name: response_name == _undefined || response_name == null
            ? _instance.response_name
            : (response_name as String),
        response_value: response_value == _undefined || response_value == null
            ? _instance.response_value
            : (response_value as int),
        errors: errors == _undefined
            ? _instance.errors
            : (errors
                as List<Query$ActionQueryPing$action_query_ping$errors?>?),
        data: data == _undefined
            ? _instance.data
            : (data as Query$ActionQueryPing$action_query_ping$data?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes errors(
          Iterable<Query$ActionQueryPing$action_query_ping$errors?>? Function(
                  Iterable<
                      CopyWith$Query$ActionQueryPing$action_query_ping$errors<
                          Query$ActionQueryPing$action_query_ping$errors>?>?)
              _fn) =>
      call(
          errors: _fn(_instance.errors?.map((e) => e == null
              ? null
              : CopyWith$Query$ActionQueryPing$action_query_ping$errors(
                  e,
                  (i) => i,
                )))?.toList());
  CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> get data {
    final local$data = _instance.data;
    return local$data == null
        ? CopyWith$Query$ActionQueryPing$action_query_ping$data.stub(
            _then(_instance))
        : CopyWith$Query$ActionQueryPing$action_query_ping$data(
            local$data, (e) => call(data: e));
  }
}

class _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping<TRes> {
  _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping(this._res);

  TRes _res;

  call({
    String? response_name,
    int? response_value,
    List<Query$ActionQueryPing$action_query_ping$errors?>? errors,
    Query$ActionQueryPing$action_query_ping$data? data,
    String? $__typename,
  }) =>
      _res;
  errors(_fn) => _res;
  CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> get data =>
      CopyWith$Query$ActionQueryPing$action_query_ping$data.stub(_res);
}

class Query$ActionQueryPing$action_query_ping$errors {
  Query$ActionQueryPing$action_query_ping$errors({
    this.message,
    this.$__typename = 'Error',
  });

  factory Query$ActionQueryPing$action_query_ping$errors.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Query$ActionQueryPing$action_query_ping$errors(
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$ActionQueryPing$action_query_ping$errors) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Query$ActionQueryPing$action_query_ping$errors
    on Query$ActionQueryPing$action_query_ping$errors {
  CopyWith$Query$ActionQueryPing$action_query_ping$errors<
          Query$ActionQueryPing$action_query_ping$errors>
      get copyWith => CopyWith$Query$ActionQueryPing$action_query_ping$errors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ActionQueryPing$action_query_ping$errors<TRes> {
  factory CopyWith$Query$ActionQueryPing$action_query_ping$errors(
    Query$ActionQueryPing$action_query_ping$errors instance,
    TRes Function(Query$ActionQueryPing$action_query_ping$errors) then,
  ) = _CopyWithImpl$Query$ActionQueryPing$action_query_ping$errors;

  factory CopyWith$Query$ActionQueryPing$action_query_ping$errors.stub(
          TRes res) =
      _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$errors;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ActionQueryPing$action_query_ping$errors<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping$errors<TRes> {
  _CopyWithImpl$Query$ActionQueryPing$action_query_ping$errors(
    this._instance,
    this._then,
  );

  final Query$ActionQueryPing$action_query_ping$errors _instance;

  final TRes Function(Query$ActionQueryPing$action_query_ping$errors) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionQueryPing$action_query_ping$errors(
        message:
            message == _undefined ? _instance.message : (message as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$errors<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping$errors<TRes> {
  _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$errors(this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}

class Query$ActionQueryPing$action_query_ping$data {
  Query$ActionQueryPing$action_query_ping$data({
    required this.message,
    required this.number,
    this.$__typename = 'ActionQueryPingOutputData',
  });

  factory Query$ActionQueryPing$action_query_ping$data.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Query$ActionQueryPing$action_query_ping$data(
      message: (l$message as String),
      number: (l$number as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String message;

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
    if (!(other is Query$ActionQueryPing$action_query_ping$data) ||
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

extension UtilityExtension$Query$ActionQueryPing$action_query_ping$data
    on Query$ActionQueryPing$action_query_ping$data {
  CopyWith$Query$ActionQueryPing$action_query_ping$data<
          Query$ActionQueryPing$action_query_ping$data>
      get copyWith => CopyWith$Query$ActionQueryPing$action_query_ping$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> {
  factory CopyWith$Query$ActionQueryPing$action_query_ping$data(
    Query$ActionQueryPing$action_query_ping$data instance,
    TRes Function(Query$ActionQueryPing$action_query_ping$data) then,
  ) = _CopyWithImpl$Query$ActionQueryPing$action_query_ping$data;

  factory CopyWith$Query$ActionQueryPing$action_query_ping$data.stub(TRes res) =
      _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$data;

  TRes call({
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$ActionQueryPing$action_query_ping$data<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> {
  _CopyWithImpl$Query$ActionQueryPing$action_query_ping$data(
    this._instance,
    this._then,
  );

  final Query$ActionQueryPing$action_query_ping$data _instance;

  final TRes Function(Query$ActionQueryPing$action_query_ping$data) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$ActionQueryPing$action_query_ping$data(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$data<TRes>
    implements CopyWith$Query$ActionQueryPing$action_query_ping$data<TRes> {
  _CopyWithStubImpl$Query$ActionQueryPing$action_query_ping$data(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$ActionMutationPong {
  factory Variables$Mutation$ActionMutationPong({
    required String message,
    required int number,
  }) =>
      Variables$Mutation$ActionMutationPong._({
        r'message': message,
        r'number': number,
      });

  Variables$Mutation$ActionMutationPong._(this._$data);

  factory Variables$Mutation$ActionMutationPong.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    final l$number = data['number'];
    result$data['number'] = (l$number as int);
    return Variables$Mutation$ActionMutationPong._(result$data);
  }

  Map<String, dynamic> _$data;

  String get message => (_$data['message'] as String);
  int get number => (_$data['number'] as int);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$message = message;
    result$data['message'] = l$message;
    final l$number = number;
    result$data['number'] = l$number;
    return result$data;
  }

  CopyWith$Variables$Mutation$ActionMutationPong<
          Variables$Mutation$ActionMutationPong>
      get copyWith => CopyWith$Variables$Mutation$ActionMutationPong(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$ActionMutationPong) ||
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

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    return Object.hashAll([
      l$message,
      l$number,
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$ActionMutationPong<TRes> {
  factory CopyWith$Variables$Mutation$ActionMutationPong(
    Variables$Mutation$ActionMutationPong instance,
    TRes Function(Variables$Mutation$ActionMutationPong) then,
  ) = _CopyWithImpl$Variables$Mutation$ActionMutationPong;

  factory CopyWith$Variables$Mutation$ActionMutationPong.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$ActionMutationPong;

  TRes call({
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Variables$Mutation$ActionMutationPong<TRes>
    implements CopyWith$Variables$Mutation$ActionMutationPong<TRes> {
  _CopyWithImpl$Variables$Mutation$ActionMutationPong(
    this._instance,
    this._then,
  );

  final Variables$Mutation$ActionMutationPong _instance;

  final TRes Function(Variables$Mutation$ActionMutationPong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Variables$Mutation$ActionMutationPong._({
        ..._instance._$data,
        if (message != _undefined && message != null)
          'message': (message as String),
        if (number != _undefined && number != null) 'number': (number as int),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$ActionMutationPong<TRes>
    implements CopyWith$Variables$Mutation$ActionMutationPong<TRes> {
  _CopyWithStubImpl$Variables$Mutation$ActionMutationPong(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
  }) =>
      _res;
}

class Mutation$ActionMutationPong {
  Mutation$ActionMutationPong({
    this.action_mutation_pong,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$ActionMutationPong.fromJson(Map<String, dynamic> json) {
    final l$action_mutation_pong = json['action_mutation_pong'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionMutationPong(
      action_mutation_pong: l$action_mutation_pong == null
          ? null
          : Mutation$ActionMutationPong$action_mutation_pong.fromJson(
              (l$action_mutation_pong as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$ActionMutationPong$action_mutation_pong? action_mutation_pong;

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
    if (!(other is Mutation$ActionMutationPong) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Mutation$ActionMutationPong
    on Mutation$ActionMutationPong {
  CopyWith$Mutation$ActionMutationPong<Mutation$ActionMutationPong>
      get copyWith => CopyWith$Mutation$ActionMutationPong(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionMutationPong<TRes> {
  factory CopyWith$Mutation$ActionMutationPong(
    Mutation$ActionMutationPong instance,
    TRes Function(Mutation$ActionMutationPong) then,
  ) = _CopyWithImpl$Mutation$ActionMutationPong;

  factory CopyWith$Mutation$ActionMutationPong.stub(TRes res) =
      _CopyWithStubImpl$Mutation$ActionMutationPong;

  TRes call({
    Mutation$ActionMutationPong$action_mutation_pong? action_mutation_pong,
    String? $__typename,
  });
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes>
      get action_mutation_pong;
}

class _CopyWithImpl$Mutation$ActionMutationPong<TRes>
    implements CopyWith$Mutation$ActionMutationPong<TRes> {
  _CopyWithImpl$Mutation$ActionMutationPong(
    this._instance,
    this._then,
  );

  final Mutation$ActionMutationPong _instance;

  final TRes Function(Mutation$ActionMutationPong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? action_mutation_pong = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionMutationPong(
        action_mutation_pong: action_mutation_pong == _undefined
            ? _instance.action_mutation_pong
            : (action_mutation_pong
                as Mutation$ActionMutationPong$action_mutation_pong?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes>
      get action_mutation_pong {
    final local$action_mutation_pong = _instance.action_mutation_pong;
    return local$action_mutation_pong == null
        ? CopyWith$Mutation$ActionMutationPong$action_mutation_pong.stub(
            _then(_instance))
        : CopyWith$Mutation$ActionMutationPong$action_mutation_pong(
            local$action_mutation_pong, (e) => call(action_mutation_pong: e));
  }
}

class _CopyWithStubImpl$Mutation$ActionMutationPong<TRes>
    implements CopyWith$Mutation$ActionMutationPong<TRes> {
  _CopyWithStubImpl$Mutation$ActionMutationPong(this._res);

  TRes _res;

  call({
    Mutation$ActionMutationPong$action_mutation_pong? action_mutation_pong,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes>
      get action_mutation_pong =>
          CopyWith$Mutation$ActionMutationPong$action_mutation_pong.stub(_res);
}

const documentNodeMutationActionMutationPong = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'ActionMutationPong'),
    variableDefinitions: [
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
            name: NameNode(value: 'response_name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'response_value'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
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
            name: NameNode(value: 'errors'),
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
Mutation$ActionMutationPong _parserFn$Mutation$ActionMutationPong(
        Map<String, dynamic> data) =>
    Mutation$ActionMutationPong.fromJson(data);
typedef OnMutationCompleted$Mutation$ActionMutationPong = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$ActionMutationPong?,
);

class Options$Mutation$ActionMutationPong
    extends graphql.MutationOptions<Mutation$ActionMutationPong> {
  Options$Mutation$ActionMutationPong({
    String? operationName,
    required Variables$Mutation$ActionMutationPong variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionMutationPong? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ActionMutationPong? onCompleted,
    graphql.OnMutationUpdate<Mutation$ActionMutationPong>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ActionMutationPong(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationActionMutationPong,
          parserFn: _parserFn$Mutation$ActionMutationPong,
        );

  final OnMutationCompleted$Mutation$ActionMutationPong? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$ActionMutationPong
    extends graphql.WatchQueryOptions<Mutation$ActionMutationPong> {
  WatchOptions$Mutation$ActionMutationPong({
    String? operationName,
    required Variables$Mutation$ActionMutationPong variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionMutationPong? typedOptimisticResult,
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
          document: documentNodeMutationActionMutationPong,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$ActionMutationPong,
        );
}

extension ClientExtension$Mutation$ActionMutationPong on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$ActionMutationPong>>
      mutate$ActionMutationPong(
              Options$Mutation$ActionMutationPong options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$ActionMutationPong>
      watchMutation$ActionMutationPong(
              WatchOptions$Mutation$ActionMutationPong options) =>
          this.watchMutation(options);
}

class Mutation$ActionMutationPong$HookResult {
  Mutation$ActionMutationPong$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$ActionMutationPong runMutation;

  final graphql.QueryResult<Mutation$ActionMutationPong> result;
}

Mutation$ActionMutationPong$HookResult useMutation$ActionMutationPong(
    [WidgetOptions$Mutation$ActionMutationPong? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$ActionMutationPong());
  return Mutation$ActionMutationPong$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$ActionMutationPong>
    useWatchMutation$ActionMutationPong(
            WatchOptions$Mutation$ActionMutationPong options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$ActionMutationPong
    extends graphql.MutationOptions<Mutation$ActionMutationPong> {
  WidgetOptions$Mutation$ActionMutationPong({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$ActionMutationPong? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$ActionMutationPong? onCompleted,
    graphql.OnMutationUpdate<Mutation$ActionMutationPong>? update,
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
                    data == null
                        ? null
                        : _parserFn$Mutation$ActionMutationPong(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationActionMutationPong,
          parserFn: _parserFn$Mutation$ActionMutationPong,
        );

  final OnMutationCompleted$Mutation$ActionMutationPong? onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$ActionMutationPong
    = graphql.MultiSourceResult<Mutation$ActionMutationPong> Function(
  Variables$Mutation$ActionMutationPong, {
  Object? optimisticResult,
  Mutation$ActionMutationPong? typedOptimisticResult,
});
typedef Builder$Mutation$ActionMutationPong = widgets.Widget Function(
  RunMutation$Mutation$ActionMutationPong,
  graphql.QueryResult<Mutation$ActionMutationPong>?,
);

class Mutation$ActionMutationPong$Widget
    extends graphql_flutter.Mutation<Mutation$ActionMutationPong> {
  Mutation$ActionMutationPong$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$ActionMutationPong? options,
    required Builder$Mutation$ActionMutationPong builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$ActionMutationPong(),
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

class Mutation$ActionMutationPong$action_mutation_pong {
  Mutation$ActionMutationPong$action_mutation_pong({
    required this.response_name,
    required this.response_value,
    this.data,
    this.errors,
    this.$__typename = 'ActionMutationPongOutput',
  });

  factory Mutation$ActionMutationPong$action_mutation_pong.fromJson(
      Map<String, dynamic> json) {
    final l$response_name = json['response_name'];
    final l$response_value = json['response_value'];
    final l$data = json['data'];
    final l$errors = json['errors'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionMutationPong$action_mutation_pong(
      response_name: (l$response_name as String),
      response_value: (l$response_value as int),
      data: l$data == null
          ? null
          : Mutation$ActionMutationPong$action_mutation_pong$data.fromJson(
              (l$data as Map<String, dynamic>)),
      errors: (l$errors as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : Mutation$ActionMutationPong$action_mutation_pong$errors
                  .fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final String response_name;

  final int response_value;

  final Mutation$ActionMutationPong$action_mutation_pong$data? data;

  final List<Mutation$ActionMutationPong$action_mutation_pong$errors?>? errors;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$response_name = response_name;
    _resultData['response_name'] = l$response_name;
    final l$response_value = response_value;
    _resultData['response_value'] = l$response_value;
    final l$data = data;
    _resultData['data'] = l$data?.toJson();
    final l$errors = errors;
    _resultData['errors'] = l$errors?.map((e) => e?.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$response_name = response_name;
    final l$response_value = response_value;
    final l$data = data;
    final l$errors = errors;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$response_name,
      l$response_value,
      l$data,
      l$errors == null ? null : Object.hashAll(l$errors.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ActionMutationPong$action_mutation_pong) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$response_name = response_name;
    final lOther$response_name = other.response_name;
    if (l$response_name != lOther$response_name) {
      return false;
    }
    final l$response_value = response_value;
    final lOther$response_value = other.response_value;
    if (l$response_value != lOther$response_value) {
      return false;
    }
    final l$data = data;
    final lOther$data = other.data;
    if (l$data != lOther$data) {
      return false;
    }
    final l$errors = errors;
    final lOther$errors = other.errors;
    if (l$errors != null && lOther$errors != null) {
      if (l$errors.length != lOther$errors.length) {
        return false;
      }
      for (int i = 0; i < l$errors.length; i++) {
        final l$errors$entry = l$errors[i];
        final lOther$errors$entry = lOther$errors[i];
        if (l$errors$entry != lOther$errors$entry) {
          return false;
        }
      }
    } else if (l$errors != lOther$errors) {
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

extension UtilityExtension$Mutation$ActionMutationPong$action_mutation_pong
    on Mutation$ActionMutationPong$action_mutation_pong {
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong<
          Mutation$ActionMutationPong$action_mutation_pong>
      get copyWith => CopyWith$Mutation$ActionMutationPong$action_mutation_pong(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes> {
  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong(
    Mutation$ActionMutationPong$action_mutation_pong instance,
    TRes Function(Mutation$ActionMutationPong$action_mutation_pong) then,
  ) = _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong;

  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong;

  TRes call({
    String? response_name,
    int? response_value,
    Mutation$ActionMutationPong$action_mutation_pong$data? data,
    List<Mutation$ActionMutationPong$action_mutation_pong$errors?>? errors,
    String? $__typename,
  });
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<TRes> get data;
  TRes errors(
      Iterable<Mutation$ActionMutationPong$action_mutation_pong$errors?>? Function(
              Iterable<
                  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<
                      Mutation$ActionMutationPong$action_mutation_pong$errors>?>?)
          _fn);
}

class _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong<TRes>
    implements CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes> {
  _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong(
    this._instance,
    this._then,
  );

  final Mutation$ActionMutationPong$action_mutation_pong _instance;

  final TRes Function(Mutation$ActionMutationPong$action_mutation_pong) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? response_name = _undefined,
    Object? response_value = _undefined,
    Object? data = _undefined,
    Object? errors = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionMutationPong$action_mutation_pong(
        response_name: response_name == _undefined || response_name == null
            ? _instance.response_name
            : (response_name as String),
        response_value: response_value == _undefined || response_value == null
            ? _instance.response_value
            : (response_value as int),
        data: data == _undefined
            ? _instance.data
            : (data as Mutation$ActionMutationPong$action_mutation_pong$data?),
        errors: errors == _undefined
            ? _instance.errors
            : (errors as List<
                Mutation$ActionMutationPong$action_mutation_pong$errors?>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<TRes>
      get data {
    final local$data = _instance.data;
    return local$data == null
        ? CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data.stub(
            _then(_instance))
        : CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data(
            local$data, (e) => call(data: e));
  }

  TRes errors(
          Iterable<Mutation$ActionMutationPong$action_mutation_pong$errors?>? Function(
                  Iterable<
                      CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<
                          Mutation$ActionMutationPong$action_mutation_pong$errors>?>?)
              _fn) =>
      call(
          errors: _fn(_instance.errors?.map((e) => e == null
              ? null
              : CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors(
                  e,
                  (i) => i,
                )))?.toList());
}

class _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong<TRes>
    implements CopyWith$Mutation$ActionMutationPong$action_mutation_pong<TRes> {
  _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong(this._res);

  TRes _res;

  call({
    String? response_name,
    int? response_value,
    Mutation$ActionMutationPong$action_mutation_pong$data? data,
    List<Mutation$ActionMutationPong$action_mutation_pong$errors?>? errors,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<TRes>
      get data =>
          CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data.stub(
              _res);
  errors(_fn) => _res;
}

class Mutation$ActionMutationPong$action_mutation_pong$data {
  Mutation$ActionMutationPong$action_mutation_pong$data({
    required this.message,
    required this.number,
    this.$__typename = 'ActionMutationPongOutputData',
  });

  factory Mutation$ActionMutationPong$action_mutation_pong$data.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionMutationPong$action_mutation_pong$data(
      message: (l$message as String),
      number: (l$number as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String message;

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
    if (!(other is Mutation$ActionMutationPong$action_mutation_pong$data) ||
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

extension UtilityExtension$Mutation$ActionMutationPong$action_mutation_pong$data
    on Mutation$ActionMutationPong$action_mutation_pong$data {
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<
          Mutation$ActionMutationPong$action_mutation_pong$data>
      get copyWith =>
          CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<
    TRes> {
  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data(
    Mutation$ActionMutationPong$action_mutation_pong$data instance,
    TRes Function(Mutation$ActionMutationPong$action_mutation_pong$data) then,
  ) = _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$data;

  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$data;

  TRes call({
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$data<TRes>
    implements
        CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<TRes> {
  _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$data(
    this._instance,
    this._then,
  );

  final Mutation$ActionMutationPong$action_mutation_pong$data _instance;

  final TRes Function(Mutation$ActionMutationPong$action_mutation_pong$data)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionMutationPong$action_mutation_pong$data(
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$data<
        TRes>
    implements
        CopyWith$Mutation$ActionMutationPong$action_mutation_pong$data<TRes> {
  _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$data(
      this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}

class Mutation$ActionMutationPong$action_mutation_pong$errors {
  Mutation$ActionMutationPong$action_mutation_pong$errors({
    this.message,
    this.$__typename = 'Error',
  });

  factory Mutation$ActionMutationPong$action_mutation_pong$errors.fromJson(
      Map<String, dynamic> json) {
    final l$message = json['message'];
    final l$$__typename = json['__typename'];
    return Mutation$ActionMutationPong$action_mutation_pong$errors(
      message: (l$message as String?),
      $__typename: (l$$__typename as String),
    );
  }

  final String? message;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$message = message;
    _resultData['message'] = l$message;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$message,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$ActionMutationPong$action_mutation_pong$errors) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$message = message;
    final lOther$message = other.message;
    if (l$message != lOther$message) {
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

extension UtilityExtension$Mutation$ActionMutationPong$action_mutation_pong$errors
    on Mutation$ActionMutationPong$action_mutation_pong$errors {
  CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<
          Mutation$ActionMutationPong$action_mutation_pong$errors>
      get copyWith =>
          CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<
    TRes> {
  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors(
    Mutation$ActionMutationPong$action_mutation_pong$errors instance,
    TRes Function(Mutation$ActionMutationPong$action_mutation_pong$errors) then,
  ) = _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$errors;

  factory CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$errors;

  TRes call({
    String? message,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$errors<
        TRes>
    implements
        CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<TRes> {
  _CopyWithImpl$Mutation$ActionMutationPong$action_mutation_pong$errors(
    this._instance,
    this._then,
  );

  final Mutation$ActionMutationPong$action_mutation_pong$errors _instance;

  final TRes Function(Mutation$ActionMutationPong$action_mutation_pong$errors)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$ActionMutationPong$action_mutation_pong$errors(
        message:
            message == _undefined ? _instance.message : (message as String?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$errors<
        TRes>
    implements
        CopyWith$Mutation$ActionMutationPong$action_mutation_pong$errors<TRes> {
  _CopyWithStubImpl$Mutation$ActionMutationPong$action_mutation_pong$errors(
      this._res);

  TRes _res;

  call({
    String? message,
    String? $__typename,
  }) =>
      _res;
}
