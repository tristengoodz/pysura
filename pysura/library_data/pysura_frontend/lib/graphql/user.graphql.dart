import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Variables$Query$GetPublicUserById {
  factory Variables$Query$GetPublicUserById({required String id}) =>
      Variables$Query$GetPublicUserById._({
        r'id': id,
      });

  Variables$Query$GetPublicUserById._(this._$data);

  factory Variables$Query$GetPublicUserById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Query$GetPublicUserById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Query$GetPublicUserById<Variables$Query$GetPublicUserById>
      get copyWith => CopyWith$Variables$Query$GetPublicUserById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$GetPublicUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Query$GetPublicUserById<TRes> {
  factory CopyWith$Variables$Query$GetPublicUserById(
    Variables$Query$GetPublicUserById instance,
    TRes Function(Variables$Query$GetPublicUserById) then,
  ) = _CopyWithImpl$Variables$Query$GetPublicUserById;

  factory CopyWith$Variables$Query$GetPublicUserById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$GetPublicUserById;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Query$GetPublicUserById<TRes>
    implements CopyWith$Variables$Query$GetPublicUserById<TRes> {
  _CopyWithImpl$Variables$Query$GetPublicUserById(
    this._instance,
    this._then,
  );

  final Variables$Query$GetPublicUserById _instance;

  final TRes Function(Variables$Query$GetPublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Query$GetPublicUserById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Query$GetPublicUserById<TRes>
    implements CopyWith$Variables$Query$GetPublicUserById<TRes> {
  _CopyWithStubImpl$Variables$Query$GetPublicUserById(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Query$GetPublicUserById {
  Query$GetPublicUserById({
    this.public_user_by_pk,
    this.$__typename = 'query_root',
  });

  factory Query$GetPublicUserById.fromJson(Map<String, dynamic> json) {
    final l$public_user_by_pk = json['public_user_by_pk'];
    final l$$__typename = json['__typename'];
    return Query$GetPublicUserById(
      public_user_by_pk: l$public_user_by_pk == null
          ? null
          : Query$GetPublicUserById$public_user_by_pk.fromJson(
              (l$public_user_by_pk as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$GetPublicUserById$public_user_by_pk? public_user_by_pk;

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
    if (!(other is Query$GetPublicUserById) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$GetPublicUserById on Query$GetPublicUserById {
  CopyWith$Query$GetPublicUserById<Query$GetPublicUserById> get copyWith =>
      CopyWith$Query$GetPublicUserById(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$GetPublicUserById<TRes> {
  factory CopyWith$Query$GetPublicUserById(
    Query$GetPublicUserById instance,
    TRes Function(Query$GetPublicUserById) then,
  ) = _CopyWithImpl$Query$GetPublicUserById;

  factory CopyWith$Query$GetPublicUserById.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPublicUserById;

  TRes call({
    Query$GetPublicUserById$public_user_by_pk? public_user_by_pk,
    String? $__typename,
  });
  CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk;
}

class _CopyWithImpl$Query$GetPublicUserById<TRes>
    implements CopyWith$Query$GetPublicUserById<TRes> {
  _CopyWithImpl$Query$GetPublicUserById(
    this._instance,
    this._then,
  );

  final Query$GetPublicUserById _instance;

  final TRes Function(Query$GetPublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? public_user_by_pk = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPublicUserById(
        public_user_by_pk: public_user_by_pk == _undefined
            ? _instance.public_user_by_pk
            : (public_user_by_pk as Query$GetPublicUserById$public_user_by_pk?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk {
    final local$public_user_by_pk = _instance.public_user_by_pk;
    return local$public_user_by_pk == null
        ? CopyWith$Query$GetPublicUserById$public_user_by_pk.stub(
            _then(_instance))
        : CopyWith$Query$GetPublicUserById$public_user_by_pk(
            local$public_user_by_pk, (e) => call(public_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Query$GetPublicUserById<TRes>
    implements CopyWith$Query$GetPublicUserById<TRes> {
  _CopyWithStubImpl$Query$GetPublicUserById(this._res);

  TRes _res;

  call({
    Query$GetPublicUserById$public_user_by_pk? public_user_by_pk,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk =>
          CopyWith$Query$GetPublicUserById$public_user_by_pk.stub(_res);
}

const documentNodeQueryGetPublicUserById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'GetPublicUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
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
Query$GetPublicUserById _parserFn$Query$GetPublicUserById(
        Map<String, dynamic> data) =>
    Query$GetPublicUserById.fromJson(data);
typedef OnQueryComplete$Query$GetPublicUserById = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$GetPublicUserById?,
);

class Options$Query$GetPublicUserById
    extends graphql.QueryOptions<Query$GetPublicUserById> {
  Options$Query$GetPublicUserById({
    String? operationName,
    required Variables$Query$GetPublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPublicUserById? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$GetPublicUserById? onComplete,
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
                    data == null
                        ? null
                        : _parserFn$Query$GetPublicUserById(data),
                  ),
          onError: onError,
          document: documentNodeQueryGetPublicUserById,
          parserFn: _parserFn$Query$GetPublicUserById,
        );

  final OnQueryComplete$Query$GetPublicUserById? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$GetPublicUserById
    extends graphql.WatchQueryOptions<Query$GetPublicUserById> {
  WatchOptions$Query$GetPublicUserById({
    String? operationName,
    required Variables$Query$GetPublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$GetPublicUserById? typedOptimisticResult,
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
          document: documentNodeQueryGetPublicUserById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$GetPublicUserById,
        );
}

class FetchMoreOptions$Query$GetPublicUserById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$GetPublicUserById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$GetPublicUserById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQueryGetPublicUserById,
        );
}

extension ClientExtension$Query$GetPublicUserById on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$GetPublicUserById>> query$GetPublicUserById(
          Options$Query$GetPublicUserById options) async =>
      await this.query(options);
  graphql.ObservableQuery<Query$GetPublicUserById> watchQuery$GetPublicUserById(
          WatchOptions$Query$GetPublicUserById options) =>
      this.watchQuery(options);
  void writeQuery$GetPublicUserById({
    required Query$GetPublicUserById data,
    required Variables$Query$GetPublicUserById variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryGetPublicUserById),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$GetPublicUserById? readQuery$GetPublicUserById({
    required Variables$Query$GetPublicUserById variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation:
            graphql.Operation(document: documentNodeQueryGetPublicUserById),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$GetPublicUserById.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$GetPublicUserById>
    useQuery$GetPublicUserById(Options$Query$GetPublicUserById options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$GetPublicUserById>
    useWatchQuery$GetPublicUserById(
            WatchOptions$Query$GetPublicUserById options) =>
        graphql_flutter.useWatchQuery(options);

class Query$GetPublicUserById$Widget
    extends graphql_flutter.Query<Query$GetPublicUserById> {
  Query$GetPublicUserById$Widget({
    widgets.Key? key,
    required Options$Query$GetPublicUserById options,
    required graphql_flutter.QueryBuilder<Query$GetPublicUserById> builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$GetPublicUserById$public_user_by_pk {
  Query$GetPublicUserById$public_user_by_pk({
    required this.user_id,
    required this.message,
    required this.number,
    this.$__typename = 'public_user',
  });

  factory Query$GetPublicUserById$public_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Query$GetPublicUserById$public_user_by_pk(
      user_id: (l$user_id as String),
      message: (l$message as String),
      number: (l$number as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String user_id;

  final String message;

  final int number;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
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
    final l$user_id = user_id;
    final l$message = message;
    final l$number = number;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
    if (!(other is Query$GetPublicUserById$public_user_by_pk) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$GetPublicUserById$public_user_by_pk
    on Query$GetPublicUserById$public_user_by_pk {
  CopyWith$Query$GetPublicUserById$public_user_by_pk<
          Query$GetPublicUserById$public_user_by_pk>
      get copyWith => CopyWith$Query$GetPublicUserById$public_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes> {
  factory CopyWith$Query$GetPublicUserById$public_user_by_pk(
    Query$GetPublicUserById$public_user_by_pk instance,
    TRes Function(Query$GetPublicUserById$public_user_by_pk) then,
  ) = _CopyWithImpl$Query$GetPublicUserById$public_user_by_pk;

  factory CopyWith$Query$GetPublicUserById$public_user_by_pk.stub(TRes res) =
      _CopyWithStubImpl$Query$GetPublicUserById$public_user_by_pk;

  TRes call({
    String? user_id,
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$GetPublicUserById$public_user_by_pk<TRes>
    implements CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes> {
  _CopyWithImpl$Query$GetPublicUserById$public_user_by_pk(
    this._instance,
    this._then,
  );

  final Query$GetPublicUserById$public_user_by_pk _instance;

  final TRes Function(Query$GetPublicUserById$public_user_by_pk) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$GetPublicUserById$public_user_by_pk(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as String),
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

class _CopyWithStubImpl$Query$GetPublicUserById$public_user_by_pk<TRes>
    implements CopyWith$Query$GetPublicUserById$public_user_by_pk<TRes> {
  _CopyWithStubImpl$Query$GetPublicUserById$public_user_by_pk(this._res);

  TRes _res;

  call({
    String? user_id,
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Mutation$UpdatePublicUserById {
  factory Variables$Mutation$UpdatePublicUserById({
    required String id,
    String? message,
    int? number,
  }) =>
      Variables$Mutation$UpdatePublicUserById._({
        r'id': id,
        if (message != null) r'message': message,
        if (number != null) r'number': number,
      });

  Variables$Mutation$UpdatePublicUserById._(this._$data);

  factory Variables$Mutation$UpdatePublicUserById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    return Variables$Mutation$UpdatePublicUserById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  String? get message => (_$data['message'] as String?);
  int? get number => (_$data['number'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
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

  CopyWith$Variables$Mutation$UpdatePublicUserById<
          Variables$Mutation$UpdatePublicUserById>
      get copyWith => CopyWith$Variables$Mutation$UpdatePublicUserById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Mutation$UpdatePublicUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
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
    final l$id = id;
    final l$message = message;
    final l$number = number;
    return Object.hashAll([
      l$id,
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Mutation$UpdatePublicUserById<TRes> {
  factory CopyWith$Variables$Mutation$UpdatePublicUserById(
    Variables$Mutation$UpdatePublicUserById instance,
    TRes Function(Variables$Mutation$UpdatePublicUserById) then,
  ) = _CopyWithImpl$Variables$Mutation$UpdatePublicUserById;

  factory CopyWith$Variables$Mutation$UpdatePublicUserById.stub(TRes res) =
      _CopyWithStubImpl$Variables$Mutation$UpdatePublicUserById;

  TRes call({
    String? id,
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Variables$Mutation$UpdatePublicUserById<TRes>
    implements CopyWith$Variables$Mutation$UpdatePublicUserById<TRes> {
  _CopyWithImpl$Variables$Mutation$UpdatePublicUserById(
    this._instance,
    this._then,
  );

  final Variables$Mutation$UpdatePublicUserById _instance;

  final TRes Function(Variables$Mutation$UpdatePublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Variables$Mutation$UpdatePublicUserById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
      }));
}

class _CopyWithStubImpl$Variables$Mutation$UpdatePublicUserById<TRes>
    implements CopyWith$Variables$Mutation$UpdatePublicUserById<TRes> {
  _CopyWithStubImpl$Variables$Mutation$UpdatePublicUserById(this._res);

  TRes _res;

  call({
    String? id,
    String? message,
    int? number,
  }) =>
      _res;
}

class Mutation$UpdatePublicUserById {
  Mutation$UpdatePublicUserById({
    this.insert_public_user_one,
    this.$__typename = 'mutation_root',
  });

  factory Mutation$UpdatePublicUserById.fromJson(Map<String, dynamic> json) {
    final l$insert_public_user_one = json['insert_public_user_one'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdatePublicUserById(
      insert_public_user_one: l$insert_public_user_one == null
          ? null
          : Mutation$UpdatePublicUserById$insert_public_user_one.fromJson(
              (l$insert_public_user_one as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Mutation$UpdatePublicUserById$insert_public_user_one?
      insert_public_user_one;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$insert_public_user_one = insert_public_user_one;
    _resultData['insert_public_user_one'] = l$insert_public_user_one?.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$insert_public_user_one = insert_public_user_one;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$insert_public_user_one,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Mutation$UpdatePublicUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$insert_public_user_one = insert_public_user_one;
    final lOther$insert_public_user_one = other.insert_public_user_one;
    if (l$insert_public_user_one != lOther$insert_public_user_one) {
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

extension UtilityExtension$Mutation$UpdatePublicUserById
    on Mutation$UpdatePublicUserById {
  CopyWith$Mutation$UpdatePublicUserById<Mutation$UpdatePublicUserById>
      get copyWith => CopyWith$Mutation$UpdatePublicUserById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdatePublicUserById<TRes> {
  factory CopyWith$Mutation$UpdatePublicUserById(
    Mutation$UpdatePublicUserById instance,
    TRes Function(Mutation$UpdatePublicUserById) then,
  ) = _CopyWithImpl$Mutation$UpdatePublicUserById;

  factory CopyWith$Mutation$UpdatePublicUserById.stub(TRes res) =
      _CopyWithStubImpl$Mutation$UpdatePublicUserById;

  TRes call({
    Mutation$UpdatePublicUserById$insert_public_user_one?
        insert_public_user_one,
    String? $__typename,
  });
  CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<TRes>
      get insert_public_user_one;
}

class _CopyWithImpl$Mutation$UpdatePublicUserById<TRes>
    implements CopyWith$Mutation$UpdatePublicUserById<TRes> {
  _CopyWithImpl$Mutation$UpdatePublicUserById(
    this._instance,
    this._then,
  );

  final Mutation$UpdatePublicUserById _instance;

  final TRes Function(Mutation$UpdatePublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? insert_public_user_one = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdatePublicUserById(
        insert_public_user_one: insert_public_user_one == _undefined
            ? _instance.insert_public_user_one
            : (insert_public_user_one
                as Mutation$UpdatePublicUserById$insert_public_user_one?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<TRes>
      get insert_public_user_one {
    final local$insert_public_user_one = _instance.insert_public_user_one;
    return local$insert_public_user_one == null
        ? CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one.stub(
            _then(_instance))
        : CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one(
            local$insert_public_user_one,
            (e) => call(insert_public_user_one: e));
  }
}

class _CopyWithStubImpl$Mutation$UpdatePublicUserById<TRes>
    implements CopyWith$Mutation$UpdatePublicUserById<TRes> {
  _CopyWithStubImpl$Mutation$UpdatePublicUserById(this._res);

  TRes _res;

  call({
    Mutation$UpdatePublicUserById$insert_public_user_one?
        insert_public_user_one,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<TRes>
      get insert_public_user_one =>
          CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one.stub(
              _res);
}

const documentNodeMutationUpdatePublicUserById = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'UpdatePublicUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
        name: NameNode(value: 'insert_public_user_one'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'object'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'user_id'),
                value: VariableNode(name: NameNode(value: 'id')),
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
          ),
          ArgumentNode(
            name: NameNode(value: 'on_conflict'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'constraint'),
                value: EnumValueNode(name: NameNode(value: 'public_user_pkey')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'update_columns'),
                value: ListValueNode(values: [
                  EnumValueNode(name: NameNode(value: 'message')),
                  EnumValueNode(name: NameNode(value: 'number')),
                ]),
              ),
            ]),
          ),
        ],
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
Mutation$UpdatePublicUserById _parserFn$Mutation$UpdatePublicUserById(
        Map<String, dynamic> data) =>
    Mutation$UpdatePublicUserById.fromJson(data);
typedef OnMutationCompleted$Mutation$UpdatePublicUserById = FutureOr<void>
    Function(
  Map<String, dynamic>?,
  Mutation$UpdatePublicUserById?,
);

class Options$Mutation$UpdatePublicUserById
    extends graphql.MutationOptions<Mutation$UpdatePublicUserById> {
  Options$Mutation$UpdatePublicUserById({
    String? operationName,
    required Variables$Mutation$UpdatePublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePublicUserById? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdatePublicUserById? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdatePublicUserById>? update,
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
                        : _parserFn$Mutation$UpdatePublicUserById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdatePublicUserById,
          parserFn: _parserFn$Mutation$UpdatePublicUserById,
        );

  final OnMutationCompleted$Mutation$UpdatePublicUserById?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

class WatchOptions$Mutation$UpdatePublicUserById
    extends graphql.WatchQueryOptions<Mutation$UpdatePublicUserById> {
  WatchOptions$Mutation$UpdatePublicUserById({
    String? operationName,
    required Variables$Mutation$UpdatePublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePublicUserById? typedOptimisticResult,
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
          document: documentNodeMutationUpdatePublicUserById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Mutation$UpdatePublicUserById,
        );
}

extension ClientExtension$Mutation$UpdatePublicUserById
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Mutation$UpdatePublicUserById>>
      mutate$UpdatePublicUserById(
              Options$Mutation$UpdatePublicUserById options) async =>
          await this.mutate(options);
  graphql.ObservableQuery<Mutation$UpdatePublicUserById>
      watchMutation$UpdatePublicUserById(
              WatchOptions$Mutation$UpdatePublicUserById options) =>
          this.watchMutation(options);
}

class Mutation$UpdatePublicUserById$HookResult {
  Mutation$UpdatePublicUserById$HookResult(
    this.runMutation,
    this.result,
  );

  final RunMutation$Mutation$UpdatePublicUserById runMutation;

  final graphql.QueryResult<Mutation$UpdatePublicUserById> result;
}

Mutation$UpdatePublicUserById$HookResult useMutation$UpdatePublicUserById(
    [WidgetOptions$Mutation$UpdatePublicUserById? options]) {
  final result = graphql_flutter
      .useMutation(options ?? WidgetOptions$Mutation$UpdatePublicUserById());
  return Mutation$UpdatePublicUserById$HookResult(
    (variables, {optimisticResult, typedOptimisticResult}) =>
        result.runMutation(
      variables.toJson(),
      optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
    ),
    result.result,
  );
}

graphql.ObservableQuery<Mutation$UpdatePublicUserById>
    useWatchMutation$UpdatePublicUserById(
            WatchOptions$Mutation$UpdatePublicUserById options) =>
        graphql_flutter.useWatchMutation(options);

class WidgetOptions$Mutation$UpdatePublicUserById
    extends graphql.MutationOptions<Mutation$UpdatePublicUserById> {
  WidgetOptions$Mutation$UpdatePublicUserById({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Mutation$UpdatePublicUserById? typedOptimisticResult,
    graphql.Context? context,
    OnMutationCompleted$Mutation$UpdatePublicUserById? onCompleted,
    graphql.OnMutationUpdate<Mutation$UpdatePublicUserById>? update,
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
                        : _parserFn$Mutation$UpdatePublicUserById(data),
                  ),
          update: update,
          onError: onError,
          document: documentNodeMutationUpdatePublicUserById,
          parserFn: _parserFn$Mutation$UpdatePublicUserById,
        );

  final OnMutationCompleted$Mutation$UpdatePublicUserById?
      onCompletedWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onCompleted == null
            ? super.properties
            : super.properties.where((property) => property != onCompleted),
        onCompletedWithParsed,
      ];
}

typedef RunMutation$Mutation$UpdatePublicUserById
    = graphql.MultiSourceResult<Mutation$UpdatePublicUserById> Function(
  Variables$Mutation$UpdatePublicUserById, {
  Object? optimisticResult,
  Mutation$UpdatePublicUserById? typedOptimisticResult,
});
typedef Builder$Mutation$UpdatePublicUserById = widgets.Widget Function(
  RunMutation$Mutation$UpdatePublicUserById,
  graphql.QueryResult<Mutation$UpdatePublicUserById>?,
);

class Mutation$UpdatePublicUserById$Widget
    extends graphql_flutter.Mutation<Mutation$UpdatePublicUserById> {
  Mutation$UpdatePublicUserById$Widget({
    widgets.Key? key,
    WidgetOptions$Mutation$UpdatePublicUserById? options,
    required Builder$Mutation$UpdatePublicUserById builder,
  }) : super(
          key: key,
          options: options ?? WidgetOptions$Mutation$UpdatePublicUserById(),
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

class Mutation$UpdatePublicUserById$insert_public_user_one {
  Mutation$UpdatePublicUserById$insert_public_user_one({
    required this.user_id,
    required this.message,
    required this.number,
    this.$__typename = 'public_user',
  });

  factory Mutation$UpdatePublicUserById$insert_public_user_one.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$message = json['message'];
    final l$number = json['number'];
    final l$$__typename = json['__typename'];
    return Mutation$UpdatePublicUserById$insert_public_user_one(
      user_id: (l$user_id as String),
      message: (l$message as String),
      number: (l$number as int),
      $__typename: (l$$__typename as String),
    );
  }

  final String user_id;

  final String message;

  final int number;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
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
    final l$user_id = user_id;
    final l$message = message;
    final l$number = number;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$user_id,
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
    if (!(other is Mutation$UpdatePublicUserById$insert_public_user_one) ||
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
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Mutation$UpdatePublicUserById$insert_public_user_one
    on Mutation$UpdatePublicUserById$insert_public_user_one {
  CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<
          Mutation$UpdatePublicUserById$insert_public_user_one>
      get copyWith =>
          CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<
    TRes> {
  factory CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one(
    Mutation$UpdatePublicUserById$insert_public_user_one instance,
    TRes Function(Mutation$UpdatePublicUserById$insert_public_user_one) then,
  ) = _CopyWithImpl$Mutation$UpdatePublicUserById$insert_public_user_one;

  factory CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one.stub(
          TRes res) =
      _CopyWithStubImpl$Mutation$UpdatePublicUserById$insert_public_user_one;

  TRes call({
    String? user_id,
    String? message,
    int? number,
    String? $__typename,
  });
}

class _CopyWithImpl$Mutation$UpdatePublicUserById$insert_public_user_one<TRes>
    implements
        CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<TRes> {
  _CopyWithImpl$Mutation$UpdatePublicUserById$insert_public_user_one(
    this._instance,
    this._then,
  );

  final Mutation$UpdatePublicUserById$insert_public_user_one _instance;

  final TRes Function(Mutation$UpdatePublicUserById$insert_public_user_one)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Mutation$UpdatePublicUserById$insert_public_user_one(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as String),
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

class _CopyWithStubImpl$Mutation$UpdatePublicUserById$insert_public_user_one<
        TRes>
    implements
        CopyWith$Mutation$UpdatePublicUserById$insert_public_user_one<TRes> {
  _CopyWithStubImpl$Mutation$UpdatePublicUserById$insert_public_user_one(
      this._res);

  TRes _res;

  call({
    String? user_id,
    String? message,
    int? number,
    String? $__typename,
  }) =>
      _res;
}

class Variables$Subscription$ListenToPublicUserById {
  factory Variables$Subscription$ListenToPublicUserById({required String id}) =>
      Variables$Subscription$ListenToPublicUserById._({
        r'id': id,
      });

  Variables$Subscription$ListenToPublicUserById._(this._$data);

  factory Variables$Subscription$ListenToPublicUserById.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$id = data['id'];
    result$data['id'] = (l$id as String);
    return Variables$Subscription$ListenToPublicUserById._(result$data);
  }

  Map<String, dynamic> _$data;

  String get id => (_$data['id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$id = id;
    result$data['id'] = l$id;
    return result$data;
  }

  CopyWith$Variables$Subscription$ListenToPublicUserById<
          Variables$Subscription$ListenToPublicUserById>
      get copyWith => CopyWith$Variables$Subscription$ListenToPublicUserById(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Subscription$ListenToPublicUserById) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$id = id;
    return Object.hashAll([l$id]);
  }
}

abstract class CopyWith$Variables$Subscription$ListenToPublicUserById<TRes> {
  factory CopyWith$Variables$Subscription$ListenToPublicUserById(
    Variables$Subscription$ListenToPublicUserById instance,
    TRes Function(Variables$Subscription$ListenToPublicUserById) then,
  ) = _CopyWithImpl$Variables$Subscription$ListenToPublicUserById;

  factory CopyWith$Variables$Subscription$ListenToPublicUserById.stub(
          TRes res) =
      _CopyWithStubImpl$Variables$Subscription$ListenToPublicUserById;

  TRes call({String? id});
}

class _CopyWithImpl$Variables$Subscription$ListenToPublicUserById<TRes>
    implements CopyWith$Variables$Subscription$ListenToPublicUserById<TRes> {
  _CopyWithImpl$Variables$Subscription$ListenToPublicUserById(
    this._instance,
    this._then,
  );

  final Variables$Subscription$ListenToPublicUserById _instance;

  final TRes Function(Variables$Subscription$ListenToPublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? id = _undefined}) =>
      _then(Variables$Subscription$ListenToPublicUserById._({
        ..._instance._$data,
        if (id != _undefined && id != null) 'id': (id as String),
      }));
}

class _CopyWithStubImpl$Variables$Subscription$ListenToPublicUserById<TRes>
    implements CopyWith$Variables$Subscription$ListenToPublicUserById<TRes> {
  _CopyWithStubImpl$Variables$Subscription$ListenToPublicUserById(this._res);

  TRes _res;

  call({String? id}) => _res;
}

class Subscription$ListenToPublicUserById {
  Subscription$ListenToPublicUserById({this.public_user_by_pk});

  factory Subscription$ListenToPublicUserById.fromJson(
      Map<String, dynamic> json) {
    final l$public_user_by_pk = json['public_user_by_pk'];
    return Subscription$ListenToPublicUserById(
        public_user_by_pk: l$public_user_by_pk == null
            ? null
            : Subscription$ListenToPublicUserById$public_user_by_pk.fromJson(
                (l$public_user_by_pk as Map<String, dynamic>)));
  }

  final Subscription$ListenToPublicUserById$public_user_by_pk?
      public_user_by_pk;

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
    if (!(other is Subscription$ListenToPublicUserById) ||
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

extension UtilityExtension$Subscription$ListenToPublicUserById
    on Subscription$ListenToPublicUserById {
  CopyWith$Subscription$ListenToPublicUserById<
          Subscription$ListenToPublicUserById>
      get copyWith => CopyWith$Subscription$ListenToPublicUserById(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenToPublicUserById<TRes> {
  factory CopyWith$Subscription$ListenToPublicUserById(
    Subscription$ListenToPublicUserById instance,
    TRes Function(Subscription$ListenToPublicUserById) then,
  ) = _CopyWithImpl$Subscription$ListenToPublicUserById;

  factory CopyWith$Subscription$ListenToPublicUserById.stub(TRes res) =
      _CopyWithStubImpl$Subscription$ListenToPublicUserById;

  TRes call(
      {Subscription$ListenToPublicUserById$public_user_by_pk?
          public_user_by_pk});
  CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk;
}

class _CopyWithImpl$Subscription$ListenToPublicUserById<TRes>
    implements CopyWith$Subscription$ListenToPublicUserById<TRes> {
  _CopyWithImpl$Subscription$ListenToPublicUserById(
    this._instance,
    this._then,
  );

  final Subscription$ListenToPublicUserById _instance;

  final TRes Function(Subscription$ListenToPublicUserById) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? public_user_by_pk = _undefined}) =>
      _then(Subscription$ListenToPublicUserById(
          public_user_by_pk: public_user_by_pk == _undefined
              ? _instance.public_user_by_pk
              : (public_user_by_pk
                  as Subscription$ListenToPublicUserById$public_user_by_pk?)));
  CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk {
    final local$public_user_by_pk = _instance.public_user_by_pk;
    return local$public_user_by_pk == null
        ? CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk.stub(
            _then(_instance))
        : CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk(
            local$public_user_by_pk, (e) => call(public_user_by_pk: e));
  }
}

class _CopyWithStubImpl$Subscription$ListenToPublicUserById<TRes>
    implements CopyWith$Subscription$ListenToPublicUserById<TRes> {
  _CopyWithStubImpl$Subscription$ListenToPublicUserById(this._res);

  TRes _res;

  call(
          {Subscription$ListenToPublicUserById$public_user_by_pk?
              public_user_by_pk}) =>
      _res;
  CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<TRes>
      get public_user_by_pk =>
          CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk.stub(
              _res);
}

const documentNodeSubscriptionListenToPublicUserById =
    DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'ListenToPublicUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
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
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
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
Subscription$ListenToPublicUserById
    _parserFn$Subscription$ListenToPublicUserById(Map<String, dynamic> data) =>
        Subscription$ListenToPublicUserById.fromJson(data);

class Options$Subscription$ListenToPublicUserById
    extends graphql.SubscriptionOptions<Subscription$ListenToPublicUserById> {
  Options$Subscription$ListenToPublicUserById({
    String? operationName,
    required Variables$Subscription$ListenToPublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenToPublicUserById? typedOptimisticResult,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeSubscriptionListenToPublicUserById,
          parserFn: _parserFn$Subscription$ListenToPublicUserById,
        );
}

class WatchOptions$Subscription$ListenToPublicUserById
    extends graphql.WatchQueryOptions<Subscription$ListenToPublicUserById> {
  WatchOptions$Subscription$ListenToPublicUserById({
    String? operationName,
    required Variables$Subscription$ListenToPublicUserById variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Subscription$ListenToPublicUserById? typedOptimisticResult,
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
          document: documentNodeSubscriptionListenToPublicUserById,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Subscription$ListenToPublicUserById,
        );
}

class FetchMoreOptions$Subscription$ListenToPublicUserById
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Subscription$ListenToPublicUserById({
    required graphql.UpdateQuery updateQuery,
    required Variables$Subscription$ListenToPublicUserById variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeSubscriptionListenToPublicUserById,
        );
}

extension ClientExtension$Subscription$ListenToPublicUserById
    on graphql.GraphQLClient {
  Stream<graphql.QueryResult<Subscription$ListenToPublicUserById>>
      subscribe$ListenToPublicUserById(
              Options$Subscription$ListenToPublicUserById options) =>
          this.subscribe(options);
  graphql.ObservableQuery<Subscription$ListenToPublicUserById>
      watchSubscription$ListenToPublicUserById(
              WatchOptions$Subscription$ListenToPublicUserById options) =>
          this.watchQuery(options);
}

graphql.QueryResult<Subscription$ListenToPublicUserById>
    useSubscription$ListenToPublicUserById(
            Options$Subscription$ListenToPublicUserById options) =>
        graphql_flutter.useSubscription(options);

class Subscription$ListenToPublicUserById$Widget
    extends graphql_flutter.Subscription<Subscription$ListenToPublicUserById> {
  Subscription$ListenToPublicUserById$Widget({
    widgets.Key? key,
    required Options$Subscription$ListenToPublicUserById options,
    required graphql_flutter
            .SubscriptionBuilder<Subscription$ListenToPublicUserById>
        builder,
    graphql_flutter.OnSubscriptionResult<Subscription$ListenToPublicUserById>?
        onSubscriptionResult,
  }) : super(
          key: key,
          options: options,
          builder: builder,
          onSubscriptionResult: onSubscriptionResult,
        );
}

class Subscription$ListenToPublicUserById$public_user_by_pk {
  Subscription$ListenToPublicUserById$public_user_by_pk({
    required this.user_id,
    required this.message,
    required this.number,
  });

  factory Subscription$ListenToPublicUserById$public_user_by_pk.fromJson(
      Map<String, dynamic> json) {
    final l$user_id = json['user_id'];
    final l$message = json['message'];
    final l$number = json['number'];
    return Subscription$ListenToPublicUserById$public_user_by_pk(
      user_id: (l$user_id as String),
      message: (l$message as String),
      number: (l$number as int),
    );
  }

  final String user_id;

  final String message;

  final int number;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$user_id = user_id;
    _resultData['user_id'] = l$user_id;
    final l$message = message;
    _resultData['message'] = l$message;
    final l$number = number;
    _resultData['number'] = l$number;
    return _resultData;
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

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Subscription$ListenToPublicUserById$public_user_by_pk) ||
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
}

extension UtilityExtension$Subscription$ListenToPublicUserById$public_user_by_pk
    on Subscription$ListenToPublicUserById$public_user_by_pk {
  CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<
          Subscription$ListenToPublicUserById$public_user_by_pk>
      get copyWith =>
          CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<
    TRes> {
  factory CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk(
    Subscription$ListenToPublicUserById$public_user_by_pk instance,
    TRes Function(Subscription$ListenToPublicUserById$public_user_by_pk) then,
  ) = _CopyWithImpl$Subscription$ListenToPublicUserById$public_user_by_pk;

  factory CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk.stub(
          TRes res) =
      _CopyWithStubImpl$Subscription$ListenToPublicUserById$public_user_by_pk;

  TRes call({
    String? user_id,
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Subscription$ListenToPublicUserById$public_user_by_pk<TRes>
    implements
        CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<TRes> {
  _CopyWithImpl$Subscription$ListenToPublicUserById$public_user_by_pk(
    this._instance,
    this._then,
  );

  final Subscription$ListenToPublicUserById$public_user_by_pk _instance;

  final TRes Function(Subscription$ListenToPublicUserById$public_user_by_pk)
      _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? user_id = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Subscription$ListenToPublicUserById$public_user_by_pk(
        user_id: user_id == _undefined || user_id == null
            ? _instance.user_id
            : (user_id as String),
        message: message == _undefined || message == null
            ? _instance.message
            : (message as String),
        number: number == _undefined || number == null
            ? _instance.number
            : (number as int),
      ));
}

class _CopyWithStubImpl$Subscription$ListenToPublicUserById$public_user_by_pk<
        TRes>
    implements
        CopyWith$Subscription$ListenToPublicUserById$public_user_by_pk<TRes> {
  _CopyWithStubImpl$Subscription$ListenToPublicUserById$public_user_by_pk(
      this._res);

  TRes _res;

  call({
    String? user_id,
    String? message,
    int? number,
  }) =>
      _res;
}
