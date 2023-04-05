class Input$ActionMutationPongInput {
  factory Input$ActionMutationPongInput({
    required String message,
    required int number,
  }) =>
      Input$ActionMutationPongInput._({
        r'message': message,
        r'number': number,
      });

  Input$ActionMutationPongInput._(this._$data);

  factory Input$ActionMutationPongInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$message = data['message'];
    result$data['message'] = (l$message as String);
    final l$number = data['number'];
    result$data['number'] = (l$number as int);
    return Input$ActionMutationPongInput._(result$data);
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

  CopyWith$Input$ActionMutationPongInput<Input$ActionMutationPongInput>
      get copyWith => CopyWith$Input$ActionMutationPongInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActionMutationPongInput) ||
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

abstract class CopyWith$Input$ActionMutationPongInput<TRes> {
  factory CopyWith$Input$ActionMutationPongInput(
    Input$ActionMutationPongInput instance,
    TRes Function(Input$ActionMutationPongInput) then,
  ) = _CopyWithImpl$Input$ActionMutationPongInput;

  factory CopyWith$Input$ActionMutationPongInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActionMutationPongInput;

  TRes call({
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Input$ActionMutationPongInput<TRes>
    implements CopyWith$Input$ActionMutationPongInput<TRes> {
  _CopyWithImpl$Input$ActionMutationPongInput(
    this._instance,
    this._then,
  );

  final Input$ActionMutationPongInput _instance;

  final TRes Function(Input$ActionMutationPongInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Input$ActionMutationPongInput._({
        ..._instance._$data,
        if (message != _undefined && message != null)
          'message': (message as String),
        if (number != _undefined && number != null) 'number': (number as int),
      }));
}

class _CopyWithStubImpl$Input$ActionMutationPongInput<TRes>
    implements CopyWith$Input$ActionMutationPongInput<TRes> {
  _CopyWithStubImpl$Input$ActionMutationPongInput(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
  }) =>
      _res;
}

class Input$ActionQueryPingInput {
  factory Input$ActionQueryPingInput({
    String? message,
    int? number,
  }) =>
      Input$ActionQueryPingInput._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
      });

  Input$ActionQueryPingInput._(this._$data);

  factory Input$ActionQueryPingInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    return Input$ActionQueryPingInput._(result$data);
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

  CopyWith$Input$ActionQueryPingInput<Input$ActionQueryPingInput>
      get copyWith => CopyWith$Input$ActionQueryPingInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActionQueryPingInput) ||
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

abstract class CopyWith$Input$ActionQueryPingInput<TRes> {
  factory CopyWith$Input$ActionQueryPingInput(
    Input$ActionQueryPingInput instance,
    TRes Function(Input$ActionQueryPingInput) then,
  ) = _CopyWithImpl$Input$ActionQueryPingInput;

  factory CopyWith$Input$ActionQueryPingInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActionQueryPingInput;

  TRes call({
    String? message,
    int? number,
  });
}

class _CopyWithImpl$Input$ActionQueryPingInput<TRes>
    implements CopyWith$Input$ActionQueryPingInput<TRes> {
  _CopyWithImpl$Input$ActionQueryPingInput(
    this._instance,
    this._then,
  );

  final Input$ActionQueryPingInput _instance;

  final TRes Function(Input$ActionQueryPingInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
  }) =>
      _then(Input$ActionQueryPingInput._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
      }));
}

class _CopyWithStubImpl$Input$ActionQueryPingInput<TRes>
    implements CopyWith$Input$ActionQueryPingInput<TRes> {
  _CopyWithStubImpl$Input$ActionQueryPingInput(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
  }) =>
      _res;
}

class Input$ActionUploadFileInput {
  factory Input$ActionUploadFileInput({
    required String file_data,
    required String file_name,
    required String file_type,
  }) =>
      Input$ActionUploadFileInput._({
        r'file_data': file_data,
        r'file_name': file_name,
        r'file_type': file_type,
      });

  Input$ActionUploadFileInput._(this._$data);

  factory Input$ActionUploadFileInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$file_data = data['file_data'];
    result$data['file_data'] = (l$file_data as String);
    final l$file_name = data['file_name'];
    result$data['file_name'] = (l$file_name as String);
    final l$file_type = data['file_type'];
    result$data['file_type'] = (l$file_type as String);
    return Input$ActionUploadFileInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get file_data => (_$data['file_data'] as String);
  String get file_name => (_$data['file_name'] as String);
  String get file_type => (_$data['file_type'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$file_data = file_data;
    result$data['file_data'] = l$file_data;
    final l$file_name = file_name;
    result$data['file_name'] = l$file_name;
    final l$file_type = file_type;
    result$data['file_type'] = l$file_type;
    return result$data;
  }

  CopyWith$Input$ActionUploadFileInput<Input$ActionUploadFileInput>
      get copyWith => CopyWith$Input$ActionUploadFileInput(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ActionUploadFileInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_data = file_data;
    final lOther$file_data = other.file_data;
    if (l$file_data != lOther$file_data) {
      return false;
    }
    final l$file_name = file_name;
    final lOther$file_name = other.file_name;
    if (l$file_name != lOther$file_name) {
      return false;
    }
    final l$file_type = file_type;
    final lOther$file_type = other.file_type;
    if (l$file_type != lOther$file_type) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_data = file_data;
    final l$file_name = file_name;
    final l$file_type = file_type;
    return Object.hashAll([
      l$file_data,
      l$file_name,
      l$file_type,
    ]);
  }
}

abstract class CopyWith$Input$ActionUploadFileInput<TRes> {
  factory CopyWith$Input$ActionUploadFileInput(
    Input$ActionUploadFileInput instance,
    TRes Function(Input$ActionUploadFileInput) then,
  ) = _CopyWithImpl$Input$ActionUploadFileInput;

  factory CopyWith$Input$ActionUploadFileInput.stub(TRes res) =
      _CopyWithStubImpl$Input$ActionUploadFileInput;

  TRes call({
    String? file_data,
    String? file_name,
    String? file_type,
  });
}

class _CopyWithImpl$Input$ActionUploadFileInput<TRes>
    implements CopyWith$Input$ActionUploadFileInput<TRes> {
  _CopyWithImpl$Input$ActionUploadFileInput(
    this._instance,
    this._then,
  );

  final Input$ActionUploadFileInput _instance;

  final TRes Function(Input$ActionUploadFileInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_data = _undefined,
    Object? file_name = _undefined,
    Object? file_type = _undefined,
  }) =>
      _then(Input$ActionUploadFileInput._({
        ..._instance._$data,
        if (file_data != _undefined && file_data != null)
          'file_data': (file_data as String),
        if (file_name != _undefined && file_name != null)
          'file_name': (file_name as String),
        if (file_type != _undefined && file_type != null)
          'file_type': (file_type as String),
      }));
}

class _CopyWithStubImpl$Input$ActionUploadFileInput<TRes>
    implements CopyWith$Input$ActionUploadFileInput<TRes> {
  _CopyWithStubImpl$Input$ActionUploadFileInput(this._res);

  TRes _res;

  call({
    String? file_data,
    String? file_name,
    String? file_type,
  }) =>
      _res;
}

class Input$Boolean_comparison_exp {
  factory Input$Boolean_comparison_exp({
    bool? $_eq,
    bool? $_gt,
    bool? $_gte,
    List<bool>? $_in,
    bool? $_is_null,
    bool? $_lt,
    bool? $_lte,
    bool? $_neq,
    List<bool>? $_nin,
  }) =>
      Input$Boolean_comparison_exp._({
        if ($_eq != null) r'_eq': $_eq,
        if ($_gt != null) r'_gt': $_gt,
        if ($_gte != null) r'_gte': $_gte,
        if ($_in != null) r'_in': $_in,
        if ($_is_null != null) r'_is_null': $_is_null,
        if ($_lt != null) r'_lt': $_lt,
        if ($_lte != null) r'_lte': $_lte,
        if ($_neq != null) r'_neq': $_neq,
        if ($_nin != null) r'_nin': $_nin,
      });

  Input$Boolean_comparison_exp._(this._$data);

  factory Input$Boolean_comparison_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as bool?);
    }
    if (data.containsKey('_gt')) {
      final l$$_gt = data['_gt'];
      result$data['_gt'] = (l$$_gt as bool?);
    }
    if (data.containsKey('_gte')) {
      final l$$_gte = data['_gte'];
      result$data['_gte'] = (l$$_gte as bool?);
    }
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] =
          (l$$_in as List<dynamic>?)?.map((e) => (e as bool)).toList();
    }
    if (data.containsKey('_is_null')) {
      final l$$_is_null = data['_is_null'];
      result$data['_is_null'] = (l$$_is_null as bool?);
    }
    if (data.containsKey('_lt')) {
      final l$$_lt = data['_lt'];
      result$data['_lt'] = (l$$_lt as bool?);
    }
    if (data.containsKey('_lte')) {
      final l$$_lte = data['_lte'];
      result$data['_lte'] = (l$$_lte as bool?);
    }
    if (data.containsKey('_neq')) {
      final l$$_neq = data['_neq'];
      result$data['_neq'] = (l$$_neq as bool?);
    }
    if (data.containsKey('_nin')) {
      final l$$_nin = data['_nin'];
      result$data['_nin'] =
          (l$$_nin as List<dynamic>?)?.map((e) => (e as bool)).toList();
    }
    return Input$Boolean_comparison_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  bool? get $_eq => (_$data['_eq'] as bool?);
  bool? get $_gt => (_$data['_gt'] as bool?);
  bool? get $_gte => (_$data['_gte'] as bool?);
  List<bool>? get $_in => (_$data['_in'] as List<bool>?);
  bool? get $_is_null => (_$data['_is_null'] as bool?);
  bool? get $_lt => (_$data['_lt'] as bool?);
  bool? get $_lte => (_$data['_lte'] as bool?);
  bool? get $_neq => (_$data['_neq'] as bool?);
  List<bool>? get $_nin => (_$data['_nin'] as List<bool>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    if (_$data.containsKey('_gt')) {
      final l$$_gt = $_gt;
      result$data['_gt'] = l$$_gt;
    }
    if (_$data.containsKey('_gte')) {
      final l$$_gte = $_gte;
      result$data['_gte'] = l$$_gte;
    }
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] = l$$_in?.map((e) => e).toList();
    }
    if (_$data.containsKey('_is_null')) {
      final l$$_is_null = $_is_null;
      result$data['_is_null'] = l$$_is_null;
    }
    if (_$data.containsKey('_lt')) {
      final l$$_lt = $_lt;
      result$data['_lt'] = l$$_lt;
    }
    if (_$data.containsKey('_lte')) {
      final l$$_lte = $_lte;
      result$data['_lte'] = l$$_lte;
    }
    if (_$data.containsKey('_neq')) {
      final l$$_neq = $_neq;
      result$data['_neq'] = l$$_neq;
    }
    if (_$data.containsKey('_nin')) {
      final l$$_nin = $_nin;
      result$data['_nin'] = l$$_nin?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$Boolean_comparison_exp<Input$Boolean_comparison_exp>
      get copyWith => CopyWith$Input$Boolean_comparison_exp(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$Boolean_comparison_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    final l$$_gt = $_gt;
    final lOther$$_gt = other.$_gt;
    if (_$data.containsKey('_gt') != other._$data.containsKey('_gt')) {
      return false;
    }
    if (l$$_gt != lOther$$_gt) {
      return false;
    }
    final l$$_gte = $_gte;
    final lOther$$_gte = other.$_gte;
    if (_$data.containsKey('_gte') != other._$data.containsKey('_gte')) {
      return false;
    }
    if (l$$_gte != lOther$$_gte) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    final l$$_is_null = $_is_null;
    final lOther$$_is_null = other.$_is_null;
    if (_$data.containsKey('_is_null') !=
        other._$data.containsKey('_is_null')) {
      return false;
    }
    if (l$$_is_null != lOther$$_is_null) {
      return false;
    }
    final l$$_lt = $_lt;
    final lOther$$_lt = other.$_lt;
    if (_$data.containsKey('_lt') != other._$data.containsKey('_lt')) {
      return false;
    }
    if (l$$_lt != lOther$$_lt) {
      return false;
    }
    final l$$_lte = $_lte;
    final lOther$$_lte = other.$_lte;
    if (_$data.containsKey('_lte') != other._$data.containsKey('_lte')) {
      return false;
    }
    if (l$$_lte != lOther$$_lte) {
      return false;
    }
    final l$$_neq = $_neq;
    final lOther$$_neq = other.$_neq;
    if (_$data.containsKey('_neq') != other._$data.containsKey('_neq')) {
      return false;
    }
    if (l$$_neq != lOther$$_neq) {
      return false;
    }
    final l$$_nin = $_nin;
    final lOther$$_nin = other.$_nin;
    if (_$data.containsKey('_nin') != other._$data.containsKey('_nin')) {
      return false;
    }
    if (l$$_nin != null && lOther$$_nin != null) {
      if (l$$_nin.length != lOther$$_nin.length) {
        return false;
      }
      for (int i = 0; i < l$$_nin.length; i++) {
        final l$$_nin$entry = l$$_nin[i];
        final lOther$$_nin$entry = lOther$$_nin[i];
        if (l$$_nin$entry != lOther$$_nin$entry) {
          return false;
        }
      }
    } else if (l$$_nin != lOther$$_nin) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    final l$$_gt = $_gt;
    final l$$_gte = $_gte;
    final l$$_in = $_in;
    final l$$_is_null = $_is_null;
    final l$$_lt = $_lt;
    final l$$_lte = $_lte;
    final l$$_neq = $_neq;
    final l$$_nin = $_nin;
    return Object.hashAll([
      _$data.containsKey('_eq') ? l$$_eq : const {},
      _$data.containsKey('_gt') ? l$$_gt : const {},
      _$data.containsKey('_gte') ? l$$_gte : const {},
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {},
      _$data.containsKey('_is_null') ? l$$_is_null : const {},
      _$data.containsKey('_lt') ? l$$_lt : const {},
      _$data.containsKey('_lte') ? l$$_lte : const {},
      _$data.containsKey('_neq') ? l$$_neq : const {},
      _$data.containsKey('_nin')
          ? l$$_nin == null
              ? null
              : Object.hashAll(l$$_nin.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$Boolean_comparison_exp<TRes> {
  factory CopyWith$Input$Boolean_comparison_exp(
    Input$Boolean_comparison_exp instance,
    TRes Function(Input$Boolean_comparison_exp) then,
  ) = _CopyWithImpl$Input$Boolean_comparison_exp;

  factory CopyWith$Input$Boolean_comparison_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$Boolean_comparison_exp;

  TRes call({
    bool? $_eq,
    bool? $_gt,
    bool? $_gte,
    List<bool>? $_in,
    bool? $_is_null,
    bool? $_lt,
    bool? $_lte,
    bool? $_neq,
    List<bool>? $_nin,
  });
}

class _CopyWithImpl$Input$Boolean_comparison_exp<TRes>
    implements CopyWith$Input$Boolean_comparison_exp<TRes> {
  _CopyWithImpl$Input$Boolean_comparison_exp(
    this._instance,
    this._then,
  );

  final Input$Boolean_comparison_exp _instance;

  final TRes Function(Input$Boolean_comparison_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_eq = _undefined,
    Object? $_gt = _undefined,
    Object? $_gte = _undefined,
    Object? $_in = _undefined,
    Object? $_is_null = _undefined,
    Object? $_lt = _undefined,
    Object? $_lte = _undefined,
    Object? $_neq = _undefined,
    Object? $_nin = _undefined,
  }) =>
      _then(Input$Boolean_comparison_exp._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as bool?),
        if ($_gt != _undefined) '_gt': ($_gt as bool?),
        if ($_gte != _undefined) '_gte': ($_gte as bool?),
        if ($_in != _undefined) '_in': ($_in as List<bool>?),
        if ($_is_null != _undefined) '_is_null': ($_is_null as bool?),
        if ($_lt != _undefined) '_lt': ($_lt as bool?),
        if ($_lte != _undefined) '_lte': ($_lte as bool?),
        if ($_neq != _undefined) '_neq': ($_neq as bool?),
        if ($_nin != _undefined) '_nin': ($_nin as List<bool>?),
      }));
}

class _CopyWithStubImpl$Input$Boolean_comparison_exp<TRes>
    implements CopyWith$Input$Boolean_comparison_exp<TRes> {
  _CopyWithStubImpl$Input$Boolean_comparison_exp(this._res);

  TRes _res;

  call({
    bool? $_eq,
    bool? $_gt,
    bool? $_gte,
    List<bool>? $_in,
    bool? $_is_null,
    bool? $_lt,
    bool? $_lte,
    bool? $_neq,
    List<bool>? $_nin,
  }) =>
      _res;
}

class Input$ENUM_ROLE_bool_exp {
  factory Input$ENUM_ROLE_bool_exp({
    List<Input$ENUM_ROLE_bool_exp>? $_and,
    Input$ENUM_ROLE_bool_exp? $_not,
    List<Input$ENUM_ROLE_bool_exp>? $_or,
    Input$String_comparison_exp? comment,
    Input$String_comparison_exp? value,
  }) =>
      Input$ENUM_ROLE_bool_exp._({
        if ($_and != null) r'_and': $_and,
        if ($_not != null) r'_not': $_not,
        if ($_or != null) r'_or': $_or,
        if (comment != null) r'comment': comment,
        if (value != null) r'value': value,
      });

  Input$ENUM_ROLE_bool_exp._(this._$data);

  factory Input$ENUM_ROLE_bool_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_and')) {
      final l$$_and = data['_and'];
      result$data['_and'] = (l$$_and as List<dynamic>?)
          ?.map((e) =>
              Input$ENUM_ROLE_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('_not')) {
      final l$$_not = data['_not'];
      result$data['_not'] = l$$_not == null
          ? null
          : Input$ENUM_ROLE_bool_exp.fromJson(
              (l$$_not as Map<String, dynamic>));
    }
    if (data.containsKey('_or')) {
      final l$$_or = data['_or'];
      result$data['_or'] = (l$$_or as List<dynamic>?)
          ?.map((e) =>
              Input$ENUM_ROLE_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = l$comment == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$comment as Map<String, dynamic>));
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = l$value == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$value as Map<String, dynamic>));
    }
    return Input$ENUM_ROLE_bool_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$ENUM_ROLE_bool_exp>? get $_and =>
      (_$data['_and'] as List<Input$ENUM_ROLE_bool_exp>?);
  Input$ENUM_ROLE_bool_exp? get $_not =>
      (_$data['_not'] as Input$ENUM_ROLE_bool_exp?);
  List<Input$ENUM_ROLE_bool_exp>? get $_or =>
      (_$data['_or'] as List<Input$ENUM_ROLE_bool_exp>?);
  Input$String_comparison_exp? get comment =>
      (_$data['comment'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get value =>
      (_$data['value'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_and')) {
      final l$$_and = $_and;
      result$data['_and'] = l$$_and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('_not')) {
      final l$$_not = $_not;
      result$data['_not'] = l$$_not?.toJson();
    }
    if (_$data.containsKey('_or')) {
      final l$$_or = $_or;
      result$data['_or'] = l$$_or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment?.toJson();
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_bool_exp<Input$ENUM_ROLE_bool_exp> get copyWith =>
      CopyWith$Input$ENUM_ROLE_bool_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_bool_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_and = $_and;
    final lOther$$_and = other.$_and;
    if (_$data.containsKey('_and') != other._$data.containsKey('_and')) {
      return false;
    }
    if (l$$_and != null && lOther$$_and != null) {
      if (l$$_and.length != lOther$$_and.length) {
        return false;
      }
      for (int i = 0; i < l$$_and.length; i++) {
        final l$$_and$entry = l$$_and[i];
        final lOther$$_and$entry = lOther$$_and[i];
        if (l$$_and$entry != lOther$$_and$entry) {
          return false;
        }
      }
    } else if (l$$_and != lOther$$_and) {
      return false;
    }
    final l$$_not = $_not;
    final lOther$$_not = other.$_not;
    if (_$data.containsKey('_not') != other._$data.containsKey('_not')) {
      return false;
    }
    if (l$$_not != lOther$$_not) {
      return false;
    }
    final l$$_or = $_or;
    final lOther$$_or = other.$_or;
    if (_$data.containsKey('_or') != other._$data.containsKey('_or')) {
      return false;
    }
    if (l$$_or != null && lOther$$_or != null) {
      if (l$$_or.length != lOther$$_or.length) {
        return false;
      }
      for (int i = 0; i < l$$_or.length; i++) {
        final l$$_or$entry = l$$_or[i];
        final lOther$$_or$entry = lOther$$_or[i];
        if (l$$_or$entry != lOther$$_or$entry) {
          return false;
        }
      }
    } else if (l$$_or != lOther$$_or) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_and = $_and;
    final l$$_not = $_not;
    final l$$_or = $_or;
    final l$comment = comment;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('_and')
          ? l$$_and == null
              ? null
              : Object.hashAll(l$$_and.map((v) => v))
          : const {},
      _$data.containsKey('_not') ? l$$_not : const {},
      _$data.containsKey('_or')
          ? l$$_or == null
              ? null
              : Object.hashAll(l$$_or.map((v) => v))
          : const {},
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_bool_exp<TRes> {
  factory CopyWith$Input$ENUM_ROLE_bool_exp(
    Input$ENUM_ROLE_bool_exp instance,
    TRes Function(Input$ENUM_ROLE_bool_exp) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_bool_exp;

  factory CopyWith$Input$ENUM_ROLE_bool_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_bool_exp;

  TRes call({
    List<Input$ENUM_ROLE_bool_exp>? $_and,
    Input$ENUM_ROLE_bool_exp? $_not,
    List<Input$ENUM_ROLE_bool_exp>? $_or,
    Input$String_comparison_exp? comment,
    Input$String_comparison_exp? value,
  });
  TRes $_and(
      Iterable<Input$ENUM_ROLE_bool_exp>? Function(
              Iterable<
                  CopyWith$Input$ENUM_ROLE_bool_exp<Input$ENUM_ROLE_bool_exp>>?)
          _fn);
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get $_not;
  TRes $_or(
      Iterable<Input$ENUM_ROLE_bool_exp>? Function(
              Iterable<
                  CopyWith$Input$ENUM_ROLE_bool_exp<Input$ENUM_ROLE_bool_exp>>?)
          _fn);
  CopyWith$Input$String_comparison_exp<TRes> get comment;
  CopyWith$Input$String_comparison_exp<TRes> get value;
}

class _CopyWithImpl$Input$ENUM_ROLE_bool_exp<TRes>
    implements CopyWith$Input$ENUM_ROLE_bool_exp<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_bool_exp(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_bool_exp _instance;

  final TRes Function(Input$ENUM_ROLE_bool_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_and = _undefined,
    Object? $_not = _undefined,
    Object? $_or = _undefined,
    Object? comment = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_bool_exp._({
        ..._instance._$data,
        if ($_and != _undefined)
          '_and': ($_and as List<Input$ENUM_ROLE_bool_exp>?),
        if ($_not != _undefined) '_not': ($_not as Input$ENUM_ROLE_bool_exp?),
        if ($_or != _undefined)
          '_or': ($_or as List<Input$ENUM_ROLE_bool_exp>?),
        if (comment != _undefined)
          'comment': (comment as Input$String_comparison_exp?),
        if (value != _undefined)
          'value': (value as Input$String_comparison_exp?),
      }));
  TRes $_and(
          Iterable<Input$ENUM_ROLE_bool_exp>? Function(
                  Iterable<
                      CopyWith$Input$ENUM_ROLE_bool_exp<
                          Input$ENUM_ROLE_bool_exp>>?)
              _fn) =>
      call(
          $_and:
              _fn(_instance.$_and?.map((e) => CopyWith$Input$ENUM_ROLE_bool_exp(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get $_not {
    final local$$_not = _instance.$_not;
    return local$$_not == null
        ? CopyWith$Input$ENUM_ROLE_bool_exp.stub(_then(_instance))
        : CopyWith$Input$ENUM_ROLE_bool_exp(local$$_not, (e) => call($_not: e));
  }

  TRes $_or(
          Iterable<Input$ENUM_ROLE_bool_exp>? Function(
                  Iterable<
                      CopyWith$Input$ENUM_ROLE_bool_exp<
                          Input$ENUM_ROLE_bool_exp>>?)
              _fn) =>
      call(
          $_or:
              _fn(_instance.$_or?.map((e) => CopyWith$Input$ENUM_ROLE_bool_exp(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Input$String_comparison_exp<TRes> get comment {
    final local$comment = _instance.comment;
    return local$comment == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$comment, (e) => call(comment: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get value {
    final local$value = _instance.value;
    return local$value == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$value, (e) => call(value: e));
  }
}

class _CopyWithStubImpl$Input$ENUM_ROLE_bool_exp<TRes>
    implements CopyWith$Input$ENUM_ROLE_bool_exp<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_bool_exp(this._res);

  TRes _res;

  call({
    List<Input$ENUM_ROLE_bool_exp>? $_and,
    Input$ENUM_ROLE_bool_exp? $_not,
    List<Input$ENUM_ROLE_bool_exp>? $_or,
    Input$String_comparison_exp? comment,
    Input$String_comparison_exp? value,
  }) =>
      _res;
  $_and(_fn) => _res;
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get $_not =>
      CopyWith$Input$ENUM_ROLE_bool_exp.stub(_res);
  $_or(_fn) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get comment =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get value =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}

class Input$ENUM_ROLE_enum_comparison_exp {
  factory Input$ENUM_ROLE_enum_comparison_exp({
    Enum$ENUM_ROLE_enum? $_eq,
    List<Enum$ENUM_ROLE_enum>? $_in,
    bool? $_is_null,
    Enum$ENUM_ROLE_enum? $_neq,
    List<Enum$ENUM_ROLE_enum>? $_nin,
  }) =>
      Input$ENUM_ROLE_enum_comparison_exp._({
        if ($_eq != null) r'_eq': $_eq,
        if ($_in != null) r'_in': $_in,
        if ($_is_null != null) r'_is_null': $_is_null,
        if ($_neq != null) r'_neq': $_neq,
        if ($_nin != null) r'_nin': $_nin,
      });

  Input$ENUM_ROLE_enum_comparison_exp._(this._$data);

  factory Input$ENUM_ROLE_enum_comparison_exp.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = l$$_eq == null
          ? null
          : fromJson$Enum$ENUM_ROLE_enum((l$$_eq as String));
    }
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] = (l$$_in as List<dynamic>?)
          ?.map((e) => fromJson$Enum$ENUM_ROLE_enum((e as String)))
          .toList();
    }
    if (data.containsKey('_is_null')) {
      final l$$_is_null = data['_is_null'];
      result$data['_is_null'] = (l$$_is_null as bool?);
    }
    if (data.containsKey('_neq')) {
      final l$$_neq = data['_neq'];
      result$data['_neq'] = l$$_neq == null
          ? null
          : fromJson$Enum$ENUM_ROLE_enum((l$$_neq as String));
    }
    if (data.containsKey('_nin')) {
      final l$$_nin = data['_nin'];
      result$data['_nin'] = (l$$_nin as List<dynamic>?)
          ?.map((e) => fromJson$Enum$ENUM_ROLE_enum((e as String)))
          .toList();
    }
    return Input$ENUM_ROLE_enum_comparison_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ENUM_ROLE_enum? get $_eq => (_$data['_eq'] as Enum$ENUM_ROLE_enum?);
  List<Enum$ENUM_ROLE_enum>? get $_in =>
      (_$data['_in'] as List<Enum$ENUM_ROLE_enum>?);
  bool? get $_is_null => (_$data['_is_null'] as bool?);
  Enum$ENUM_ROLE_enum? get $_neq => (_$data['_neq'] as Enum$ENUM_ROLE_enum?);
  List<Enum$ENUM_ROLE_enum>? get $_nin =>
      (_$data['_nin'] as List<Enum$ENUM_ROLE_enum>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] =
          l$$_eq == null ? null : toJson$Enum$ENUM_ROLE_enum(l$$_eq);
    }
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] =
          l$$_in?.map((e) => toJson$Enum$ENUM_ROLE_enum(e)).toList();
    }
    if (_$data.containsKey('_is_null')) {
      final l$$_is_null = $_is_null;
      result$data['_is_null'] = l$$_is_null;
    }
    if (_$data.containsKey('_neq')) {
      final l$$_neq = $_neq;
      result$data['_neq'] =
          l$$_neq == null ? null : toJson$Enum$ENUM_ROLE_enum(l$$_neq);
    }
    if (_$data.containsKey('_nin')) {
      final l$$_nin = $_nin;
      result$data['_nin'] =
          l$$_nin?.map((e) => toJson$Enum$ENUM_ROLE_enum(e)).toList();
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_enum_comparison_exp<
          Input$ENUM_ROLE_enum_comparison_exp>
      get copyWith => CopyWith$Input$ENUM_ROLE_enum_comparison_exp(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_enum_comparison_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    final l$$_is_null = $_is_null;
    final lOther$$_is_null = other.$_is_null;
    if (_$data.containsKey('_is_null') !=
        other._$data.containsKey('_is_null')) {
      return false;
    }
    if (l$$_is_null != lOther$$_is_null) {
      return false;
    }
    final l$$_neq = $_neq;
    final lOther$$_neq = other.$_neq;
    if (_$data.containsKey('_neq') != other._$data.containsKey('_neq')) {
      return false;
    }
    if (l$$_neq != lOther$$_neq) {
      return false;
    }
    final l$$_nin = $_nin;
    final lOther$$_nin = other.$_nin;
    if (_$data.containsKey('_nin') != other._$data.containsKey('_nin')) {
      return false;
    }
    if (l$$_nin != null && lOther$$_nin != null) {
      if (l$$_nin.length != lOther$$_nin.length) {
        return false;
      }
      for (int i = 0; i < l$$_nin.length; i++) {
        final l$$_nin$entry = l$$_nin[i];
        final lOther$$_nin$entry = lOther$$_nin[i];
        if (l$$_nin$entry != lOther$$_nin$entry) {
          return false;
        }
      }
    } else if (l$$_nin != lOther$$_nin) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    final l$$_in = $_in;
    final l$$_is_null = $_is_null;
    final l$$_neq = $_neq;
    final l$$_nin = $_nin;
    return Object.hashAll([
      _$data.containsKey('_eq') ? l$$_eq : const {},
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {},
      _$data.containsKey('_is_null') ? l$$_is_null : const {},
      _$data.containsKey('_neq') ? l$$_neq : const {},
      _$data.containsKey('_nin')
          ? l$$_nin == null
              ? null
              : Object.hashAll(l$$_nin.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> {
  factory CopyWith$Input$ENUM_ROLE_enum_comparison_exp(
    Input$ENUM_ROLE_enum_comparison_exp instance,
    TRes Function(Input$ENUM_ROLE_enum_comparison_exp) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_enum_comparison_exp;

  factory CopyWith$Input$ENUM_ROLE_enum_comparison_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_enum_comparison_exp;

  TRes call({
    Enum$ENUM_ROLE_enum? $_eq,
    List<Enum$ENUM_ROLE_enum>? $_in,
    bool? $_is_null,
    Enum$ENUM_ROLE_enum? $_neq,
    List<Enum$ENUM_ROLE_enum>? $_nin,
  });
}

class _CopyWithImpl$Input$ENUM_ROLE_enum_comparison_exp<TRes>
    implements CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_enum_comparison_exp(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_enum_comparison_exp _instance;

  final TRes Function(Input$ENUM_ROLE_enum_comparison_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_eq = _undefined,
    Object? $_in = _undefined,
    Object? $_is_null = _undefined,
    Object? $_neq = _undefined,
    Object? $_nin = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_enum_comparison_exp._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as Enum$ENUM_ROLE_enum?),
        if ($_in != _undefined) '_in': ($_in as List<Enum$ENUM_ROLE_enum>?),
        if ($_is_null != _undefined) '_is_null': ($_is_null as bool?),
        if ($_neq != _undefined) '_neq': ($_neq as Enum$ENUM_ROLE_enum?),
        if ($_nin != _undefined) '_nin': ($_nin as List<Enum$ENUM_ROLE_enum>?),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_enum_comparison_exp<TRes>
    implements CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_enum_comparison_exp(this._res);

  TRes _res;

  call({
    Enum$ENUM_ROLE_enum? $_eq,
    List<Enum$ENUM_ROLE_enum>? $_in,
    bool? $_is_null,
    Enum$ENUM_ROLE_enum? $_neq,
    List<Enum$ENUM_ROLE_enum>? $_nin,
  }) =>
      _res;
}

class Input$ENUM_ROLE_insert_input {
  factory Input$ENUM_ROLE_insert_input({
    String? comment,
    String? value,
  }) =>
      Input$ENUM_ROLE_insert_input._({
        if (comment != null) r'comment': comment,
        if (value != null) r'value': value,
      });

  Input$ENUM_ROLE_insert_input._(this._$data);

  factory Input$ENUM_ROLE_insert_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Input$ENUM_ROLE_insert_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get comment => (_$data['comment'] as String?);
  String? get value => (_$data['value'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_insert_input<Input$ENUM_ROLE_insert_input>
      get copyWith => CopyWith$Input$ENUM_ROLE_insert_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_insert_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$comment = comment;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_insert_input<TRes> {
  factory CopyWith$Input$ENUM_ROLE_insert_input(
    Input$ENUM_ROLE_insert_input instance,
    TRes Function(Input$ENUM_ROLE_insert_input) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_insert_input;

  factory CopyWith$Input$ENUM_ROLE_insert_input.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_insert_input;

  TRes call({
    String? comment,
    String? value,
  });
}

class _CopyWithImpl$Input$ENUM_ROLE_insert_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_insert_input<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_insert_input(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_insert_input _instance;

  final TRes Function(Input$ENUM_ROLE_insert_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comment = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_insert_input._({
        ..._instance._$data,
        if (comment != _undefined) 'comment': (comment as String?),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_insert_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_insert_input<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_insert_input(this._res);

  TRes _res;

  call({
    String? comment,
    String? value,
  }) =>
      _res;
}

class Input$ENUM_ROLE_on_conflict {
  factory Input$ENUM_ROLE_on_conflict({
    required Enum$ENUM_ROLE_constraint constraint,
    required List<Enum$ENUM_ROLE_update_column> update_columns,
    Input$ENUM_ROLE_bool_exp? where,
  }) =>
      Input$ENUM_ROLE_on_conflict._({
        r'constraint': constraint,
        r'update_columns': update_columns,
        if (where != null) r'where': where,
      });

  Input$ENUM_ROLE_on_conflict._(this._$data);

  factory Input$ENUM_ROLE_on_conflict.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$constraint = data['constraint'];
    result$data['constraint'] =
        fromJson$Enum$ENUM_ROLE_constraint((l$constraint as String));
    final l$update_columns = data['update_columns'];
    result$data['update_columns'] = (l$update_columns as List<dynamic>)
        .map((e) => fromJson$Enum$ENUM_ROLE_update_column((e as String)))
        .toList();
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$ENUM_ROLE_bool_exp.fromJson(
              (l$where as Map<String, dynamic>));
    }
    return Input$ENUM_ROLE_on_conflict._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$ENUM_ROLE_constraint get constraint =>
      (_$data['constraint'] as Enum$ENUM_ROLE_constraint);
  List<Enum$ENUM_ROLE_update_column> get update_columns =>
      (_$data['update_columns'] as List<Enum$ENUM_ROLE_update_column>);
  Input$ENUM_ROLE_bool_exp? get where =>
      (_$data['where'] as Input$ENUM_ROLE_bool_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$constraint = constraint;
    result$data['constraint'] = toJson$Enum$ENUM_ROLE_constraint(l$constraint);
    final l$update_columns = update_columns;
    result$data['update_columns'] = l$update_columns
        .map((e) => toJson$Enum$ENUM_ROLE_update_column(e))
        .toList();
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_on_conflict<Input$ENUM_ROLE_on_conflict>
      get copyWith => CopyWith$Input$ENUM_ROLE_on_conflict(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_on_conflict) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$constraint = constraint;
    final lOther$constraint = other.constraint;
    if (l$constraint != lOther$constraint) {
      return false;
    }
    final l$update_columns = update_columns;
    final lOther$update_columns = other.update_columns;
    if (l$update_columns.length != lOther$update_columns.length) {
      return false;
    }
    for (int i = 0; i < l$update_columns.length; i++) {
      final l$update_columns$entry = l$update_columns[i];
      final lOther$update_columns$entry = lOther$update_columns[i];
      if (l$update_columns$entry != lOther$update_columns$entry) {
        return false;
      }
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$constraint = constraint;
    final l$update_columns = update_columns;
    final l$where = where;
    return Object.hashAll([
      l$constraint,
      Object.hashAll(l$update_columns.map((v) => v)),
      _$data.containsKey('where') ? l$where : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_on_conflict<TRes> {
  factory CopyWith$Input$ENUM_ROLE_on_conflict(
    Input$ENUM_ROLE_on_conflict instance,
    TRes Function(Input$ENUM_ROLE_on_conflict) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_on_conflict;

  factory CopyWith$Input$ENUM_ROLE_on_conflict.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_on_conflict;

  TRes call({
    Enum$ENUM_ROLE_constraint? constraint,
    List<Enum$ENUM_ROLE_update_column>? update_columns,
    Input$ENUM_ROLE_bool_exp? where,
  });
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$ENUM_ROLE_on_conflict<TRes>
    implements CopyWith$Input$ENUM_ROLE_on_conflict<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_on_conflict(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_on_conflict _instance;

  final TRes Function(Input$ENUM_ROLE_on_conflict) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? constraint = _undefined,
    Object? update_columns = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_on_conflict._({
        ..._instance._$data,
        if (constraint != _undefined && constraint != null)
          'constraint': (constraint as Enum$ENUM_ROLE_constraint),
        if (update_columns != _undefined && update_columns != null)
          'update_columns':
              (update_columns as List<Enum$ENUM_ROLE_update_column>),
        if (where != _undefined) 'where': (where as Input$ENUM_ROLE_bool_exp?),
      }));
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return local$where == null
        ? CopyWith$Input$ENUM_ROLE_bool_exp.stub(_then(_instance))
        : CopyWith$Input$ENUM_ROLE_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$ENUM_ROLE_on_conflict<TRes>
    implements CopyWith$Input$ENUM_ROLE_on_conflict<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_on_conflict(this._res);

  TRes _res;

  call({
    Enum$ENUM_ROLE_constraint? constraint,
    List<Enum$ENUM_ROLE_update_column>? update_columns,
    Input$ENUM_ROLE_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where =>
      CopyWith$Input$ENUM_ROLE_bool_exp.stub(_res);
}

class Input$ENUM_ROLE_order_by {
  factory Input$ENUM_ROLE_order_by({
    Enum$order_by? comment,
    Enum$order_by? value,
  }) =>
      Input$ENUM_ROLE_order_by._({
        if (comment != null) r'comment': comment,
        if (value != null) r'value': value,
      });

  Input$ENUM_ROLE_order_by._(this._$data);

  factory Input$ENUM_ROLE_order_by.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = l$comment == null
          ? null
          : fromJson$Enum$order_by((l$comment as String));
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] =
          l$value == null ? null : fromJson$Enum$order_by((l$value as String));
    }
    return Input$ENUM_ROLE_order_by._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$order_by? get comment => (_$data['comment'] as Enum$order_by?);
  Enum$order_by? get value => (_$data['value'] as Enum$order_by?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] =
          l$comment == null ? null : toJson$Enum$order_by(l$comment);
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] =
          l$value == null ? null : toJson$Enum$order_by(l$value);
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_order_by<Input$ENUM_ROLE_order_by> get copyWith =>
      CopyWith$Input$ENUM_ROLE_order_by(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_order_by) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$comment = comment;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_order_by<TRes> {
  factory CopyWith$Input$ENUM_ROLE_order_by(
    Input$ENUM_ROLE_order_by instance,
    TRes Function(Input$ENUM_ROLE_order_by) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_order_by;

  factory CopyWith$Input$ENUM_ROLE_order_by.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_order_by;

  TRes call({
    Enum$order_by? comment,
    Enum$order_by? value,
  });
}

class _CopyWithImpl$Input$ENUM_ROLE_order_by<TRes>
    implements CopyWith$Input$ENUM_ROLE_order_by<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_order_by(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_order_by _instance;

  final TRes Function(Input$ENUM_ROLE_order_by) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comment = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_order_by._({
        ..._instance._$data,
        if (comment != _undefined) 'comment': (comment as Enum$order_by?),
        if (value != _undefined) 'value': (value as Enum$order_by?),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_order_by<TRes>
    implements CopyWith$Input$ENUM_ROLE_order_by<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_order_by(this._res);

  TRes _res;

  call({
    Enum$order_by? comment,
    Enum$order_by? value,
  }) =>
      _res;
}

class Input$ENUM_ROLE_pk_columns_input {
  factory Input$ENUM_ROLE_pk_columns_input({required String value}) =>
      Input$ENUM_ROLE_pk_columns_input._({
        r'value': value,
      });

  Input$ENUM_ROLE_pk_columns_input._(this._$data);

  factory Input$ENUM_ROLE_pk_columns_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$value = data['value'];
    result$data['value'] = (l$value as String);
    return Input$ENUM_ROLE_pk_columns_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String get value => (_$data['value'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$value = value;
    result$data['value'] = l$value;
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_pk_columns_input<Input$ENUM_ROLE_pk_columns_input>
      get copyWith => CopyWith$Input$ENUM_ROLE_pk_columns_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_pk_columns_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$value = value;
    return Object.hashAll([l$value]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_pk_columns_input<TRes> {
  factory CopyWith$Input$ENUM_ROLE_pk_columns_input(
    Input$ENUM_ROLE_pk_columns_input instance,
    TRes Function(Input$ENUM_ROLE_pk_columns_input) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_pk_columns_input;

  factory CopyWith$Input$ENUM_ROLE_pk_columns_input.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_pk_columns_input;

  TRes call({String? value});
}

class _CopyWithImpl$Input$ENUM_ROLE_pk_columns_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_pk_columns_input<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_pk_columns_input(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_pk_columns_input _instance;

  final TRes Function(Input$ENUM_ROLE_pk_columns_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? value = _undefined}) =>
      _then(Input$ENUM_ROLE_pk_columns_input._({
        ..._instance._$data,
        if (value != _undefined && value != null) 'value': (value as String),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_pk_columns_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_pk_columns_input<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_pk_columns_input(this._res);

  TRes _res;

  call({String? value}) => _res;
}

class Input$ENUM_ROLE_set_input {
  factory Input$ENUM_ROLE_set_input({
    String? comment,
    String? value,
  }) =>
      Input$ENUM_ROLE_set_input._({
        if (comment != null) r'comment': comment,
        if (value != null) r'value': value,
      });

  Input$ENUM_ROLE_set_input._(this._$data);

  factory Input$ENUM_ROLE_set_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Input$ENUM_ROLE_set_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get comment => (_$data['comment'] as String?);
  String? get value => (_$data['value'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_set_input<Input$ENUM_ROLE_set_input> get copyWith =>
      CopyWith$Input$ENUM_ROLE_set_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_set_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$comment = comment;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_set_input<TRes> {
  factory CopyWith$Input$ENUM_ROLE_set_input(
    Input$ENUM_ROLE_set_input instance,
    TRes Function(Input$ENUM_ROLE_set_input) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_set_input;

  factory CopyWith$Input$ENUM_ROLE_set_input.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_set_input;

  TRes call({
    String? comment,
    String? value,
  });
}

class _CopyWithImpl$Input$ENUM_ROLE_set_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_set_input<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_set_input(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_set_input _instance;

  final TRes Function(Input$ENUM_ROLE_set_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comment = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_set_input._({
        ..._instance._$data,
        if (comment != _undefined) 'comment': (comment as String?),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_set_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_set_input<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_set_input(this._res);

  TRes _res;

  call({
    String? comment,
    String? value,
  }) =>
      _res;
}

class Input$ENUM_ROLE_stream_cursor_input {
  factory Input$ENUM_ROLE_stream_cursor_input({
    required Input$ENUM_ROLE_stream_cursor_value_input initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      Input$ENUM_ROLE_stream_cursor_input._({
        r'initial_value': initial_value,
        if (ordering != null) r'ordering': ordering,
      });

  Input$ENUM_ROLE_stream_cursor_input._(this._$data);

  factory Input$ENUM_ROLE_stream_cursor_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$initial_value = data['initial_value'];
    result$data['initial_value'] =
        Input$ENUM_ROLE_stream_cursor_value_input.fromJson(
            (l$initial_value as Map<String, dynamic>));
    if (data.containsKey('ordering')) {
      final l$ordering = data['ordering'];
      result$data['ordering'] = l$ordering == null
          ? null
          : fromJson$Enum$cursor_ordering((l$ordering as String));
    }
    return Input$ENUM_ROLE_stream_cursor_input._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ENUM_ROLE_stream_cursor_value_input get initial_value =>
      (_$data['initial_value'] as Input$ENUM_ROLE_stream_cursor_value_input);
  Enum$cursor_ordering? get ordering =>
      (_$data['ordering'] as Enum$cursor_ordering?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$initial_value = initial_value;
    result$data['initial_value'] = l$initial_value.toJson();
    if (_$data.containsKey('ordering')) {
      final l$ordering = ordering;
      result$data['ordering'] =
          l$ordering == null ? null : toJson$Enum$cursor_ordering(l$ordering);
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_stream_cursor_input<
          Input$ENUM_ROLE_stream_cursor_input>
      get copyWith => CopyWith$Input$ENUM_ROLE_stream_cursor_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_stream_cursor_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initial_value = initial_value;
    final lOther$initial_value = other.initial_value;
    if (l$initial_value != lOther$initial_value) {
      return false;
    }
    final l$ordering = ordering;
    final lOther$ordering = other.ordering;
    if (_$data.containsKey('ordering') !=
        other._$data.containsKey('ordering')) {
      return false;
    }
    if (l$ordering != lOther$ordering) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$initial_value = initial_value;
    final l$ordering = ordering;
    return Object.hashAll([
      l$initial_value,
      _$data.containsKey('ordering') ? l$ordering : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_stream_cursor_input<TRes> {
  factory CopyWith$Input$ENUM_ROLE_stream_cursor_input(
    Input$ENUM_ROLE_stream_cursor_input instance,
    TRes Function(Input$ENUM_ROLE_stream_cursor_input) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_input;

  factory CopyWith$Input$ENUM_ROLE_stream_cursor_input.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_input;

  TRes call({
    Input$ENUM_ROLE_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  });
  CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> get initial_value;
}

class _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_stream_cursor_input<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_input(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_stream_cursor_input _instance;

  final TRes Function(Input$ENUM_ROLE_stream_cursor_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initial_value = _undefined,
    Object? ordering = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_stream_cursor_input._({
        ..._instance._$data,
        if (initial_value != _undefined && initial_value != null)
          'initial_value':
              (initial_value as Input$ENUM_ROLE_stream_cursor_value_input),
        if (ordering != _undefined)
          'ordering': (ordering as Enum$cursor_ordering?),
      }));
  CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> get initial_value {
    final local$initial_value = _instance.initial_value;
    return CopyWith$Input$ENUM_ROLE_stream_cursor_value_input(
        local$initial_value, (e) => call(initial_value: e));
  }
}

class _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_stream_cursor_input<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_input(this._res);

  TRes _res;

  call({
    Input$ENUM_ROLE_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      _res;
  CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> get initial_value =>
      CopyWith$Input$ENUM_ROLE_stream_cursor_value_input.stub(_res);
}

class Input$ENUM_ROLE_stream_cursor_value_input {
  factory Input$ENUM_ROLE_stream_cursor_value_input({
    String? comment,
    String? value,
  }) =>
      Input$ENUM_ROLE_stream_cursor_value_input._({
        if (comment != null) r'comment': comment,
        if (value != null) r'value': value,
      });

  Input$ENUM_ROLE_stream_cursor_value_input._(this._$data);

  factory Input$ENUM_ROLE_stream_cursor_value_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('comment')) {
      final l$comment = data['comment'];
      result$data['comment'] = (l$comment as String?);
    }
    if (data.containsKey('value')) {
      final l$value = data['value'];
      result$data['value'] = (l$value as String?);
    }
    return Input$ENUM_ROLE_stream_cursor_value_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get comment => (_$data['comment'] as String?);
  String? get value => (_$data['value'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('comment')) {
      final l$comment = comment;
      result$data['comment'] = l$comment;
    }
    if (_$data.containsKey('value')) {
      final l$value = value;
      result$data['value'] = l$value;
    }
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<
          Input$ENUM_ROLE_stream_cursor_value_input>
      get copyWith => CopyWith$Input$ENUM_ROLE_stream_cursor_value_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_stream_cursor_value_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$comment = comment;
    final lOther$comment = other.comment;
    if (_$data.containsKey('comment') != other._$data.containsKey('comment')) {
      return false;
    }
    if (l$comment != lOther$comment) {
      return false;
    }
    final l$value = value;
    final lOther$value = other.value;
    if (_$data.containsKey('value') != other._$data.containsKey('value')) {
      return false;
    }
    if (l$value != lOther$value) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$comment = comment;
    final l$value = value;
    return Object.hashAll([
      _$data.containsKey('comment') ? l$comment : const {},
      _$data.containsKey('value') ? l$value : const {},
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> {
  factory CopyWith$Input$ENUM_ROLE_stream_cursor_value_input(
    Input$ENUM_ROLE_stream_cursor_value_input instance,
    TRes Function(Input$ENUM_ROLE_stream_cursor_value_input) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_value_input;

  factory CopyWith$Input$ENUM_ROLE_stream_cursor_value_input.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_value_input;

  TRes call({
    String? comment,
    String? value,
  });
}

class _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_value_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_stream_cursor_value_input(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_stream_cursor_value_input _instance;

  final TRes Function(Input$ENUM_ROLE_stream_cursor_value_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? comment = _undefined,
    Object? value = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_stream_cursor_value_input._({
        ..._instance._$data,
        if (comment != _undefined) 'comment': (comment as String?),
        if (value != _undefined) 'value': (value as String?),
      }));
}

class _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_value_input<TRes>
    implements CopyWith$Input$ENUM_ROLE_stream_cursor_value_input<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_stream_cursor_value_input(this._res);

  TRes _res;

  call({
    String? comment,
    String? value,
  }) =>
      _res;
}

class Input$ENUM_ROLE_updates {
  factory Input$ENUM_ROLE_updates({
    Input$ENUM_ROLE_set_input? $_set,
    required Input$ENUM_ROLE_bool_exp where,
  }) =>
      Input$ENUM_ROLE_updates._({
        if ($_set != null) r'_set': $_set,
        r'where': where,
      });

  Input$ENUM_ROLE_updates._(this._$data);

  factory Input$ENUM_ROLE_updates.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_set')) {
      final l$$_set = data['_set'];
      result$data['_set'] = l$$_set == null
          ? null
          : Input$ENUM_ROLE_set_input.fromJson(
              (l$$_set as Map<String, dynamic>));
    }
    final l$where = data['where'];
    result$data['where'] =
        Input$ENUM_ROLE_bool_exp.fromJson((l$where as Map<String, dynamic>));
    return Input$ENUM_ROLE_updates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ENUM_ROLE_set_input? get $_set =>
      (_$data['_set'] as Input$ENUM_ROLE_set_input?);
  Input$ENUM_ROLE_bool_exp get where =>
      (_$data['where'] as Input$ENUM_ROLE_bool_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_set')) {
      final l$$_set = $_set;
      result$data['_set'] = l$$_set?.toJson();
    }
    final l$where = where;
    result$data['where'] = l$where.toJson();
    return result$data;
  }

  CopyWith$Input$ENUM_ROLE_updates<Input$ENUM_ROLE_updates> get copyWith =>
      CopyWith$Input$ENUM_ROLE_updates(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ENUM_ROLE_updates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_set = $_set;
    final lOther$$_set = other.$_set;
    if (_$data.containsKey('_set') != other._$data.containsKey('_set')) {
      return false;
    }
    if (l$$_set != lOther$$_set) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_set = $_set;
    final l$where = where;
    return Object.hashAll([
      _$data.containsKey('_set') ? l$$_set : const {},
      l$where,
    ]);
  }
}

abstract class CopyWith$Input$ENUM_ROLE_updates<TRes> {
  factory CopyWith$Input$ENUM_ROLE_updates(
    Input$ENUM_ROLE_updates instance,
    TRes Function(Input$ENUM_ROLE_updates) then,
  ) = _CopyWithImpl$Input$ENUM_ROLE_updates;

  factory CopyWith$Input$ENUM_ROLE_updates.stub(TRes res) =
      _CopyWithStubImpl$Input$ENUM_ROLE_updates;

  TRes call({
    Input$ENUM_ROLE_set_input? $_set,
    Input$ENUM_ROLE_bool_exp? where,
  });
  CopyWith$Input$ENUM_ROLE_set_input<TRes> get $_set;
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$ENUM_ROLE_updates<TRes>
    implements CopyWith$Input$ENUM_ROLE_updates<TRes> {
  _CopyWithImpl$Input$ENUM_ROLE_updates(
    this._instance,
    this._then,
  );

  final Input$ENUM_ROLE_updates _instance;

  final TRes Function(Input$ENUM_ROLE_updates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_set = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$ENUM_ROLE_updates._({
        ..._instance._$data,
        if ($_set != _undefined) '_set': ($_set as Input$ENUM_ROLE_set_input?),
        if (where != _undefined && where != null)
          'where': (where as Input$ENUM_ROLE_bool_exp),
      }));
  CopyWith$Input$ENUM_ROLE_set_input<TRes> get $_set {
    final local$$_set = _instance.$_set;
    return local$$_set == null
        ? CopyWith$Input$ENUM_ROLE_set_input.stub(_then(_instance))
        : CopyWith$Input$ENUM_ROLE_set_input(
            local$$_set, (e) => call($_set: e));
  }

  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return CopyWith$Input$ENUM_ROLE_bool_exp(
        local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$ENUM_ROLE_updates<TRes>
    implements CopyWith$Input$ENUM_ROLE_updates<TRes> {
  _CopyWithStubImpl$Input$ENUM_ROLE_updates(this._res);

  TRes _res;

  call({
    Input$ENUM_ROLE_set_input? $_set,
    Input$ENUM_ROLE_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$ENUM_ROLE_set_input<TRes> get $_set =>
      CopyWith$Input$ENUM_ROLE_set_input.stub(_res);
  CopyWith$Input$ENUM_ROLE_bool_exp<TRes> get where =>
      CopyWith$Input$ENUM_ROLE_bool_exp.stub(_res);
}

class Input$Int_comparison_exp {
  factory Input$Int_comparison_exp({
    int? $_eq,
    int? $_gt,
    int? $_gte,
    List<int>? $_in,
    bool? $_is_null,
    int? $_lt,
    int? $_lte,
    int? $_neq,
    List<int>? $_nin,
  }) =>
      Input$Int_comparison_exp._({
        if ($_eq != null) r'_eq': $_eq,
        if ($_gt != null) r'_gt': $_gt,
        if ($_gte != null) r'_gte': $_gte,
        if ($_in != null) r'_in': $_in,
        if ($_is_null != null) r'_is_null': $_is_null,
        if ($_lt != null) r'_lt': $_lt,
        if ($_lte != null) r'_lte': $_lte,
        if ($_neq != null) r'_neq': $_neq,
        if ($_nin != null) r'_nin': $_nin,
      });

  Input$Int_comparison_exp._(this._$data);

  factory Input$Int_comparison_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as int?);
    }
    if (data.containsKey('_gt')) {
      final l$$_gt = data['_gt'];
      result$data['_gt'] = (l$$_gt as int?);
    }
    if (data.containsKey('_gte')) {
      final l$$_gte = data['_gte'];
      result$data['_gte'] = (l$$_gte as int?);
    }
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] =
          (l$$_in as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    if (data.containsKey('_is_null')) {
      final l$$_is_null = data['_is_null'];
      result$data['_is_null'] = (l$$_is_null as bool?);
    }
    if (data.containsKey('_lt')) {
      final l$$_lt = data['_lt'];
      result$data['_lt'] = (l$$_lt as int?);
    }
    if (data.containsKey('_lte')) {
      final l$$_lte = data['_lte'];
      result$data['_lte'] = (l$$_lte as int?);
    }
    if (data.containsKey('_neq')) {
      final l$$_neq = data['_neq'];
      result$data['_neq'] = (l$$_neq as int?);
    }
    if (data.containsKey('_nin')) {
      final l$$_nin = data['_nin'];
      result$data['_nin'] =
          (l$$_nin as List<dynamic>?)?.map((e) => (e as int)).toList();
    }
    return Input$Int_comparison_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get $_eq => (_$data['_eq'] as int?);
  int? get $_gt => (_$data['_gt'] as int?);
  int? get $_gte => (_$data['_gte'] as int?);
  List<int>? get $_in => (_$data['_in'] as List<int>?);
  bool? get $_is_null => (_$data['_is_null'] as bool?);
  int? get $_lt => (_$data['_lt'] as int?);
  int? get $_lte => (_$data['_lte'] as int?);
  int? get $_neq => (_$data['_neq'] as int?);
  List<int>? get $_nin => (_$data['_nin'] as List<int>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    if (_$data.containsKey('_gt')) {
      final l$$_gt = $_gt;
      result$data['_gt'] = l$$_gt;
    }
    if (_$data.containsKey('_gte')) {
      final l$$_gte = $_gte;
      result$data['_gte'] = l$$_gte;
    }
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] = l$$_in?.map((e) => e).toList();
    }
    if (_$data.containsKey('_is_null')) {
      final l$$_is_null = $_is_null;
      result$data['_is_null'] = l$$_is_null;
    }
    if (_$data.containsKey('_lt')) {
      final l$$_lt = $_lt;
      result$data['_lt'] = l$$_lt;
    }
    if (_$data.containsKey('_lte')) {
      final l$$_lte = $_lte;
      result$data['_lte'] = l$$_lte;
    }
    if (_$data.containsKey('_neq')) {
      final l$$_neq = $_neq;
      result$data['_neq'] = l$$_neq;
    }
    if (_$data.containsKey('_nin')) {
      final l$$_nin = $_nin;
      result$data['_nin'] = l$$_nin?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$Int_comparison_exp<Input$Int_comparison_exp> get copyWith =>
      CopyWith$Input$Int_comparison_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$Int_comparison_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    final l$$_gt = $_gt;
    final lOther$$_gt = other.$_gt;
    if (_$data.containsKey('_gt') != other._$data.containsKey('_gt')) {
      return false;
    }
    if (l$$_gt != lOther$$_gt) {
      return false;
    }
    final l$$_gte = $_gte;
    final lOther$$_gte = other.$_gte;
    if (_$data.containsKey('_gte') != other._$data.containsKey('_gte')) {
      return false;
    }
    if (l$$_gte != lOther$$_gte) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    final l$$_is_null = $_is_null;
    final lOther$$_is_null = other.$_is_null;
    if (_$data.containsKey('_is_null') !=
        other._$data.containsKey('_is_null')) {
      return false;
    }
    if (l$$_is_null != lOther$$_is_null) {
      return false;
    }
    final l$$_lt = $_lt;
    final lOther$$_lt = other.$_lt;
    if (_$data.containsKey('_lt') != other._$data.containsKey('_lt')) {
      return false;
    }
    if (l$$_lt != lOther$$_lt) {
      return false;
    }
    final l$$_lte = $_lte;
    final lOther$$_lte = other.$_lte;
    if (_$data.containsKey('_lte') != other._$data.containsKey('_lte')) {
      return false;
    }
    if (l$$_lte != lOther$$_lte) {
      return false;
    }
    final l$$_neq = $_neq;
    final lOther$$_neq = other.$_neq;
    if (_$data.containsKey('_neq') != other._$data.containsKey('_neq')) {
      return false;
    }
    if (l$$_neq != lOther$$_neq) {
      return false;
    }
    final l$$_nin = $_nin;
    final lOther$$_nin = other.$_nin;
    if (_$data.containsKey('_nin') != other._$data.containsKey('_nin')) {
      return false;
    }
    if (l$$_nin != null && lOther$$_nin != null) {
      if (l$$_nin.length != lOther$$_nin.length) {
        return false;
      }
      for (int i = 0; i < l$$_nin.length; i++) {
        final l$$_nin$entry = l$$_nin[i];
        final lOther$$_nin$entry = lOther$$_nin[i];
        if (l$$_nin$entry != lOther$$_nin$entry) {
          return false;
        }
      }
    } else if (l$$_nin != lOther$$_nin) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    final l$$_gt = $_gt;
    final l$$_gte = $_gte;
    final l$$_in = $_in;
    final l$$_is_null = $_is_null;
    final l$$_lt = $_lt;
    final l$$_lte = $_lte;
    final l$$_neq = $_neq;
    final l$$_nin = $_nin;
    return Object.hashAll([
      _$data.containsKey('_eq') ? l$$_eq : const {},
      _$data.containsKey('_gt') ? l$$_gt : const {},
      _$data.containsKey('_gte') ? l$$_gte : const {},
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {},
      _$data.containsKey('_is_null') ? l$$_is_null : const {},
      _$data.containsKey('_lt') ? l$$_lt : const {},
      _$data.containsKey('_lte') ? l$$_lte : const {},
      _$data.containsKey('_neq') ? l$$_neq : const {},
      _$data.containsKey('_nin')
          ? l$$_nin == null
              ? null
              : Object.hashAll(l$$_nin.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$Int_comparison_exp<TRes> {
  factory CopyWith$Input$Int_comparison_exp(
    Input$Int_comparison_exp instance,
    TRes Function(Input$Int_comparison_exp) then,
  ) = _CopyWithImpl$Input$Int_comparison_exp;

  factory CopyWith$Input$Int_comparison_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$Int_comparison_exp;

  TRes call({
    int? $_eq,
    int? $_gt,
    int? $_gte,
    List<int>? $_in,
    bool? $_is_null,
    int? $_lt,
    int? $_lte,
    int? $_neq,
    List<int>? $_nin,
  });
}

class _CopyWithImpl$Input$Int_comparison_exp<TRes>
    implements CopyWith$Input$Int_comparison_exp<TRes> {
  _CopyWithImpl$Input$Int_comparison_exp(
    this._instance,
    this._then,
  );

  final Input$Int_comparison_exp _instance;

  final TRes Function(Input$Int_comparison_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_eq = _undefined,
    Object? $_gt = _undefined,
    Object? $_gte = _undefined,
    Object? $_in = _undefined,
    Object? $_is_null = _undefined,
    Object? $_lt = _undefined,
    Object? $_lte = _undefined,
    Object? $_neq = _undefined,
    Object? $_nin = _undefined,
  }) =>
      _then(Input$Int_comparison_exp._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as int?),
        if ($_gt != _undefined) '_gt': ($_gt as int?),
        if ($_gte != _undefined) '_gte': ($_gte as int?),
        if ($_in != _undefined) '_in': ($_in as List<int>?),
        if ($_is_null != _undefined) '_is_null': ($_is_null as bool?),
        if ($_lt != _undefined) '_lt': ($_lt as int?),
        if ($_lte != _undefined) '_lte': ($_lte as int?),
        if ($_neq != _undefined) '_neq': ($_neq as int?),
        if ($_nin != _undefined) '_nin': ($_nin as List<int>?),
      }));
}

class _CopyWithStubImpl$Input$Int_comparison_exp<TRes>
    implements CopyWith$Input$Int_comparison_exp<TRes> {
  _CopyWithStubImpl$Input$Int_comparison_exp(this._res);

  TRes _res;

  call({
    int? $_eq,
    int? $_gt,
    int? $_gte,
    List<int>? $_in,
    bool? $_is_null,
    int? $_lt,
    int? $_lte,
    int? $_neq,
    List<int>? $_nin,
  }) =>
      _res;
}

class Input$String_comparison_exp {
  factory Input$String_comparison_exp({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    String? $_ilike,
    List<String>? $_in,
    String? $_iregex,
    bool? $_is_null,
    String? $_like,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    String? $_nilike,
    List<String>? $_nin,
    String? $_niregex,
    String? $_nlike,
    String? $_nregex,
    String? $_nsimilar,
    String? $_regex,
    String? $_similar,
  }) =>
      Input$String_comparison_exp._({
        if ($_eq != null) r'_eq': $_eq,
        if ($_gt != null) r'_gt': $_gt,
        if ($_gte != null) r'_gte': $_gte,
        if ($_ilike != null) r'_ilike': $_ilike,
        if ($_in != null) r'_in': $_in,
        if ($_iregex != null) r'_iregex': $_iregex,
        if ($_is_null != null) r'_is_null': $_is_null,
        if ($_like != null) r'_like': $_like,
        if ($_lt != null) r'_lt': $_lt,
        if ($_lte != null) r'_lte': $_lte,
        if ($_neq != null) r'_neq': $_neq,
        if ($_nilike != null) r'_nilike': $_nilike,
        if ($_nin != null) r'_nin': $_nin,
        if ($_niregex != null) r'_niregex': $_niregex,
        if ($_nlike != null) r'_nlike': $_nlike,
        if ($_nregex != null) r'_nregex': $_nregex,
        if ($_nsimilar != null) r'_nsimilar': $_nsimilar,
        if ($_regex != null) r'_regex': $_regex,
        if ($_similar != null) r'_similar': $_similar,
      });

  Input$String_comparison_exp._(this._$data);

  factory Input$String_comparison_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as String?);
    }
    if (data.containsKey('_gt')) {
      final l$$_gt = data['_gt'];
      result$data['_gt'] = (l$$_gt as String?);
    }
    if (data.containsKey('_gte')) {
      final l$$_gte = data['_gte'];
      result$data['_gte'] = (l$$_gte as String?);
    }
    if (data.containsKey('_ilike')) {
      final l$$_ilike = data['_ilike'];
      result$data['_ilike'] = (l$$_ilike as String?);
    }
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] =
          (l$$_in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('_iregex')) {
      final l$$_iregex = data['_iregex'];
      result$data['_iregex'] = (l$$_iregex as String?);
    }
    if (data.containsKey('_is_null')) {
      final l$$_is_null = data['_is_null'];
      result$data['_is_null'] = (l$$_is_null as bool?);
    }
    if (data.containsKey('_like')) {
      final l$$_like = data['_like'];
      result$data['_like'] = (l$$_like as String?);
    }
    if (data.containsKey('_lt')) {
      final l$$_lt = data['_lt'];
      result$data['_lt'] = (l$$_lt as String?);
    }
    if (data.containsKey('_lte')) {
      final l$$_lte = data['_lte'];
      result$data['_lte'] = (l$$_lte as String?);
    }
    if (data.containsKey('_neq')) {
      final l$$_neq = data['_neq'];
      result$data['_neq'] = (l$$_neq as String?);
    }
    if (data.containsKey('_nilike')) {
      final l$$_nilike = data['_nilike'];
      result$data['_nilike'] = (l$$_nilike as String?);
    }
    if (data.containsKey('_nin')) {
      final l$$_nin = data['_nin'];
      result$data['_nin'] =
          (l$$_nin as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('_niregex')) {
      final l$$_niregex = data['_niregex'];
      result$data['_niregex'] = (l$$_niregex as String?);
    }
    if (data.containsKey('_nlike')) {
      final l$$_nlike = data['_nlike'];
      result$data['_nlike'] = (l$$_nlike as String?);
    }
    if (data.containsKey('_nregex')) {
      final l$$_nregex = data['_nregex'];
      result$data['_nregex'] = (l$$_nregex as String?);
    }
    if (data.containsKey('_nsimilar')) {
      final l$$_nsimilar = data['_nsimilar'];
      result$data['_nsimilar'] = (l$$_nsimilar as String?);
    }
    if (data.containsKey('_regex')) {
      final l$$_regex = data['_regex'];
      result$data['_regex'] = (l$$_regex as String?);
    }
    if (data.containsKey('_similar')) {
      final l$$_similar = data['_similar'];
      result$data['_similar'] = (l$$_similar as String?);
    }
    return Input$String_comparison_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get $_eq => (_$data['_eq'] as String?);
  String? get $_gt => (_$data['_gt'] as String?);
  String? get $_gte => (_$data['_gte'] as String?);
  String? get $_ilike => (_$data['_ilike'] as String?);
  List<String>? get $_in => (_$data['_in'] as List<String>?);
  String? get $_iregex => (_$data['_iregex'] as String?);
  bool? get $_is_null => (_$data['_is_null'] as bool?);
  String? get $_like => (_$data['_like'] as String?);
  String? get $_lt => (_$data['_lt'] as String?);
  String? get $_lte => (_$data['_lte'] as String?);
  String? get $_neq => (_$data['_neq'] as String?);
  String? get $_nilike => (_$data['_nilike'] as String?);
  List<String>? get $_nin => (_$data['_nin'] as List<String>?);
  String? get $_niregex => (_$data['_niregex'] as String?);
  String? get $_nlike => (_$data['_nlike'] as String?);
  String? get $_nregex => (_$data['_nregex'] as String?);
  String? get $_nsimilar => (_$data['_nsimilar'] as String?);
  String? get $_regex => (_$data['_regex'] as String?);
  String? get $_similar => (_$data['_similar'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    if (_$data.containsKey('_gt')) {
      final l$$_gt = $_gt;
      result$data['_gt'] = l$$_gt;
    }
    if (_$data.containsKey('_gte')) {
      final l$$_gte = $_gte;
      result$data['_gte'] = l$$_gte;
    }
    if (_$data.containsKey('_ilike')) {
      final l$$_ilike = $_ilike;
      result$data['_ilike'] = l$$_ilike;
    }
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] = l$$_in?.map((e) => e).toList();
    }
    if (_$data.containsKey('_iregex')) {
      final l$$_iregex = $_iregex;
      result$data['_iregex'] = l$$_iregex;
    }
    if (_$data.containsKey('_is_null')) {
      final l$$_is_null = $_is_null;
      result$data['_is_null'] = l$$_is_null;
    }
    if (_$data.containsKey('_like')) {
      final l$$_like = $_like;
      result$data['_like'] = l$$_like;
    }
    if (_$data.containsKey('_lt')) {
      final l$$_lt = $_lt;
      result$data['_lt'] = l$$_lt;
    }
    if (_$data.containsKey('_lte')) {
      final l$$_lte = $_lte;
      result$data['_lte'] = l$$_lte;
    }
    if (_$data.containsKey('_neq')) {
      final l$$_neq = $_neq;
      result$data['_neq'] = l$$_neq;
    }
    if (_$data.containsKey('_nilike')) {
      final l$$_nilike = $_nilike;
      result$data['_nilike'] = l$$_nilike;
    }
    if (_$data.containsKey('_nin')) {
      final l$$_nin = $_nin;
      result$data['_nin'] = l$$_nin?.map((e) => e).toList();
    }
    if (_$data.containsKey('_niregex')) {
      final l$$_niregex = $_niregex;
      result$data['_niregex'] = l$$_niregex;
    }
    if (_$data.containsKey('_nlike')) {
      final l$$_nlike = $_nlike;
      result$data['_nlike'] = l$$_nlike;
    }
    if (_$data.containsKey('_nregex')) {
      final l$$_nregex = $_nregex;
      result$data['_nregex'] = l$$_nregex;
    }
    if (_$data.containsKey('_nsimilar')) {
      final l$$_nsimilar = $_nsimilar;
      result$data['_nsimilar'] = l$$_nsimilar;
    }
    if (_$data.containsKey('_regex')) {
      final l$$_regex = $_regex;
      result$data['_regex'] = l$$_regex;
    }
    if (_$data.containsKey('_similar')) {
      final l$$_similar = $_similar;
      result$data['_similar'] = l$$_similar;
    }
    return result$data;
  }

  CopyWith$Input$String_comparison_exp<Input$String_comparison_exp>
      get copyWith => CopyWith$Input$String_comparison_exp(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$String_comparison_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    final l$$_gt = $_gt;
    final lOther$$_gt = other.$_gt;
    if (_$data.containsKey('_gt') != other._$data.containsKey('_gt')) {
      return false;
    }
    if (l$$_gt != lOther$$_gt) {
      return false;
    }
    final l$$_gte = $_gte;
    final lOther$$_gte = other.$_gte;
    if (_$data.containsKey('_gte') != other._$data.containsKey('_gte')) {
      return false;
    }
    if (l$$_gte != lOther$$_gte) {
      return false;
    }
    final l$$_ilike = $_ilike;
    final lOther$$_ilike = other.$_ilike;
    if (_$data.containsKey('_ilike') != other._$data.containsKey('_ilike')) {
      return false;
    }
    if (l$$_ilike != lOther$$_ilike) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    final l$$_iregex = $_iregex;
    final lOther$$_iregex = other.$_iregex;
    if (_$data.containsKey('_iregex') != other._$data.containsKey('_iregex')) {
      return false;
    }
    if (l$$_iregex != lOther$$_iregex) {
      return false;
    }
    final l$$_is_null = $_is_null;
    final lOther$$_is_null = other.$_is_null;
    if (_$data.containsKey('_is_null') !=
        other._$data.containsKey('_is_null')) {
      return false;
    }
    if (l$$_is_null != lOther$$_is_null) {
      return false;
    }
    final l$$_like = $_like;
    final lOther$$_like = other.$_like;
    if (_$data.containsKey('_like') != other._$data.containsKey('_like')) {
      return false;
    }
    if (l$$_like != lOther$$_like) {
      return false;
    }
    final l$$_lt = $_lt;
    final lOther$$_lt = other.$_lt;
    if (_$data.containsKey('_lt') != other._$data.containsKey('_lt')) {
      return false;
    }
    if (l$$_lt != lOther$$_lt) {
      return false;
    }
    final l$$_lte = $_lte;
    final lOther$$_lte = other.$_lte;
    if (_$data.containsKey('_lte') != other._$data.containsKey('_lte')) {
      return false;
    }
    if (l$$_lte != lOther$$_lte) {
      return false;
    }
    final l$$_neq = $_neq;
    final lOther$$_neq = other.$_neq;
    if (_$data.containsKey('_neq') != other._$data.containsKey('_neq')) {
      return false;
    }
    if (l$$_neq != lOther$$_neq) {
      return false;
    }
    final l$$_nilike = $_nilike;
    final lOther$$_nilike = other.$_nilike;
    if (_$data.containsKey('_nilike') != other._$data.containsKey('_nilike')) {
      return false;
    }
    if (l$$_nilike != lOther$$_nilike) {
      return false;
    }
    final l$$_nin = $_nin;
    final lOther$$_nin = other.$_nin;
    if (_$data.containsKey('_nin') != other._$data.containsKey('_nin')) {
      return false;
    }
    if (l$$_nin != null && lOther$$_nin != null) {
      if (l$$_nin.length != lOther$$_nin.length) {
        return false;
      }
      for (int i = 0; i < l$$_nin.length; i++) {
        final l$$_nin$entry = l$$_nin[i];
        final lOther$$_nin$entry = lOther$$_nin[i];
        if (l$$_nin$entry != lOther$$_nin$entry) {
          return false;
        }
      }
    } else if (l$$_nin != lOther$$_nin) {
      return false;
    }
    final l$$_niregex = $_niregex;
    final lOther$$_niregex = other.$_niregex;
    if (_$data.containsKey('_niregex') !=
        other._$data.containsKey('_niregex')) {
      return false;
    }
    if (l$$_niregex != lOther$$_niregex) {
      return false;
    }
    final l$$_nlike = $_nlike;
    final lOther$$_nlike = other.$_nlike;
    if (_$data.containsKey('_nlike') != other._$data.containsKey('_nlike')) {
      return false;
    }
    if (l$$_nlike != lOther$$_nlike) {
      return false;
    }
    final l$$_nregex = $_nregex;
    final lOther$$_nregex = other.$_nregex;
    if (_$data.containsKey('_nregex') != other._$data.containsKey('_nregex')) {
      return false;
    }
    if (l$$_nregex != lOther$$_nregex) {
      return false;
    }
    final l$$_nsimilar = $_nsimilar;
    final lOther$$_nsimilar = other.$_nsimilar;
    if (_$data.containsKey('_nsimilar') !=
        other._$data.containsKey('_nsimilar')) {
      return false;
    }
    if (l$$_nsimilar != lOther$$_nsimilar) {
      return false;
    }
    final l$$_regex = $_regex;
    final lOther$$_regex = other.$_regex;
    if (_$data.containsKey('_regex') != other._$data.containsKey('_regex')) {
      return false;
    }
    if (l$$_regex != lOther$$_regex) {
      return false;
    }
    final l$$_similar = $_similar;
    final lOther$$_similar = other.$_similar;
    if (_$data.containsKey('_similar') !=
        other._$data.containsKey('_similar')) {
      return false;
    }
    if (l$$_similar != lOther$$_similar) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    final l$$_gt = $_gt;
    final l$$_gte = $_gte;
    final l$$_ilike = $_ilike;
    final l$$_in = $_in;
    final l$$_iregex = $_iregex;
    final l$$_is_null = $_is_null;
    final l$$_like = $_like;
    final l$$_lt = $_lt;
    final l$$_lte = $_lte;
    final l$$_neq = $_neq;
    final l$$_nilike = $_nilike;
    final l$$_nin = $_nin;
    final l$$_niregex = $_niregex;
    final l$$_nlike = $_nlike;
    final l$$_nregex = $_nregex;
    final l$$_nsimilar = $_nsimilar;
    final l$$_regex = $_regex;
    final l$$_similar = $_similar;
    return Object.hashAll([
      _$data.containsKey('_eq') ? l$$_eq : const {},
      _$data.containsKey('_gt') ? l$$_gt : const {},
      _$data.containsKey('_gte') ? l$$_gte : const {},
      _$data.containsKey('_ilike') ? l$$_ilike : const {},
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {},
      _$data.containsKey('_iregex') ? l$$_iregex : const {},
      _$data.containsKey('_is_null') ? l$$_is_null : const {},
      _$data.containsKey('_like') ? l$$_like : const {},
      _$data.containsKey('_lt') ? l$$_lt : const {},
      _$data.containsKey('_lte') ? l$$_lte : const {},
      _$data.containsKey('_neq') ? l$$_neq : const {},
      _$data.containsKey('_nilike') ? l$$_nilike : const {},
      _$data.containsKey('_nin')
          ? l$$_nin == null
              ? null
              : Object.hashAll(l$$_nin.map((v) => v))
          : const {},
      _$data.containsKey('_niregex') ? l$$_niregex : const {},
      _$data.containsKey('_nlike') ? l$$_nlike : const {},
      _$data.containsKey('_nregex') ? l$$_nregex : const {},
      _$data.containsKey('_nsimilar') ? l$$_nsimilar : const {},
      _$data.containsKey('_regex') ? l$$_regex : const {},
      _$data.containsKey('_similar') ? l$$_similar : const {},
    ]);
  }
}

abstract class CopyWith$Input$String_comparison_exp<TRes> {
  factory CopyWith$Input$String_comparison_exp(
    Input$String_comparison_exp instance,
    TRes Function(Input$String_comparison_exp) then,
  ) = _CopyWithImpl$Input$String_comparison_exp;

  factory CopyWith$Input$String_comparison_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$String_comparison_exp;

  TRes call({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    String? $_ilike,
    List<String>? $_in,
    String? $_iregex,
    bool? $_is_null,
    String? $_like,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    String? $_nilike,
    List<String>? $_nin,
    String? $_niregex,
    String? $_nlike,
    String? $_nregex,
    String? $_nsimilar,
    String? $_regex,
    String? $_similar,
  });
}

class _CopyWithImpl$Input$String_comparison_exp<TRes>
    implements CopyWith$Input$String_comparison_exp<TRes> {
  _CopyWithImpl$Input$String_comparison_exp(
    this._instance,
    this._then,
  );

  final Input$String_comparison_exp _instance;

  final TRes Function(Input$String_comparison_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_eq = _undefined,
    Object? $_gt = _undefined,
    Object? $_gte = _undefined,
    Object? $_ilike = _undefined,
    Object? $_in = _undefined,
    Object? $_iregex = _undefined,
    Object? $_is_null = _undefined,
    Object? $_like = _undefined,
    Object? $_lt = _undefined,
    Object? $_lte = _undefined,
    Object? $_neq = _undefined,
    Object? $_nilike = _undefined,
    Object? $_nin = _undefined,
    Object? $_niregex = _undefined,
    Object? $_nlike = _undefined,
    Object? $_nregex = _undefined,
    Object? $_nsimilar = _undefined,
    Object? $_regex = _undefined,
    Object? $_similar = _undefined,
  }) =>
      _then(Input$String_comparison_exp._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as String?),
        if ($_gt != _undefined) '_gt': ($_gt as String?),
        if ($_gte != _undefined) '_gte': ($_gte as String?),
        if ($_ilike != _undefined) '_ilike': ($_ilike as String?),
        if ($_in != _undefined) '_in': ($_in as List<String>?),
        if ($_iregex != _undefined) '_iregex': ($_iregex as String?),
        if ($_is_null != _undefined) '_is_null': ($_is_null as bool?),
        if ($_like != _undefined) '_like': ($_like as String?),
        if ($_lt != _undefined) '_lt': ($_lt as String?),
        if ($_lte != _undefined) '_lte': ($_lte as String?),
        if ($_neq != _undefined) '_neq': ($_neq as String?),
        if ($_nilike != _undefined) '_nilike': ($_nilike as String?),
        if ($_nin != _undefined) '_nin': ($_nin as List<String>?),
        if ($_niregex != _undefined) '_niregex': ($_niregex as String?),
        if ($_nlike != _undefined) '_nlike': ($_nlike as String?),
        if ($_nregex != _undefined) '_nregex': ($_nregex as String?),
        if ($_nsimilar != _undefined) '_nsimilar': ($_nsimilar as String?),
        if ($_regex != _undefined) '_regex': ($_regex as String?),
        if ($_similar != _undefined) '_similar': ($_similar as String?),
      }));
}

class _CopyWithStubImpl$Input$String_comparison_exp<TRes>
    implements CopyWith$Input$String_comparison_exp<TRes> {
  _CopyWithStubImpl$Input$String_comparison_exp(this._res);

  TRes _res;

  call({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    String? $_ilike,
    List<String>? $_in,
    String? $_iregex,
    bool? $_is_null,
    String? $_like,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    String? $_nilike,
    List<String>? $_nin,
    String? $_niregex,
    String? $_nlike,
    String? $_nregex,
    String? $_nsimilar,
    String? $_regex,
    String? $_similar,
  }) =>
      _res;
}

class Input$app_bool_exp {
  factory Input$app_bool_exp({
    List<Input$app_bool_exp>? $_and,
    Input$app_bool_exp? $_not,
    List<Input$app_bool_exp>? $_or,
    Input$String_comparison_exp? name,
    Input$String_comparison_exp? storage_bucket,
    Input$String_comparison_exp? version_latest,
    Input$String_comparison_exp? version_supported,
  }) =>
      Input$app_bool_exp._({
        if ($_and != null) r'_and': $_and,
        if ($_not != null) r'_not': $_not,
        if ($_or != null) r'_or': $_or,
        if (name != null) r'name': name,
        if (storage_bucket != null) r'storage_bucket': storage_bucket,
        if (version_latest != null) r'version_latest': version_latest,
        if (version_supported != null) r'version_supported': version_supported,
      });

  Input$app_bool_exp._(this._$data);

  factory Input$app_bool_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_and')) {
      final l$$_and = data['_and'];
      result$data['_and'] = (l$$_and as List<dynamic>?)
          ?.map((e) => Input$app_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('_not')) {
      final l$$_not = data['_not'];
      result$data['_not'] = l$$_not == null
          ? null
          : Input$app_bool_exp.fromJson((l$$_not as Map<String, dynamic>));
    }
    if (data.containsKey('_or')) {
      final l$$_or = data['_or'];
      result$data['_or'] = (l$$_or as List<dynamic>?)
          ?.map((e) => Input$app_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = l$name == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$name as Map<String, dynamic>));
    }
    if (data.containsKey('storage_bucket')) {
      final l$storage_bucket = data['storage_bucket'];
      result$data['storage_bucket'] = l$storage_bucket == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$storage_bucket as Map<String, dynamic>));
    }
    if (data.containsKey('version_latest')) {
      final l$version_latest = data['version_latest'];
      result$data['version_latest'] = l$version_latest == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$version_latest as Map<String, dynamic>));
    }
    if (data.containsKey('version_supported')) {
      final l$version_supported = data['version_supported'];
      result$data['version_supported'] = l$version_supported == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$version_supported as Map<String, dynamic>));
    }
    return Input$app_bool_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$app_bool_exp>? get $_and =>
      (_$data['_and'] as List<Input$app_bool_exp>?);
  Input$app_bool_exp? get $_not => (_$data['_not'] as Input$app_bool_exp?);
  List<Input$app_bool_exp>? get $_or =>
      (_$data['_or'] as List<Input$app_bool_exp>?);
  Input$String_comparison_exp? get name =>
      (_$data['name'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get storage_bucket =>
      (_$data['storage_bucket'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get version_latest =>
      (_$data['version_latest'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get version_supported =>
      (_$data['version_supported'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_and')) {
      final l$$_and = $_and;
      result$data['_and'] = l$$_and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('_not')) {
      final l$$_not = $_not;
      result$data['_not'] = l$$_not?.toJson();
    }
    if (_$data.containsKey('_or')) {
      final l$$_or = $_or;
      result$data['_or'] = l$$_or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name?.toJson();
    }
    if (_$data.containsKey('storage_bucket')) {
      final l$storage_bucket = storage_bucket;
      result$data['storage_bucket'] = l$storage_bucket?.toJson();
    }
    if (_$data.containsKey('version_latest')) {
      final l$version_latest = version_latest;
      result$data['version_latest'] = l$version_latest?.toJson();
    }
    if (_$data.containsKey('version_supported')) {
      final l$version_supported = version_supported;
      result$data['version_supported'] = l$version_supported?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$app_bool_exp<Input$app_bool_exp> get copyWith =>
      CopyWith$Input$app_bool_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_bool_exp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_and = $_and;
    final lOther$$_and = other.$_and;
    if (_$data.containsKey('_and') != other._$data.containsKey('_and')) {
      return false;
    }
    if (l$$_and != null && lOther$$_and != null) {
      if (l$$_and.length != lOther$$_and.length) {
        return false;
      }
      for (int i = 0; i < l$$_and.length; i++) {
        final l$$_and$entry = l$$_and[i];
        final lOther$$_and$entry = lOther$$_and[i];
        if (l$$_and$entry != lOther$$_and$entry) {
          return false;
        }
      }
    } else if (l$$_and != lOther$$_and) {
      return false;
    }
    final l$$_not = $_not;
    final lOther$$_not = other.$_not;
    if (_$data.containsKey('_not') != other._$data.containsKey('_not')) {
      return false;
    }
    if (l$$_not != lOther$$_not) {
      return false;
    }
    final l$$_or = $_or;
    final lOther$$_or = other.$_or;
    if (_$data.containsKey('_or') != other._$data.containsKey('_or')) {
      return false;
    }
    if (l$$_or != null && lOther$$_or != null) {
      if (l$$_or.length != lOther$$_or.length) {
        return false;
      }
      for (int i = 0; i < l$$_or.length; i++) {
        final l$$_or$entry = l$$_or[i];
        final lOther$$_or$entry = lOther$$_or[i];
        if (l$$_or$entry != lOther$$_or$entry) {
          return false;
        }
      }
    } else if (l$$_or != lOther$$_or) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$storage_bucket = storage_bucket;
    final lOther$storage_bucket = other.storage_bucket;
    if (_$data.containsKey('storage_bucket') !=
        other._$data.containsKey('storage_bucket')) {
      return false;
    }
    if (l$storage_bucket != lOther$storage_bucket) {
      return false;
    }
    final l$version_latest = version_latest;
    final lOther$version_latest = other.version_latest;
    if (_$data.containsKey('version_latest') !=
        other._$data.containsKey('version_latest')) {
      return false;
    }
    if (l$version_latest != lOther$version_latest) {
      return false;
    }
    final l$version_supported = version_supported;
    final lOther$version_supported = other.version_supported;
    if (_$data.containsKey('version_supported') !=
        other._$data.containsKey('version_supported')) {
      return false;
    }
    if (l$version_supported != lOther$version_supported) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_and = $_and;
    final l$$_not = $_not;
    final l$$_or = $_or;
    final l$name = name;
    final l$storage_bucket = storage_bucket;
    final l$version_latest = version_latest;
    final l$version_supported = version_supported;
    return Object.hashAll([
      _$data.containsKey('_and')
          ? l$$_and == null
              ? null
              : Object.hashAll(l$$_and.map((v) => v))
          : const {},
      _$data.containsKey('_not') ? l$$_not : const {},
      _$data.containsKey('_or')
          ? l$$_or == null
              ? null
              : Object.hashAll(l$$_or.map((v) => v))
          : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('storage_bucket') ? l$storage_bucket : const {},
      _$data.containsKey('version_latest') ? l$version_latest : const {},
      _$data.containsKey('version_supported') ? l$version_supported : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_bool_exp<TRes> {
  factory CopyWith$Input$app_bool_exp(
    Input$app_bool_exp instance,
    TRes Function(Input$app_bool_exp) then,
  ) = _CopyWithImpl$Input$app_bool_exp;

  factory CopyWith$Input$app_bool_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$app_bool_exp;

  TRes call({
    List<Input$app_bool_exp>? $_and,
    Input$app_bool_exp? $_not,
    List<Input$app_bool_exp>? $_or,
    Input$String_comparison_exp? name,
    Input$String_comparison_exp? storage_bucket,
    Input$String_comparison_exp? version_latest,
    Input$String_comparison_exp? version_supported,
  });
  TRes $_and(
      Iterable<Input$app_bool_exp>? Function(
              Iterable<CopyWith$Input$app_bool_exp<Input$app_bool_exp>>?)
          _fn);
  CopyWith$Input$app_bool_exp<TRes> get $_not;
  TRes $_or(
      Iterable<Input$app_bool_exp>? Function(
              Iterable<CopyWith$Input$app_bool_exp<Input$app_bool_exp>>?)
          _fn);
  CopyWith$Input$String_comparison_exp<TRes> get name;
  CopyWith$Input$String_comparison_exp<TRes> get storage_bucket;
  CopyWith$Input$String_comparison_exp<TRes> get version_latest;
  CopyWith$Input$String_comparison_exp<TRes> get version_supported;
}

class _CopyWithImpl$Input$app_bool_exp<TRes>
    implements CopyWith$Input$app_bool_exp<TRes> {
  _CopyWithImpl$Input$app_bool_exp(
    this._instance,
    this._then,
  );

  final Input$app_bool_exp _instance;

  final TRes Function(Input$app_bool_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_and = _undefined,
    Object? $_not = _undefined,
    Object? $_or = _undefined,
    Object? name = _undefined,
    Object? storage_bucket = _undefined,
    Object? version_latest = _undefined,
    Object? version_supported = _undefined,
  }) =>
      _then(Input$app_bool_exp._({
        ..._instance._$data,
        if ($_and != _undefined) '_and': ($_and as List<Input$app_bool_exp>?),
        if ($_not != _undefined) '_not': ($_not as Input$app_bool_exp?),
        if ($_or != _undefined) '_or': ($_or as List<Input$app_bool_exp>?),
        if (name != _undefined) 'name': (name as Input$String_comparison_exp?),
        if (storage_bucket != _undefined)
          'storage_bucket': (storage_bucket as Input$String_comparison_exp?),
        if (version_latest != _undefined)
          'version_latest': (version_latest as Input$String_comparison_exp?),
        if (version_supported != _undefined)
          'version_supported':
              (version_supported as Input$String_comparison_exp?),
      }));
  TRes $_and(
          Iterable<Input$app_bool_exp>? Function(
                  Iterable<CopyWith$Input$app_bool_exp<Input$app_bool_exp>>?)
              _fn) =>
      call(
          $_and: _fn(_instance.$_and?.map((e) => CopyWith$Input$app_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$app_bool_exp<TRes> get $_not {
    final local$$_not = _instance.$_not;
    return local$$_not == null
        ? CopyWith$Input$app_bool_exp.stub(_then(_instance))
        : CopyWith$Input$app_bool_exp(local$$_not, (e) => call($_not: e));
  }

  TRes $_or(
          Iterable<Input$app_bool_exp>? Function(
                  Iterable<CopyWith$Input$app_bool_exp<Input$app_bool_exp>>?)
              _fn) =>
      call(
          $_or: _fn(_instance.$_or?.map((e) => CopyWith$Input$app_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$String_comparison_exp<TRes> get name {
    final local$name = _instance.name;
    return local$name == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$name, (e) => call(name: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get storage_bucket {
    final local$storage_bucket = _instance.storage_bucket;
    return local$storage_bucket == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$storage_bucket, (e) => call(storage_bucket: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get version_latest {
    final local$version_latest = _instance.version_latest;
    return local$version_latest == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$version_latest, (e) => call(version_latest: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get version_supported {
    final local$version_supported = _instance.version_supported;
    return local$version_supported == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$version_supported, (e) => call(version_supported: e));
  }
}

class _CopyWithStubImpl$Input$app_bool_exp<TRes>
    implements CopyWith$Input$app_bool_exp<TRes> {
  _CopyWithStubImpl$Input$app_bool_exp(this._res);

  TRes _res;

  call({
    List<Input$app_bool_exp>? $_and,
    Input$app_bool_exp? $_not,
    List<Input$app_bool_exp>? $_or,
    Input$String_comparison_exp? name,
    Input$String_comparison_exp? storage_bucket,
    Input$String_comparison_exp? version_latest,
    Input$String_comparison_exp? version_supported,
  }) =>
      _res;
  $_and(_fn) => _res;
  CopyWith$Input$app_bool_exp<TRes> get $_not =>
      CopyWith$Input$app_bool_exp.stub(_res);
  $_or(_fn) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get name =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get storage_bucket =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get version_latest =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get version_supported =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}

class Input$app_insert_input {
  factory Input$app_insert_input({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      Input$app_insert_input._({
        if (name != null) r'name': name,
        if (storage_bucket != null) r'storage_bucket': storage_bucket,
        if (version_latest != null) r'version_latest': version_latest,
        if (version_supported != null) r'version_supported': version_supported,
      });

  Input$app_insert_input._(this._$data);

  factory Input$app_insert_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('storage_bucket')) {
      final l$storage_bucket = data['storage_bucket'];
      result$data['storage_bucket'] = (l$storage_bucket as String?);
    }
    if (data.containsKey('version_latest')) {
      final l$version_latest = data['version_latest'];
      result$data['version_latest'] = (l$version_latest as String?);
    }
    if (data.containsKey('version_supported')) {
      final l$version_supported = data['version_supported'];
      result$data['version_supported'] = (l$version_supported as String?);
    }
    return Input$app_insert_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);
  String? get storage_bucket => (_$data['storage_bucket'] as String?);
  String? get version_latest => (_$data['version_latest'] as String?);
  String? get version_supported => (_$data['version_supported'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('storage_bucket')) {
      final l$storage_bucket = storage_bucket;
      result$data['storage_bucket'] = l$storage_bucket;
    }
    if (_$data.containsKey('version_latest')) {
      final l$version_latest = version_latest;
      result$data['version_latest'] = l$version_latest;
    }
    if (_$data.containsKey('version_supported')) {
      final l$version_supported = version_supported;
      result$data['version_supported'] = l$version_supported;
    }
    return result$data;
  }

  CopyWith$Input$app_insert_input<Input$app_insert_input> get copyWith =>
      CopyWith$Input$app_insert_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_insert_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$storage_bucket = storage_bucket;
    final lOther$storage_bucket = other.storage_bucket;
    if (_$data.containsKey('storage_bucket') !=
        other._$data.containsKey('storage_bucket')) {
      return false;
    }
    if (l$storage_bucket != lOther$storage_bucket) {
      return false;
    }
    final l$version_latest = version_latest;
    final lOther$version_latest = other.version_latest;
    if (_$data.containsKey('version_latest') !=
        other._$data.containsKey('version_latest')) {
      return false;
    }
    if (l$version_latest != lOther$version_latest) {
      return false;
    }
    final l$version_supported = version_supported;
    final lOther$version_supported = other.version_supported;
    if (_$data.containsKey('version_supported') !=
        other._$data.containsKey('version_supported')) {
      return false;
    }
    if (l$version_supported != lOther$version_supported) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$storage_bucket = storage_bucket;
    final l$version_latest = version_latest;
    final l$version_supported = version_supported;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('storage_bucket') ? l$storage_bucket : const {},
      _$data.containsKey('version_latest') ? l$version_latest : const {},
      _$data.containsKey('version_supported') ? l$version_supported : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_insert_input<TRes> {
  factory CopyWith$Input$app_insert_input(
    Input$app_insert_input instance,
    TRes Function(Input$app_insert_input) then,
  ) = _CopyWithImpl$Input$app_insert_input;

  factory CopyWith$Input$app_insert_input.stub(TRes res) =
      _CopyWithStubImpl$Input$app_insert_input;

  TRes call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  });
}

class _CopyWithImpl$Input$app_insert_input<TRes>
    implements CopyWith$Input$app_insert_input<TRes> {
  _CopyWithImpl$Input$app_insert_input(
    this._instance,
    this._then,
  );

  final Input$app_insert_input _instance;

  final TRes Function(Input$app_insert_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? storage_bucket = _undefined,
    Object? version_latest = _undefined,
    Object? version_supported = _undefined,
  }) =>
      _then(Input$app_insert_input._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (storage_bucket != _undefined)
          'storage_bucket': (storage_bucket as String?),
        if (version_latest != _undefined)
          'version_latest': (version_latest as String?),
        if (version_supported != _undefined)
          'version_supported': (version_supported as String?),
      }));
}

class _CopyWithStubImpl$Input$app_insert_input<TRes>
    implements CopyWith$Input$app_insert_input<TRes> {
  _CopyWithStubImpl$Input$app_insert_input(this._res);

  TRes _res;

  call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      _res;
}

class Input$app_on_conflict {
  factory Input$app_on_conflict({
    required Enum$app_constraint constraint,
    required List<Enum$app_update_column> update_columns,
    Input$app_bool_exp? where,
  }) =>
      Input$app_on_conflict._({
        r'constraint': constraint,
        r'update_columns': update_columns,
        if (where != null) r'where': where,
      });

  Input$app_on_conflict._(this._$data);

  factory Input$app_on_conflict.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$constraint = data['constraint'];
    result$data['constraint'] =
        fromJson$Enum$app_constraint((l$constraint as String));
    final l$update_columns = data['update_columns'];
    result$data['update_columns'] = (l$update_columns as List<dynamic>)
        .map((e) => fromJson$Enum$app_update_column((e as String)))
        .toList();
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$app_bool_exp.fromJson((l$where as Map<String, dynamic>));
    }
    return Input$app_on_conflict._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$app_constraint get constraint =>
      (_$data['constraint'] as Enum$app_constraint);
  List<Enum$app_update_column> get update_columns =>
      (_$data['update_columns'] as List<Enum$app_update_column>);
  Input$app_bool_exp? get where => (_$data['where'] as Input$app_bool_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$constraint = constraint;
    result$data['constraint'] = toJson$Enum$app_constraint(l$constraint);
    final l$update_columns = update_columns;
    result$data['update_columns'] =
        l$update_columns.map((e) => toJson$Enum$app_update_column(e)).toList();
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$app_on_conflict<Input$app_on_conflict> get copyWith =>
      CopyWith$Input$app_on_conflict(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_on_conflict) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$constraint = constraint;
    final lOther$constraint = other.constraint;
    if (l$constraint != lOther$constraint) {
      return false;
    }
    final l$update_columns = update_columns;
    final lOther$update_columns = other.update_columns;
    if (l$update_columns.length != lOther$update_columns.length) {
      return false;
    }
    for (int i = 0; i < l$update_columns.length; i++) {
      final l$update_columns$entry = l$update_columns[i];
      final lOther$update_columns$entry = lOther$update_columns[i];
      if (l$update_columns$entry != lOther$update_columns$entry) {
        return false;
      }
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$constraint = constraint;
    final l$update_columns = update_columns;
    final l$where = where;
    return Object.hashAll([
      l$constraint,
      Object.hashAll(l$update_columns.map((v) => v)),
      _$data.containsKey('where') ? l$where : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_on_conflict<TRes> {
  factory CopyWith$Input$app_on_conflict(
    Input$app_on_conflict instance,
    TRes Function(Input$app_on_conflict) then,
  ) = _CopyWithImpl$Input$app_on_conflict;

  factory CopyWith$Input$app_on_conflict.stub(TRes res) =
      _CopyWithStubImpl$Input$app_on_conflict;

  TRes call({
    Enum$app_constraint? constraint,
    List<Enum$app_update_column>? update_columns,
    Input$app_bool_exp? where,
  });
  CopyWith$Input$app_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$app_on_conflict<TRes>
    implements CopyWith$Input$app_on_conflict<TRes> {
  _CopyWithImpl$Input$app_on_conflict(
    this._instance,
    this._then,
  );

  final Input$app_on_conflict _instance;

  final TRes Function(Input$app_on_conflict) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? constraint = _undefined,
    Object? update_columns = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$app_on_conflict._({
        ..._instance._$data,
        if (constraint != _undefined && constraint != null)
          'constraint': (constraint as Enum$app_constraint),
        if (update_columns != _undefined && update_columns != null)
          'update_columns': (update_columns as List<Enum$app_update_column>),
        if (where != _undefined) 'where': (where as Input$app_bool_exp?),
      }));
  CopyWith$Input$app_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return local$where == null
        ? CopyWith$Input$app_bool_exp.stub(_then(_instance))
        : CopyWith$Input$app_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$app_on_conflict<TRes>
    implements CopyWith$Input$app_on_conflict<TRes> {
  _CopyWithStubImpl$Input$app_on_conflict(this._res);

  TRes _res;

  call({
    Enum$app_constraint? constraint,
    List<Enum$app_update_column>? update_columns,
    Input$app_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$app_bool_exp<TRes> get where =>
      CopyWith$Input$app_bool_exp.stub(_res);
}

class Input$app_order_by {
  factory Input$app_order_by({
    Enum$order_by? name,
    Enum$order_by? storage_bucket,
    Enum$order_by? version_latest,
    Enum$order_by? version_supported,
  }) =>
      Input$app_order_by._({
        if (name != null) r'name': name,
        if (storage_bucket != null) r'storage_bucket': storage_bucket,
        if (version_latest != null) r'version_latest': version_latest,
        if (version_supported != null) r'version_supported': version_supported,
      });

  Input$app_order_by._(this._$data);

  factory Input$app_order_by.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] =
          l$name == null ? null : fromJson$Enum$order_by((l$name as String));
    }
    if (data.containsKey('storage_bucket')) {
      final l$storage_bucket = data['storage_bucket'];
      result$data['storage_bucket'] = l$storage_bucket == null
          ? null
          : fromJson$Enum$order_by((l$storage_bucket as String));
    }
    if (data.containsKey('version_latest')) {
      final l$version_latest = data['version_latest'];
      result$data['version_latest'] = l$version_latest == null
          ? null
          : fromJson$Enum$order_by((l$version_latest as String));
    }
    if (data.containsKey('version_supported')) {
      final l$version_supported = data['version_supported'];
      result$data['version_supported'] = l$version_supported == null
          ? null
          : fromJson$Enum$order_by((l$version_supported as String));
    }
    return Input$app_order_by._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$order_by? get name => (_$data['name'] as Enum$order_by?);
  Enum$order_by? get storage_bucket =>
      (_$data['storage_bucket'] as Enum$order_by?);
  Enum$order_by? get version_latest =>
      (_$data['version_latest'] as Enum$order_by?);
  Enum$order_by? get version_supported =>
      (_$data['version_supported'] as Enum$order_by?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] =
          l$name == null ? null : toJson$Enum$order_by(l$name);
    }
    if (_$data.containsKey('storage_bucket')) {
      final l$storage_bucket = storage_bucket;
      result$data['storage_bucket'] = l$storage_bucket == null
          ? null
          : toJson$Enum$order_by(l$storage_bucket);
    }
    if (_$data.containsKey('version_latest')) {
      final l$version_latest = version_latest;
      result$data['version_latest'] = l$version_latest == null
          ? null
          : toJson$Enum$order_by(l$version_latest);
    }
    if (_$data.containsKey('version_supported')) {
      final l$version_supported = version_supported;
      result$data['version_supported'] = l$version_supported == null
          ? null
          : toJson$Enum$order_by(l$version_supported);
    }
    return result$data;
  }

  CopyWith$Input$app_order_by<Input$app_order_by> get copyWith =>
      CopyWith$Input$app_order_by(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_order_by) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$storage_bucket = storage_bucket;
    final lOther$storage_bucket = other.storage_bucket;
    if (_$data.containsKey('storage_bucket') !=
        other._$data.containsKey('storage_bucket')) {
      return false;
    }
    if (l$storage_bucket != lOther$storage_bucket) {
      return false;
    }
    final l$version_latest = version_latest;
    final lOther$version_latest = other.version_latest;
    if (_$data.containsKey('version_latest') !=
        other._$data.containsKey('version_latest')) {
      return false;
    }
    if (l$version_latest != lOther$version_latest) {
      return false;
    }
    final l$version_supported = version_supported;
    final lOther$version_supported = other.version_supported;
    if (_$data.containsKey('version_supported') !=
        other._$data.containsKey('version_supported')) {
      return false;
    }
    if (l$version_supported != lOther$version_supported) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$storage_bucket = storage_bucket;
    final l$version_latest = version_latest;
    final l$version_supported = version_supported;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('storage_bucket') ? l$storage_bucket : const {},
      _$data.containsKey('version_latest') ? l$version_latest : const {},
      _$data.containsKey('version_supported') ? l$version_supported : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_order_by<TRes> {
  factory CopyWith$Input$app_order_by(
    Input$app_order_by instance,
    TRes Function(Input$app_order_by) then,
  ) = _CopyWithImpl$Input$app_order_by;

  factory CopyWith$Input$app_order_by.stub(TRes res) =
      _CopyWithStubImpl$Input$app_order_by;

  TRes call({
    Enum$order_by? name,
    Enum$order_by? storage_bucket,
    Enum$order_by? version_latest,
    Enum$order_by? version_supported,
  });
}

class _CopyWithImpl$Input$app_order_by<TRes>
    implements CopyWith$Input$app_order_by<TRes> {
  _CopyWithImpl$Input$app_order_by(
    this._instance,
    this._then,
  );

  final Input$app_order_by _instance;

  final TRes Function(Input$app_order_by) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? storage_bucket = _undefined,
    Object? version_latest = _undefined,
    Object? version_supported = _undefined,
  }) =>
      _then(Input$app_order_by._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as Enum$order_by?),
        if (storage_bucket != _undefined)
          'storage_bucket': (storage_bucket as Enum$order_by?),
        if (version_latest != _undefined)
          'version_latest': (version_latest as Enum$order_by?),
        if (version_supported != _undefined)
          'version_supported': (version_supported as Enum$order_by?),
      }));
}

class _CopyWithStubImpl$Input$app_order_by<TRes>
    implements CopyWith$Input$app_order_by<TRes> {
  _CopyWithStubImpl$Input$app_order_by(this._res);

  TRes _res;

  call({
    Enum$order_by? name,
    Enum$order_by? storage_bucket,
    Enum$order_by? version_latest,
    Enum$order_by? version_supported,
  }) =>
      _res;
}

class Input$app_pk_columns_input {
  factory Input$app_pk_columns_input({required String name}) =>
      Input$app_pk_columns_input._({
        r'name': name,
      });

  Input$app_pk_columns_input._(this._$data);

  factory Input$app_pk_columns_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$name = data['name'];
    result$data['name'] = (l$name as String);
    return Input$app_pk_columns_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String get name => (_$data['name'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$name = name;
    result$data['name'] = l$name;
    return result$data;
  }

  CopyWith$Input$app_pk_columns_input<Input$app_pk_columns_input>
      get copyWith => CopyWith$Input$app_pk_columns_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_pk_columns_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    return Object.hashAll([l$name]);
  }
}

abstract class CopyWith$Input$app_pk_columns_input<TRes> {
  factory CopyWith$Input$app_pk_columns_input(
    Input$app_pk_columns_input instance,
    TRes Function(Input$app_pk_columns_input) then,
  ) = _CopyWithImpl$Input$app_pk_columns_input;

  factory CopyWith$Input$app_pk_columns_input.stub(TRes res) =
      _CopyWithStubImpl$Input$app_pk_columns_input;

  TRes call({String? name});
}

class _CopyWithImpl$Input$app_pk_columns_input<TRes>
    implements CopyWith$Input$app_pk_columns_input<TRes> {
  _CopyWithImpl$Input$app_pk_columns_input(
    this._instance,
    this._then,
  );

  final Input$app_pk_columns_input _instance;

  final TRes Function(Input$app_pk_columns_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? name = _undefined}) => _then(Input$app_pk_columns_input._({
        ..._instance._$data,
        if (name != _undefined && name != null) 'name': (name as String),
      }));
}

class _CopyWithStubImpl$Input$app_pk_columns_input<TRes>
    implements CopyWith$Input$app_pk_columns_input<TRes> {
  _CopyWithStubImpl$Input$app_pk_columns_input(this._res);

  TRes _res;

  call({String? name}) => _res;
}

class Input$app_set_input {
  factory Input$app_set_input({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      Input$app_set_input._({
        if (name != null) r'name': name,
        if (storage_bucket != null) r'storage_bucket': storage_bucket,
        if (version_latest != null) r'version_latest': version_latest,
        if (version_supported != null) r'version_supported': version_supported,
      });

  Input$app_set_input._(this._$data);

  factory Input$app_set_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('storage_bucket')) {
      final l$storage_bucket = data['storage_bucket'];
      result$data['storage_bucket'] = (l$storage_bucket as String?);
    }
    if (data.containsKey('version_latest')) {
      final l$version_latest = data['version_latest'];
      result$data['version_latest'] = (l$version_latest as String?);
    }
    if (data.containsKey('version_supported')) {
      final l$version_supported = data['version_supported'];
      result$data['version_supported'] = (l$version_supported as String?);
    }
    return Input$app_set_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);
  String? get storage_bucket => (_$data['storage_bucket'] as String?);
  String? get version_latest => (_$data['version_latest'] as String?);
  String? get version_supported => (_$data['version_supported'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('storage_bucket')) {
      final l$storage_bucket = storage_bucket;
      result$data['storage_bucket'] = l$storage_bucket;
    }
    if (_$data.containsKey('version_latest')) {
      final l$version_latest = version_latest;
      result$data['version_latest'] = l$version_latest;
    }
    if (_$data.containsKey('version_supported')) {
      final l$version_supported = version_supported;
      result$data['version_supported'] = l$version_supported;
    }
    return result$data;
  }

  CopyWith$Input$app_set_input<Input$app_set_input> get copyWith =>
      CopyWith$Input$app_set_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_set_input) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$storage_bucket = storage_bucket;
    final lOther$storage_bucket = other.storage_bucket;
    if (_$data.containsKey('storage_bucket') !=
        other._$data.containsKey('storage_bucket')) {
      return false;
    }
    if (l$storage_bucket != lOther$storage_bucket) {
      return false;
    }
    final l$version_latest = version_latest;
    final lOther$version_latest = other.version_latest;
    if (_$data.containsKey('version_latest') !=
        other._$data.containsKey('version_latest')) {
      return false;
    }
    if (l$version_latest != lOther$version_latest) {
      return false;
    }
    final l$version_supported = version_supported;
    final lOther$version_supported = other.version_supported;
    if (_$data.containsKey('version_supported') !=
        other._$data.containsKey('version_supported')) {
      return false;
    }
    if (l$version_supported != lOther$version_supported) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$storage_bucket = storage_bucket;
    final l$version_latest = version_latest;
    final l$version_supported = version_supported;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('storage_bucket') ? l$storage_bucket : const {},
      _$data.containsKey('version_latest') ? l$version_latest : const {},
      _$data.containsKey('version_supported') ? l$version_supported : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_set_input<TRes> {
  factory CopyWith$Input$app_set_input(
    Input$app_set_input instance,
    TRes Function(Input$app_set_input) then,
  ) = _CopyWithImpl$Input$app_set_input;

  factory CopyWith$Input$app_set_input.stub(TRes res) =
      _CopyWithStubImpl$Input$app_set_input;

  TRes call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  });
}

class _CopyWithImpl$Input$app_set_input<TRes>
    implements CopyWith$Input$app_set_input<TRes> {
  _CopyWithImpl$Input$app_set_input(
    this._instance,
    this._then,
  );

  final Input$app_set_input _instance;

  final TRes Function(Input$app_set_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? storage_bucket = _undefined,
    Object? version_latest = _undefined,
    Object? version_supported = _undefined,
  }) =>
      _then(Input$app_set_input._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (storage_bucket != _undefined)
          'storage_bucket': (storage_bucket as String?),
        if (version_latest != _undefined)
          'version_latest': (version_latest as String?),
        if (version_supported != _undefined)
          'version_supported': (version_supported as String?),
      }));
}

class _CopyWithStubImpl$Input$app_set_input<TRes>
    implements CopyWith$Input$app_set_input<TRes> {
  _CopyWithStubImpl$Input$app_set_input(this._res);

  TRes _res;

  call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      _res;
}

class Input$app_stream_cursor_input {
  factory Input$app_stream_cursor_input({
    required Input$app_stream_cursor_value_input initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      Input$app_stream_cursor_input._({
        r'initial_value': initial_value,
        if (ordering != null) r'ordering': ordering,
      });

  Input$app_stream_cursor_input._(this._$data);

  factory Input$app_stream_cursor_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$initial_value = data['initial_value'];
    result$data['initial_value'] = Input$app_stream_cursor_value_input.fromJson(
        (l$initial_value as Map<String, dynamic>));
    if (data.containsKey('ordering')) {
      final l$ordering = data['ordering'];
      result$data['ordering'] = l$ordering == null
          ? null
          : fromJson$Enum$cursor_ordering((l$ordering as String));
    }
    return Input$app_stream_cursor_input._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$app_stream_cursor_value_input get initial_value =>
      (_$data['initial_value'] as Input$app_stream_cursor_value_input);
  Enum$cursor_ordering? get ordering =>
      (_$data['ordering'] as Enum$cursor_ordering?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$initial_value = initial_value;
    result$data['initial_value'] = l$initial_value.toJson();
    if (_$data.containsKey('ordering')) {
      final l$ordering = ordering;
      result$data['ordering'] =
          l$ordering == null ? null : toJson$Enum$cursor_ordering(l$ordering);
    }
    return result$data;
  }

  CopyWith$Input$app_stream_cursor_input<Input$app_stream_cursor_input>
      get copyWith => CopyWith$Input$app_stream_cursor_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_stream_cursor_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initial_value = initial_value;
    final lOther$initial_value = other.initial_value;
    if (l$initial_value != lOther$initial_value) {
      return false;
    }
    final l$ordering = ordering;
    final lOther$ordering = other.ordering;
    if (_$data.containsKey('ordering') !=
        other._$data.containsKey('ordering')) {
      return false;
    }
    if (l$ordering != lOther$ordering) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$initial_value = initial_value;
    final l$ordering = ordering;
    return Object.hashAll([
      l$initial_value,
      _$data.containsKey('ordering') ? l$ordering : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_stream_cursor_input<TRes> {
  factory CopyWith$Input$app_stream_cursor_input(
    Input$app_stream_cursor_input instance,
    TRes Function(Input$app_stream_cursor_input) then,
  ) = _CopyWithImpl$Input$app_stream_cursor_input;

  factory CopyWith$Input$app_stream_cursor_input.stub(TRes res) =
      _CopyWithStubImpl$Input$app_stream_cursor_input;

  TRes call({
    Input$app_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  });
  CopyWith$Input$app_stream_cursor_value_input<TRes> get initial_value;
}

class _CopyWithImpl$Input$app_stream_cursor_input<TRes>
    implements CopyWith$Input$app_stream_cursor_input<TRes> {
  _CopyWithImpl$Input$app_stream_cursor_input(
    this._instance,
    this._then,
  );

  final Input$app_stream_cursor_input _instance;

  final TRes Function(Input$app_stream_cursor_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initial_value = _undefined,
    Object? ordering = _undefined,
  }) =>
      _then(Input$app_stream_cursor_input._({
        ..._instance._$data,
        if (initial_value != _undefined && initial_value != null)
          'initial_value':
              (initial_value as Input$app_stream_cursor_value_input),
        if (ordering != _undefined)
          'ordering': (ordering as Enum$cursor_ordering?),
      }));
  CopyWith$Input$app_stream_cursor_value_input<TRes> get initial_value {
    final local$initial_value = _instance.initial_value;
    return CopyWith$Input$app_stream_cursor_value_input(
        local$initial_value, (e) => call(initial_value: e));
  }
}

class _CopyWithStubImpl$Input$app_stream_cursor_input<TRes>
    implements CopyWith$Input$app_stream_cursor_input<TRes> {
  _CopyWithStubImpl$Input$app_stream_cursor_input(this._res);

  TRes _res;

  call({
    Input$app_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      _res;
  CopyWith$Input$app_stream_cursor_value_input<TRes> get initial_value =>
      CopyWith$Input$app_stream_cursor_value_input.stub(_res);
}

class Input$app_stream_cursor_value_input {
  factory Input$app_stream_cursor_value_input({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      Input$app_stream_cursor_value_input._({
        if (name != null) r'name': name,
        if (storage_bucket != null) r'storage_bucket': storage_bucket,
        if (version_latest != null) r'version_latest': version_latest,
        if (version_supported != null) r'version_supported': version_supported,
      });

  Input$app_stream_cursor_value_input._(this._$data);

  factory Input$app_stream_cursor_value_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('storage_bucket')) {
      final l$storage_bucket = data['storage_bucket'];
      result$data['storage_bucket'] = (l$storage_bucket as String?);
    }
    if (data.containsKey('version_latest')) {
      final l$version_latest = data['version_latest'];
      result$data['version_latest'] = (l$version_latest as String?);
    }
    if (data.containsKey('version_supported')) {
      final l$version_supported = data['version_supported'];
      result$data['version_supported'] = (l$version_supported as String?);
    }
    return Input$app_stream_cursor_value_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get name => (_$data['name'] as String?);
  String? get storage_bucket => (_$data['storage_bucket'] as String?);
  String? get version_latest => (_$data['version_latest'] as String?);
  String? get version_supported => (_$data['version_supported'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('storage_bucket')) {
      final l$storage_bucket = storage_bucket;
      result$data['storage_bucket'] = l$storage_bucket;
    }
    if (_$data.containsKey('version_latest')) {
      final l$version_latest = version_latest;
      result$data['version_latest'] = l$version_latest;
    }
    if (_$data.containsKey('version_supported')) {
      final l$version_supported = version_supported;
      result$data['version_supported'] = l$version_supported;
    }
    return result$data;
  }

  CopyWith$Input$app_stream_cursor_value_input<
          Input$app_stream_cursor_value_input>
      get copyWith => CopyWith$Input$app_stream_cursor_value_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_stream_cursor_value_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$storage_bucket = storage_bucket;
    final lOther$storage_bucket = other.storage_bucket;
    if (_$data.containsKey('storage_bucket') !=
        other._$data.containsKey('storage_bucket')) {
      return false;
    }
    if (l$storage_bucket != lOther$storage_bucket) {
      return false;
    }
    final l$version_latest = version_latest;
    final lOther$version_latest = other.version_latest;
    if (_$data.containsKey('version_latest') !=
        other._$data.containsKey('version_latest')) {
      return false;
    }
    if (l$version_latest != lOther$version_latest) {
      return false;
    }
    final l$version_supported = version_supported;
    final lOther$version_supported = other.version_supported;
    if (_$data.containsKey('version_supported') !=
        other._$data.containsKey('version_supported')) {
      return false;
    }
    if (l$version_supported != lOther$version_supported) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$storage_bucket = storage_bucket;
    final l$version_latest = version_latest;
    final l$version_supported = version_supported;
    return Object.hashAll([
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('storage_bucket') ? l$storage_bucket : const {},
      _$data.containsKey('version_latest') ? l$version_latest : const {},
      _$data.containsKey('version_supported') ? l$version_supported : const {},
    ]);
  }
}

abstract class CopyWith$Input$app_stream_cursor_value_input<TRes> {
  factory CopyWith$Input$app_stream_cursor_value_input(
    Input$app_stream_cursor_value_input instance,
    TRes Function(Input$app_stream_cursor_value_input) then,
  ) = _CopyWithImpl$Input$app_stream_cursor_value_input;

  factory CopyWith$Input$app_stream_cursor_value_input.stub(TRes res) =
      _CopyWithStubImpl$Input$app_stream_cursor_value_input;

  TRes call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  });
}

class _CopyWithImpl$Input$app_stream_cursor_value_input<TRes>
    implements CopyWith$Input$app_stream_cursor_value_input<TRes> {
  _CopyWithImpl$Input$app_stream_cursor_value_input(
    this._instance,
    this._then,
  );

  final Input$app_stream_cursor_value_input _instance;

  final TRes Function(Input$app_stream_cursor_value_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? name = _undefined,
    Object? storage_bucket = _undefined,
    Object? version_latest = _undefined,
    Object? version_supported = _undefined,
  }) =>
      _then(Input$app_stream_cursor_value_input._({
        ..._instance._$data,
        if (name != _undefined) 'name': (name as String?),
        if (storage_bucket != _undefined)
          'storage_bucket': (storage_bucket as String?),
        if (version_latest != _undefined)
          'version_latest': (version_latest as String?),
        if (version_supported != _undefined)
          'version_supported': (version_supported as String?),
      }));
}

class _CopyWithStubImpl$Input$app_stream_cursor_value_input<TRes>
    implements CopyWith$Input$app_stream_cursor_value_input<TRes> {
  _CopyWithStubImpl$Input$app_stream_cursor_value_input(this._res);

  TRes _res;

  call({
    String? name,
    String? storage_bucket,
    String? version_latest,
    String? version_supported,
  }) =>
      _res;
}

class Input$app_updates {
  factory Input$app_updates({
    Input$app_set_input? $_set,
    required Input$app_bool_exp where,
  }) =>
      Input$app_updates._({
        if ($_set != null) r'_set': $_set,
        r'where': where,
      });

  Input$app_updates._(this._$data);

  factory Input$app_updates.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_set')) {
      final l$$_set = data['_set'];
      result$data['_set'] = l$$_set == null
          ? null
          : Input$app_set_input.fromJson((l$$_set as Map<String, dynamic>));
    }
    final l$where = data['where'];
    result$data['where'] =
        Input$app_bool_exp.fromJson((l$where as Map<String, dynamic>));
    return Input$app_updates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$app_set_input? get $_set => (_$data['_set'] as Input$app_set_input?);
  Input$app_bool_exp get where => (_$data['where'] as Input$app_bool_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_set')) {
      final l$$_set = $_set;
      result$data['_set'] = l$$_set?.toJson();
    }
    final l$where = where;
    result$data['where'] = l$where.toJson();
    return result$data;
  }

  CopyWith$Input$app_updates<Input$app_updates> get copyWith =>
      CopyWith$Input$app_updates(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$app_updates) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_set = $_set;
    final lOther$$_set = other.$_set;
    if (_$data.containsKey('_set') != other._$data.containsKey('_set')) {
      return false;
    }
    if (l$$_set != lOther$$_set) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_set = $_set;
    final l$where = where;
    return Object.hashAll([
      _$data.containsKey('_set') ? l$$_set : const {},
      l$where,
    ]);
  }
}

abstract class CopyWith$Input$app_updates<TRes> {
  factory CopyWith$Input$app_updates(
    Input$app_updates instance,
    TRes Function(Input$app_updates) then,
  ) = _CopyWithImpl$Input$app_updates;

  factory CopyWith$Input$app_updates.stub(TRes res) =
      _CopyWithStubImpl$Input$app_updates;

  TRes call({
    Input$app_set_input? $_set,
    Input$app_bool_exp? where,
  });
  CopyWith$Input$app_set_input<TRes> get $_set;
  CopyWith$Input$app_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$app_updates<TRes>
    implements CopyWith$Input$app_updates<TRes> {
  _CopyWithImpl$Input$app_updates(
    this._instance,
    this._then,
  );

  final Input$app_updates _instance;

  final TRes Function(Input$app_updates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_set = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$app_updates._({
        ..._instance._$data,
        if ($_set != _undefined) '_set': ($_set as Input$app_set_input?),
        if (where != _undefined && where != null)
          'where': (where as Input$app_bool_exp),
      }));
  CopyWith$Input$app_set_input<TRes> get $_set {
    final local$$_set = _instance.$_set;
    return local$$_set == null
        ? CopyWith$Input$app_set_input.stub(_then(_instance))
        : CopyWith$Input$app_set_input(local$$_set, (e) => call($_set: e));
  }

  CopyWith$Input$app_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return CopyWith$Input$app_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$app_updates<TRes>
    implements CopyWith$Input$app_updates<TRes> {
  _CopyWithStubImpl$Input$app_updates(this._res);

  TRes _res;

  call({
    Input$app_set_input? $_set,
    Input$app_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$app_set_input<TRes> get $_set =>
      CopyWith$Input$app_set_input.stub(_res);
  CopyWith$Input$app_bool_exp<TRes> get where =>
      CopyWith$Input$app_bool_exp.stub(_res);
}

class Input$file_bool_exp {
  factory Input$file_bool_exp({
    List<Input$file_bool_exp>? $_and,
    Input$file_bool_exp? $_not,
    List<Input$file_bool_exp>? $_or,
    Input$String_comparison_exp? file_id,
    Input$String_comparison_exp? name,
    Input$Boolean_comparison_exp? public,
    Input$String_comparison_exp? signed_url,
    Input$String_comparison_exp? type,
    Input$String_comparison_exp? user_id,
  }) =>
      Input$file_bool_exp._({
        if ($_and != null) r'_and': $_and,
        if ($_not != null) r'_not': $_not,
        if ($_or != null) r'_or': $_or,
        if (file_id != null) r'file_id': file_id,
        if (name != null) r'name': name,
        if (public != null) r'public': public,
        if (signed_url != null) r'signed_url': signed_url,
        if (type != null) r'type': type,
        if (user_id != null) r'user_id': user_id,
      });

  Input$file_bool_exp._(this._$data);

  factory Input$file_bool_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_and')) {
      final l$$_and = data['_and'];
      result$data['_and'] = (l$$_and as List<dynamic>?)
          ?.map(
              (e) => Input$file_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('_not')) {
      final l$$_not = data['_not'];
      result$data['_not'] = l$$_not == null
          ? null
          : Input$file_bool_exp.fromJson((l$$_not as Map<String, dynamic>));
    }
    if (data.containsKey('_or')) {
      final l$$_or = data['_or'];
      result$data['_or'] = (l$$_or as List<dynamic>?)
          ?.map(
              (e) => Input$file_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('file_id')) {
      final l$file_id = data['file_id'];
      result$data['file_id'] = l$file_id == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$file_id as Map<String, dynamic>));
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = l$name == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$name as Map<String, dynamic>));
    }
    if (data.containsKey('public')) {
      final l$public = data['public'];
      result$data['public'] = l$public == null
          ? null
          : Input$Boolean_comparison_exp.fromJson(
              (l$public as Map<String, dynamic>));
    }
    if (data.containsKey('signed_url')) {
      final l$signed_url = data['signed_url'];
      result$data['signed_url'] = l$signed_url == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$signed_url as Map<String, dynamic>));
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = l$type == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$type as Map<String, dynamic>));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$user_id as Map<String, dynamic>));
    }
    return Input$file_bool_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$file_bool_exp>? get $_and =>
      (_$data['_and'] as List<Input$file_bool_exp>?);
  Input$file_bool_exp? get $_not => (_$data['_not'] as Input$file_bool_exp?);
  List<Input$file_bool_exp>? get $_or =>
      (_$data['_or'] as List<Input$file_bool_exp>?);
  Input$String_comparison_exp? get file_id =>
      (_$data['file_id'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get name =>
      (_$data['name'] as Input$String_comparison_exp?);
  Input$Boolean_comparison_exp? get public =>
      (_$data['public'] as Input$Boolean_comparison_exp?);
  Input$String_comparison_exp? get signed_url =>
      (_$data['signed_url'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get type =>
      (_$data['type'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get user_id =>
      (_$data['user_id'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_and')) {
      final l$$_and = $_and;
      result$data['_and'] = l$$_and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('_not')) {
      final l$$_not = $_not;
      result$data['_not'] = l$$_not?.toJson();
    }
    if (_$data.containsKey('_or')) {
      final l$$_or = $_or;
      result$data['_or'] = l$$_or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('file_id')) {
      final l$file_id = file_id;
      result$data['file_id'] = l$file_id?.toJson();
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name?.toJson();
    }
    if (_$data.containsKey('public')) {
      final l$public = public;
      result$data['public'] = l$public?.toJson();
    }
    if (_$data.containsKey('signed_url')) {
      final l$signed_url = signed_url;
      result$data['signed_url'] = l$signed_url?.toJson();
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type?.toJson();
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$file_bool_exp<Input$file_bool_exp> get copyWith =>
      CopyWith$Input$file_bool_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_bool_exp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_and = $_and;
    final lOther$$_and = other.$_and;
    if (_$data.containsKey('_and') != other._$data.containsKey('_and')) {
      return false;
    }
    if (l$$_and != null && lOther$$_and != null) {
      if (l$$_and.length != lOther$$_and.length) {
        return false;
      }
      for (int i = 0; i < l$$_and.length; i++) {
        final l$$_and$entry = l$$_and[i];
        final lOther$$_and$entry = lOther$$_and[i];
        if (l$$_and$entry != lOther$$_and$entry) {
          return false;
        }
      }
    } else if (l$$_and != lOther$$_and) {
      return false;
    }
    final l$$_not = $_not;
    final lOther$$_not = other.$_not;
    if (_$data.containsKey('_not') != other._$data.containsKey('_not')) {
      return false;
    }
    if (l$$_not != lOther$$_not) {
      return false;
    }
    final l$$_or = $_or;
    final lOther$$_or = other.$_or;
    if (_$data.containsKey('_or') != other._$data.containsKey('_or')) {
      return false;
    }
    if (l$$_or != null && lOther$$_or != null) {
      if (l$$_or.length != lOther$$_or.length) {
        return false;
      }
      for (int i = 0; i < l$$_or.length; i++) {
        final l$$_or$entry = l$$_or[i];
        final lOther$$_or$entry = lOther$$_or[i];
        if (l$$_or$entry != lOther$$_or$entry) {
          return false;
        }
      }
    } else if (l$$_or != lOther$$_or) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (_$data.containsKey('file_id') != other._$data.containsKey('file_id')) {
      return false;
    }
    if (l$file_id != lOther$file_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (_$data.containsKey('public') != other._$data.containsKey('public')) {
      return false;
    }
    if (l$public != lOther$public) {
      return false;
    }
    final l$signed_url = signed_url;
    final lOther$signed_url = other.signed_url;
    if (_$data.containsKey('signed_url') !=
        other._$data.containsKey('signed_url')) {
      return false;
    }
    if (l$signed_url != lOther$signed_url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_and = $_and;
    final l$$_not = $_not;
    final l$$_or = $_or;
    final l$file_id = file_id;
    final l$name = name;
    final l$public = public;
    final l$signed_url = signed_url;
    final l$type = type;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('_and')
          ? l$$_and == null
              ? null
              : Object.hashAll(l$$_and.map((v) => v))
          : const {},
      _$data.containsKey('_not') ? l$$_not : const {},
      _$data.containsKey('_or')
          ? l$$_or == null
              ? null
              : Object.hashAll(l$$_or.map((v) => v))
          : const {},
      _$data.containsKey('file_id') ? l$file_id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('public') ? l$public : const {},
      _$data.containsKey('signed_url') ? l$signed_url : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_bool_exp<TRes> {
  factory CopyWith$Input$file_bool_exp(
    Input$file_bool_exp instance,
    TRes Function(Input$file_bool_exp) then,
  ) = _CopyWithImpl$Input$file_bool_exp;

  factory CopyWith$Input$file_bool_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$file_bool_exp;

  TRes call({
    List<Input$file_bool_exp>? $_and,
    Input$file_bool_exp? $_not,
    List<Input$file_bool_exp>? $_or,
    Input$String_comparison_exp? file_id,
    Input$String_comparison_exp? name,
    Input$Boolean_comparison_exp? public,
    Input$String_comparison_exp? signed_url,
    Input$String_comparison_exp? type,
    Input$String_comparison_exp? user_id,
  });
  TRes $_and(
      Iterable<Input$file_bool_exp>? Function(
              Iterable<CopyWith$Input$file_bool_exp<Input$file_bool_exp>>?)
          _fn);
  CopyWith$Input$file_bool_exp<TRes> get $_not;
  TRes $_or(
      Iterable<Input$file_bool_exp>? Function(
              Iterable<CopyWith$Input$file_bool_exp<Input$file_bool_exp>>?)
          _fn);
  CopyWith$Input$String_comparison_exp<TRes> get file_id;
  CopyWith$Input$String_comparison_exp<TRes> get name;
  CopyWith$Input$Boolean_comparison_exp<TRes> get public;
  CopyWith$Input$String_comparison_exp<TRes> get signed_url;
  CopyWith$Input$String_comparison_exp<TRes> get type;
  CopyWith$Input$String_comparison_exp<TRes> get user_id;
}

class _CopyWithImpl$Input$file_bool_exp<TRes>
    implements CopyWith$Input$file_bool_exp<TRes> {
  _CopyWithImpl$Input$file_bool_exp(
    this._instance,
    this._then,
  );

  final Input$file_bool_exp _instance;

  final TRes Function(Input$file_bool_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_and = _undefined,
    Object? $_not = _undefined,
    Object? $_or = _undefined,
    Object? file_id = _undefined,
    Object? name = _undefined,
    Object? public = _undefined,
    Object? signed_url = _undefined,
    Object? type = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$file_bool_exp._({
        ..._instance._$data,
        if ($_and != _undefined) '_and': ($_and as List<Input$file_bool_exp>?),
        if ($_not != _undefined) '_not': ($_not as Input$file_bool_exp?),
        if ($_or != _undefined) '_or': ($_or as List<Input$file_bool_exp>?),
        if (file_id != _undefined)
          'file_id': (file_id as Input$String_comparison_exp?),
        if (name != _undefined) 'name': (name as Input$String_comparison_exp?),
        if (public != _undefined)
          'public': (public as Input$Boolean_comparison_exp?),
        if (signed_url != _undefined)
          'signed_url': (signed_url as Input$String_comparison_exp?),
        if (type != _undefined) 'type': (type as Input$String_comparison_exp?),
        if (user_id != _undefined)
          'user_id': (user_id as Input$String_comparison_exp?),
      }));
  TRes $_and(
          Iterable<Input$file_bool_exp>? Function(
                  Iterable<CopyWith$Input$file_bool_exp<Input$file_bool_exp>>?)
              _fn) =>
      call(
          $_and: _fn(_instance.$_and?.map((e) => CopyWith$Input$file_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$file_bool_exp<TRes> get $_not {
    final local$$_not = _instance.$_not;
    return local$$_not == null
        ? CopyWith$Input$file_bool_exp.stub(_then(_instance))
        : CopyWith$Input$file_bool_exp(local$$_not, (e) => call($_not: e));
  }

  TRes $_or(
          Iterable<Input$file_bool_exp>? Function(
                  Iterable<CopyWith$Input$file_bool_exp<Input$file_bool_exp>>?)
              _fn) =>
      call(
          $_or: _fn(_instance.$_or?.map((e) => CopyWith$Input$file_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$String_comparison_exp<TRes> get file_id {
    final local$file_id = _instance.file_id;
    return local$file_id == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$file_id, (e) => call(file_id: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get name {
    final local$name = _instance.name;
    return local$name == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$name, (e) => call(name: e));
  }

  CopyWith$Input$Boolean_comparison_exp<TRes> get public {
    final local$public = _instance.public;
    return local$public == null
        ? CopyWith$Input$Boolean_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$Boolean_comparison_exp(
            local$public, (e) => call(public: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get signed_url {
    final local$signed_url = _instance.signed_url;
    return local$signed_url == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$signed_url, (e) => call(signed_url: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get type {
    final local$type = _instance.type;
    return local$type == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$type, (e) => call(type: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get user_id {
    final local$user_id = _instance.user_id;
    return local$user_id == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$user_id, (e) => call(user_id: e));
  }
}

class _CopyWithStubImpl$Input$file_bool_exp<TRes>
    implements CopyWith$Input$file_bool_exp<TRes> {
  _CopyWithStubImpl$Input$file_bool_exp(this._res);

  TRes _res;

  call({
    List<Input$file_bool_exp>? $_and,
    Input$file_bool_exp? $_not,
    List<Input$file_bool_exp>? $_or,
    Input$String_comparison_exp? file_id,
    Input$String_comparison_exp? name,
    Input$Boolean_comparison_exp? public,
    Input$String_comparison_exp? signed_url,
    Input$String_comparison_exp? type,
    Input$String_comparison_exp? user_id,
  }) =>
      _res;
  $_and(_fn) => _res;
  CopyWith$Input$file_bool_exp<TRes> get $_not =>
      CopyWith$Input$file_bool_exp.stub(_res);
  $_or(_fn) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get file_id =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get name =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$Boolean_comparison_exp<TRes> get public =>
      CopyWith$Input$Boolean_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get signed_url =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get type =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get user_id =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}

class Input$file_insert_input {
  factory Input$file_insert_input({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      Input$file_insert_input._({
        if (file_id != null) r'file_id': file_id,
        if (name != null) r'name': name,
        if (public != null) r'public': public,
        if (signed_url != null) r'signed_url': signed_url,
        if (type != null) r'type': type,
        if (user_id != null) r'user_id': user_id,
      });

  Input$file_insert_input._(this._$data);

  factory Input$file_insert_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('file_id')) {
      final l$file_id = data['file_id'];
      result$data['file_id'] = (l$file_id as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('public')) {
      final l$public = data['public'];
      result$data['public'] = (l$public as bool?);
    }
    if (data.containsKey('signed_url')) {
      final l$signed_url = data['signed_url'];
      result$data['signed_url'] = (l$signed_url as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$file_insert_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get file_id => (_$data['file_id'] as String?);
  String? get name => (_$data['name'] as String?);
  bool? get public => (_$data['public'] as bool?);
  String? get signed_url => (_$data['signed_url'] as String?);
  String? get type => (_$data['type'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('file_id')) {
      final l$file_id = file_id;
      result$data['file_id'] = l$file_id;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('public')) {
      final l$public = public;
      result$data['public'] = l$public;
    }
    if (_$data.containsKey('signed_url')) {
      final l$signed_url = signed_url;
      result$data['signed_url'] = l$signed_url;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$file_insert_input<Input$file_insert_input> get copyWith =>
      CopyWith$Input$file_insert_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_insert_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (_$data.containsKey('file_id') != other._$data.containsKey('file_id')) {
      return false;
    }
    if (l$file_id != lOther$file_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (_$data.containsKey('public') != other._$data.containsKey('public')) {
      return false;
    }
    if (l$public != lOther$public) {
      return false;
    }
    final l$signed_url = signed_url;
    final lOther$signed_url = other.signed_url;
    if (_$data.containsKey('signed_url') !=
        other._$data.containsKey('signed_url')) {
      return false;
    }
    if (l$signed_url != lOther$signed_url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_id = file_id;
    final l$name = name;
    final l$public = public;
    final l$signed_url = signed_url;
    final l$type = type;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('file_id') ? l$file_id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('public') ? l$public : const {},
      _$data.containsKey('signed_url') ? l$signed_url : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_insert_input<TRes> {
  factory CopyWith$Input$file_insert_input(
    Input$file_insert_input instance,
    TRes Function(Input$file_insert_input) then,
  ) = _CopyWithImpl$Input$file_insert_input;

  factory CopyWith$Input$file_insert_input.stub(TRes res) =
      _CopyWithStubImpl$Input$file_insert_input;

  TRes call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  });
}

class _CopyWithImpl$Input$file_insert_input<TRes>
    implements CopyWith$Input$file_insert_input<TRes> {
  _CopyWithImpl$Input$file_insert_input(
    this._instance,
    this._then,
  );

  final Input$file_insert_input _instance;

  final TRes Function(Input$file_insert_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_id = _undefined,
    Object? name = _undefined,
    Object? public = _undefined,
    Object? signed_url = _undefined,
    Object? type = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$file_insert_input._({
        ..._instance._$data,
        if (file_id != _undefined) 'file_id': (file_id as String?),
        if (name != _undefined) 'name': (name as String?),
        if (public != _undefined) 'public': (public as bool?),
        if (signed_url != _undefined) 'signed_url': (signed_url as String?),
        if (type != _undefined) 'type': (type as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$file_insert_input<TRes>
    implements CopyWith$Input$file_insert_input<TRes> {
  _CopyWithStubImpl$Input$file_insert_input(this._res);

  TRes _res;

  call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      _res;
}

class Input$file_on_conflict {
  factory Input$file_on_conflict({
    required Enum$file_constraint constraint,
    required List<Enum$file_update_column> update_columns,
    Input$file_bool_exp? where,
  }) =>
      Input$file_on_conflict._({
        r'constraint': constraint,
        r'update_columns': update_columns,
        if (where != null) r'where': where,
      });

  Input$file_on_conflict._(this._$data);

  factory Input$file_on_conflict.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$constraint = data['constraint'];
    result$data['constraint'] =
        fromJson$Enum$file_constraint((l$constraint as String));
    final l$update_columns = data['update_columns'];
    result$data['update_columns'] = (l$update_columns as List<dynamic>)
        .map((e) => fromJson$Enum$file_update_column((e as String)))
        .toList();
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$file_bool_exp.fromJson((l$where as Map<String, dynamic>));
    }
    return Input$file_on_conflict._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$file_constraint get constraint =>
      (_$data['constraint'] as Enum$file_constraint);
  List<Enum$file_update_column> get update_columns =>
      (_$data['update_columns'] as List<Enum$file_update_column>);
  Input$file_bool_exp? get where => (_$data['where'] as Input$file_bool_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$constraint = constraint;
    result$data['constraint'] = toJson$Enum$file_constraint(l$constraint);
    final l$update_columns = update_columns;
    result$data['update_columns'] =
        l$update_columns.map((e) => toJson$Enum$file_update_column(e)).toList();
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$file_on_conflict<Input$file_on_conflict> get copyWith =>
      CopyWith$Input$file_on_conflict(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_on_conflict) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$constraint = constraint;
    final lOther$constraint = other.constraint;
    if (l$constraint != lOther$constraint) {
      return false;
    }
    final l$update_columns = update_columns;
    final lOther$update_columns = other.update_columns;
    if (l$update_columns.length != lOther$update_columns.length) {
      return false;
    }
    for (int i = 0; i < l$update_columns.length; i++) {
      final l$update_columns$entry = l$update_columns[i];
      final lOther$update_columns$entry = lOther$update_columns[i];
      if (l$update_columns$entry != lOther$update_columns$entry) {
        return false;
      }
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$constraint = constraint;
    final l$update_columns = update_columns;
    final l$where = where;
    return Object.hashAll([
      l$constraint,
      Object.hashAll(l$update_columns.map((v) => v)),
      _$data.containsKey('where') ? l$where : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_on_conflict<TRes> {
  factory CopyWith$Input$file_on_conflict(
    Input$file_on_conflict instance,
    TRes Function(Input$file_on_conflict) then,
  ) = _CopyWithImpl$Input$file_on_conflict;

  factory CopyWith$Input$file_on_conflict.stub(TRes res) =
      _CopyWithStubImpl$Input$file_on_conflict;

  TRes call({
    Enum$file_constraint? constraint,
    List<Enum$file_update_column>? update_columns,
    Input$file_bool_exp? where,
  });
  CopyWith$Input$file_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$file_on_conflict<TRes>
    implements CopyWith$Input$file_on_conflict<TRes> {
  _CopyWithImpl$Input$file_on_conflict(
    this._instance,
    this._then,
  );

  final Input$file_on_conflict _instance;

  final TRes Function(Input$file_on_conflict) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? constraint = _undefined,
    Object? update_columns = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$file_on_conflict._({
        ..._instance._$data,
        if (constraint != _undefined && constraint != null)
          'constraint': (constraint as Enum$file_constraint),
        if (update_columns != _undefined && update_columns != null)
          'update_columns': (update_columns as List<Enum$file_update_column>),
        if (where != _undefined) 'where': (where as Input$file_bool_exp?),
      }));
  CopyWith$Input$file_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return local$where == null
        ? CopyWith$Input$file_bool_exp.stub(_then(_instance))
        : CopyWith$Input$file_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$file_on_conflict<TRes>
    implements CopyWith$Input$file_on_conflict<TRes> {
  _CopyWithStubImpl$Input$file_on_conflict(this._res);

  TRes _res;

  call({
    Enum$file_constraint? constraint,
    List<Enum$file_update_column>? update_columns,
    Input$file_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$file_bool_exp<TRes> get where =>
      CopyWith$Input$file_bool_exp.stub(_res);
}

class Input$file_order_by {
  factory Input$file_order_by({
    Enum$order_by? file_id,
    Enum$order_by? name,
    Enum$order_by? public,
    Enum$order_by? signed_url,
    Enum$order_by? type,
    Enum$order_by? user_id,
  }) =>
      Input$file_order_by._({
        if (file_id != null) r'file_id': file_id,
        if (name != null) r'name': name,
        if (public != null) r'public': public,
        if (signed_url != null) r'signed_url': signed_url,
        if (type != null) r'type': type,
        if (user_id != null) r'user_id': user_id,
      });

  Input$file_order_by._(this._$data);

  factory Input$file_order_by.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('file_id')) {
      final l$file_id = data['file_id'];
      result$data['file_id'] = l$file_id == null
          ? null
          : fromJson$Enum$order_by((l$file_id as String));
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] =
          l$name == null ? null : fromJson$Enum$order_by((l$name as String));
    }
    if (data.containsKey('public')) {
      final l$public = data['public'];
      result$data['public'] = l$public == null
          ? null
          : fromJson$Enum$order_by((l$public as String));
    }
    if (data.containsKey('signed_url')) {
      final l$signed_url = data['signed_url'];
      result$data['signed_url'] = l$signed_url == null
          ? null
          : fromJson$Enum$order_by((l$signed_url as String));
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] =
          l$type == null ? null : fromJson$Enum$order_by((l$type as String));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : fromJson$Enum$order_by((l$user_id as String));
    }
    return Input$file_order_by._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$order_by? get file_id => (_$data['file_id'] as Enum$order_by?);
  Enum$order_by? get name => (_$data['name'] as Enum$order_by?);
  Enum$order_by? get public => (_$data['public'] as Enum$order_by?);
  Enum$order_by? get signed_url => (_$data['signed_url'] as Enum$order_by?);
  Enum$order_by? get type => (_$data['type'] as Enum$order_by?);
  Enum$order_by? get user_id => (_$data['user_id'] as Enum$order_by?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('file_id')) {
      final l$file_id = file_id;
      result$data['file_id'] =
          l$file_id == null ? null : toJson$Enum$order_by(l$file_id);
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] =
          l$name == null ? null : toJson$Enum$order_by(l$name);
    }
    if (_$data.containsKey('public')) {
      final l$public = public;
      result$data['public'] =
          l$public == null ? null : toJson$Enum$order_by(l$public);
    }
    if (_$data.containsKey('signed_url')) {
      final l$signed_url = signed_url;
      result$data['signed_url'] =
          l$signed_url == null ? null : toJson$Enum$order_by(l$signed_url);
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] =
          l$type == null ? null : toJson$Enum$order_by(l$type);
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] =
          l$user_id == null ? null : toJson$Enum$order_by(l$user_id);
    }
    return result$data;
  }

  CopyWith$Input$file_order_by<Input$file_order_by> get copyWith =>
      CopyWith$Input$file_order_by(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_order_by) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (_$data.containsKey('file_id') != other._$data.containsKey('file_id')) {
      return false;
    }
    if (l$file_id != lOther$file_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (_$data.containsKey('public') != other._$data.containsKey('public')) {
      return false;
    }
    if (l$public != lOther$public) {
      return false;
    }
    final l$signed_url = signed_url;
    final lOther$signed_url = other.signed_url;
    if (_$data.containsKey('signed_url') !=
        other._$data.containsKey('signed_url')) {
      return false;
    }
    if (l$signed_url != lOther$signed_url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_id = file_id;
    final l$name = name;
    final l$public = public;
    final l$signed_url = signed_url;
    final l$type = type;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('file_id') ? l$file_id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('public') ? l$public : const {},
      _$data.containsKey('signed_url') ? l$signed_url : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_order_by<TRes> {
  factory CopyWith$Input$file_order_by(
    Input$file_order_by instance,
    TRes Function(Input$file_order_by) then,
  ) = _CopyWithImpl$Input$file_order_by;

  factory CopyWith$Input$file_order_by.stub(TRes res) =
      _CopyWithStubImpl$Input$file_order_by;

  TRes call({
    Enum$order_by? file_id,
    Enum$order_by? name,
    Enum$order_by? public,
    Enum$order_by? signed_url,
    Enum$order_by? type,
    Enum$order_by? user_id,
  });
}

class _CopyWithImpl$Input$file_order_by<TRes>
    implements CopyWith$Input$file_order_by<TRes> {
  _CopyWithImpl$Input$file_order_by(
    this._instance,
    this._then,
  );

  final Input$file_order_by _instance;

  final TRes Function(Input$file_order_by) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_id = _undefined,
    Object? name = _undefined,
    Object? public = _undefined,
    Object? signed_url = _undefined,
    Object? type = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$file_order_by._({
        ..._instance._$data,
        if (file_id != _undefined) 'file_id': (file_id as Enum$order_by?),
        if (name != _undefined) 'name': (name as Enum$order_by?),
        if (public != _undefined) 'public': (public as Enum$order_by?),
        if (signed_url != _undefined)
          'signed_url': (signed_url as Enum$order_by?),
        if (type != _undefined) 'type': (type as Enum$order_by?),
        if (user_id != _undefined) 'user_id': (user_id as Enum$order_by?),
      }));
}

class _CopyWithStubImpl$Input$file_order_by<TRes>
    implements CopyWith$Input$file_order_by<TRes> {
  _CopyWithStubImpl$Input$file_order_by(this._res);

  TRes _res;

  call({
    Enum$order_by? file_id,
    Enum$order_by? name,
    Enum$order_by? public,
    Enum$order_by? signed_url,
    Enum$order_by? type,
    Enum$order_by? user_id,
  }) =>
      _res;
}

class Input$file_pk_columns_input {
  factory Input$file_pk_columns_input({required String file_id}) =>
      Input$file_pk_columns_input._({
        r'file_id': file_id,
      });

  Input$file_pk_columns_input._(this._$data);

  factory Input$file_pk_columns_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$file_id = data['file_id'];
    result$data['file_id'] = (l$file_id as String);
    return Input$file_pk_columns_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String get file_id => (_$data['file_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$file_id = file_id;
    result$data['file_id'] = l$file_id;
    return result$data;
  }

  CopyWith$Input$file_pk_columns_input<Input$file_pk_columns_input>
      get copyWith => CopyWith$Input$file_pk_columns_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_pk_columns_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (l$file_id != lOther$file_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_id = file_id;
    return Object.hashAll([l$file_id]);
  }
}

abstract class CopyWith$Input$file_pk_columns_input<TRes> {
  factory CopyWith$Input$file_pk_columns_input(
    Input$file_pk_columns_input instance,
    TRes Function(Input$file_pk_columns_input) then,
  ) = _CopyWithImpl$Input$file_pk_columns_input;

  factory CopyWith$Input$file_pk_columns_input.stub(TRes res) =
      _CopyWithStubImpl$Input$file_pk_columns_input;

  TRes call({String? file_id});
}

class _CopyWithImpl$Input$file_pk_columns_input<TRes>
    implements CopyWith$Input$file_pk_columns_input<TRes> {
  _CopyWithImpl$Input$file_pk_columns_input(
    this._instance,
    this._then,
  );

  final Input$file_pk_columns_input _instance;

  final TRes Function(Input$file_pk_columns_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? file_id = _undefined}) =>
      _then(Input$file_pk_columns_input._({
        ..._instance._$data,
        if (file_id != _undefined && file_id != null)
          'file_id': (file_id as String),
      }));
}

class _CopyWithStubImpl$Input$file_pk_columns_input<TRes>
    implements CopyWith$Input$file_pk_columns_input<TRes> {
  _CopyWithStubImpl$Input$file_pk_columns_input(this._res);

  TRes _res;

  call({String? file_id}) => _res;
}

class Input$file_set_input {
  factory Input$file_set_input({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      Input$file_set_input._({
        if (file_id != null) r'file_id': file_id,
        if (name != null) r'name': name,
        if (public != null) r'public': public,
        if (signed_url != null) r'signed_url': signed_url,
        if (type != null) r'type': type,
        if (user_id != null) r'user_id': user_id,
      });

  Input$file_set_input._(this._$data);

  factory Input$file_set_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('file_id')) {
      final l$file_id = data['file_id'];
      result$data['file_id'] = (l$file_id as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('public')) {
      final l$public = data['public'];
      result$data['public'] = (l$public as bool?);
    }
    if (data.containsKey('signed_url')) {
      final l$signed_url = data['signed_url'];
      result$data['signed_url'] = (l$signed_url as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$file_set_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get file_id => (_$data['file_id'] as String?);
  String? get name => (_$data['name'] as String?);
  bool? get public => (_$data['public'] as bool?);
  String? get signed_url => (_$data['signed_url'] as String?);
  String? get type => (_$data['type'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('file_id')) {
      final l$file_id = file_id;
      result$data['file_id'] = l$file_id;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('public')) {
      final l$public = public;
      result$data['public'] = l$public;
    }
    if (_$data.containsKey('signed_url')) {
      final l$signed_url = signed_url;
      result$data['signed_url'] = l$signed_url;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$file_set_input<Input$file_set_input> get copyWith =>
      CopyWith$Input$file_set_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_set_input) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (_$data.containsKey('file_id') != other._$data.containsKey('file_id')) {
      return false;
    }
    if (l$file_id != lOther$file_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (_$data.containsKey('public') != other._$data.containsKey('public')) {
      return false;
    }
    if (l$public != lOther$public) {
      return false;
    }
    final l$signed_url = signed_url;
    final lOther$signed_url = other.signed_url;
    if (_$data.containsKey('signed_url') !=
        other._$data.containsKey('signed_url')) {
      return false;
    }
    if (l$signed_url != lOther$signed_url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_id = file_id;
    final l$name = name;
    final l$public = public;
    final l$signed_url = signed_url;
    final l$type = type;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('file_id') ? l$file_id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('public') ? l$public : const {},
      _$data.containsKey('signed_url') ? l$signed_url : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_set_input<TRes> {
  factory CopyWith$Input$file_set_input(
    Input$file_set_input instance,
    TRes Function(Input$file_set_input) then,
  ) = _CopyWithImpl$Input$file_set_input;

  factory CopyWith$Input$file_set_input.stub(TRes res) =
      _CopyWithStubImpl$Input$file_set_input;

  TRes call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  });
}

class _CopyWithImpl$Input$file_set_input<TRes>
    implements CopyWith$Input$file_set_input<TRes> {
  _CopyWithImpl$Input$file_set_input(
    this._instance,
    this._then,
  );

  final Input$file_set_input _instance;

  final TRes Function(Input$file_set_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_id = _undefined,
    Object? name = _undefined,
    Object? public = _undefined,
    Object? signed_url = _undefined,
    Object? type = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$file_set_input._({
        ..._instance._$data,
        if (file_id != _undefined) 'file_id': (file_id as String?),
        if (name != _undefined) 'name': (name as String?),
        if (public != _undefined) 'public': (public as bool?),
        if (signed_url != _undefined) 'signed_url': (signed_url as String?),
        if (type != _undefined) 'type': (type as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$file_set_input<TRes>
    implements CopyWith$Input$file_set_input<TRes> {
  _CopyWithStubImpl$Input$file_set_input(this._res);

  TRes _res;

  call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      _res;
}

class Input$file_stream_cursor_input {
  factory Input$file_stream_cursor_input({
    required Input$file_stream_cursor_value_input initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      Input$file_stream_cursor_input._({
        r'initial_value': initial_value,
        if (ordering != null) r'ordering': ordering,
      });

  Input$file_stream_cursor_input._(this._$data);

  factory Input$file_stream_cursor_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$initial_value = data['initial_value'];
    result$data['initial_value'] =
        Input$file_stream_cursor_value_input.fromJson(
            (l$initial_value as Map<String, dynamic>));
    if (data.containsKey('ordering')) {
      final l$ordering = data['ordering'];
      result$data['ordering'] = l$ordering == null
          ? null
          : fromJson$Enum$cursor_ordering((l$ordering as String));
    }
    return Input$file_stream_cursor_input._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$file_stream_cursor_value_input get initial_value =>
      (_$data['initial_value'] as Input$file_stream_cursor_value_input);
  Enum$cursor_ordering? get ordering =>
      (_$data['ordering'] as Enum$cursor_ordering?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$initial_value = initial_value;
    result$data['initial_value'] = l$initial_value.toJson();
    if (_$data.containsKey('ordering')) {
      final l$ordering = ordering;
      result$data['ordering'] =
          l$ordering == null ? null : toJson$Enum$cursor_ordering(l$ordering);
    }
    return result$data;
  }

  CopyWith$Input$file_stream_cursor_input<Input$file_stream_cursor_input>
      get copyWith => CopyWith$Input$file_stream_cursor_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_stream_cursor_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initial_value = initial_value;
    final lOther$initial_value = other.initial_value;
    if (l$initial_value != lOther$initial_value) {
      return false;
    }
    final l$ordering = ordering;
    final lOther$ordering = other.ordering;
    if (_$data.containsKey('ordering') !=
        other._$data.containsKey('ordering')) {
      return false;
    }
    if (l$ordering != lOther$ordering) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$initial_value = initial_value;
    final l$ordering = ordering;
    return Object.hashAll([
      l$initial_value,
      _$data.containsKey('ordering') ? l$ordering : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_stream_cursor_input<TRes> {
  factory CopyWith$Input$file_stream_cursor_input(
    Input$file_stream_cursor_input instance,
    TRes Function(Input$file_stream_cursor_input) then,
  ) = _CopyWithImpl$Input$file_stream_cursor_input;

  factory CopyWith$Input$file_stream_cursor_input.stub(TRes res) =
      _CopyWithStubImpl$Input$file_stream_cursor_input;

  TRes call({
    Input$file_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  });
  CopyWith$Input$file_stream_cursor_value_input<TRes> get initial_value;
}

class _CopyWithImpl$Input$file_stream_cursor_input<TRes>
    implements CopyWith$Input$file_stream_cursor_input<TRes> {
  _CopyWithImpl$Input$file_stream_cursor_input(
    this._instance,
    this._then,
  );

  final Input$file_stream_cursor_input _instance;

  final TRes Function(Input$file_stream_cursor_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initial_value = _undefined,
    Object? ordering = _undefined,
  }) =>
      _then(Input$file_stream_cursor_input._({
        ..._instance._$data,
        if (initial_value != _undefined && initial_value != null)
          'initial_value':
              (initial_value as Input$file_stream_cursor_value_input),
        if (ordering != _undefined)
          'ordering': (ordering as Enum$cursor_ordering?),
      }));
  CopyWith$Input$file_stream_cursor_value_input<TRes> get initial_value {
    final local$initial_value = _instance.initial_value;
    return CopyWith$Input$file_stream_cursor_value_input(
        local$initial_value, (e) => call(initial_value: e));
  }
}

class _CopyWithStubImpl$Input$file_stream_cursor_input<TRes>
    implements CopyWith$Input$file_stream_cursor_input<TRes> {
  _CopyWithStubImpl$Input$file_stream_cursor_input(this._res);

  TRes _res;

  call({
    Input$file_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      _res;
  CopyWith$Input$file_stream_cursor_value_input<TRes> get initial_value =>
      CopyWith$Input$file_stream_cursor_value_input.stub(_res);
}

class Input$file_stream_cursor_value_input {
  factory Input$file_stream_cursor_value_input({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      Input$file_stream_cursor_value_input._({
        if (file_id != null) r'file_id': file_id,
        if (name != null) r'name': name,
        if (public != null) r'public': public,
        if (signed_url != null) r'signed_url': signed_url,
        if (type != null) r'type': type,
        if (user_id != null) r'user_id': user_id,
      });

  Input$file_stream_cursor_value_input._(this._$data);

  factory Input$file_stream_cursor_value_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('file_id')) {
      final l$file_id = data['file_id'];
      result$data['file_id'] = (l$file_id as String?);
    }
    if (data.containsKey('name')) {
      final l$name = data['name'];
      result$data['name'] = (l$name as String?);
    }
    if (data.containsKey('public')) {
      final l$public = data['public'];
      result$data['public'] = (l$public as bool?);
    }
    if (data.containsKey('signed_url')) {
      final l$signed_url = data['signed_url'];
      result$data['signed_url'] = (l$signed_url as String?);
    }
    if (data.containsKey('type')) {
      final l$type = data['type'];
      result$data['type'] = (l$type as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$file_stream_cursor_value_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get file_id => (_$data['file_id'] as String?);
  String? get name => (_$data['name'] as String?);
  bool? get public => (_$data['public'] as bool?);
  String? get signed_url => (_$data['signed_url'] as String?);
  String? get type => (_$data['type'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('file_id')) {
      final l$file_id = file_id;
      result$data['file_id'] = l$file_id;
    }
    if (_$data.containsKey('name')) {
      final l$name = name;
      result$data['name'] = l$name;
    }
    if (_$data.containsKey('public')) {
      final l$public = public;
      result$data['public'] = l$public;
    }
    if (_$data.containsKey('signed_url')) {
      final l$signed_url = signed_url;
      result$data['signed_url'] = l$signed_url;
    }
    if (_$data.containsKey('type')) {
      final l$type = type;
      result$data['type'] = l$type;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$file_stream_cursor_value_input<
          Input$file_stream_cursor_value_input>
      get copyWith => CopyWith$Input$file_stream_cursor_value_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_stream_cursor_value_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$file_id = file_id;
    final lOther$file_id = other.file_id;
    if (_$data.containsKey('file_id') != other._$data.containsKey('file_id')) {
      return false;
    }
    if (l$file_id != lOther$file_id) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (_$data.containsKey('name') != other._$data.containsKey('name')) {
      return false;
    }
    if (l$name != lOther$name) {
      return false;
    }
    final l$public = public;
    final lOther$public = other.public;
    if (_$data.containsKey('public') != other._$data.containsKey('public')) {
      return false;
    }
    if (l$public != lOther$public) {
      return false;
    }
    final l$signed_url = signed_url;
    final lOther$signed_url = other.signed_url;
    if (_$data.containsKey('signed_url') !=
        other._$data.containsKey('signed_url')) {
      return false;
    }
    if (l$signed_url != lOther$signed_url) {
      return false;
    }
    final l$type = type;
    final lOther$type = other.type;
    if (_$data.containsKey('type') != other._$data.containsKey('type')) {
      return false;
    }
    if (l$type != lOther$type) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$file_id = file_id;
    final l$name = name;
    final l$public = public;
    final l$signed_url = signed_url;
    final l$type = type;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('file_id') ? l$file_id : const {},
      _$data.containsKey('name') ? l$name : const {},
      _$data.containsKey('public') ? l$public : const {},
      _$data.containsKey('signed_url') ? l$signed_url : const {},
      _$data.containsKey('type') ? l$type : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$file_stream_cursor_value_input<TRes> {
  factory CopyWith$Input$file_stream_cursor_value_input(
    Input$file_stream_cursor_value_input instance,
    TRes Function(Input$file_stream_cursor_value_input) then,
  ) = _CopyWithImpl$Input$file_stream_cursor_value_input;

  factory CopyWith$Input$file_stream_cursor_value_input.stub(TRes res) =
      _CopyWithStubImpl$Input$file_stream_cursor_value_input;

  TRes call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  });
}

class _CopyWithImpl$Input$file_stream_cursor_value_input<TRes>
    implements CopyWith$Input$file_stream_cursor_value_input<TRes> {
  _CopyWithImpl$Input$file_stream_cursor_value_input(
    this._instance,
    this._then,
  );

  final Input$file_stream_cursor_value_input _instance;

  final TRes Function(Input$file_stream_cursor_value_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? file_id = _undefined,
    Object? name = _undefined,
    Object? public = _undefined,
    Object? signed_url = _undefined,
    Object? type = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$file_stream_cursor_value_input._({
        ..._instance._$data,
        if (file_id != _undefined) 'file_id': (file_id as String?),
        if (name != _undefined) 'name': (name as String?),
        if (public != _undefined) 'public': (public as bool?),
        if (signed_url != _undefined) 'signed_url': (signed_url as String?),
        if (type != _undefined) 'type': (type as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$file_stream_cursor_value_input<TRes>
    implements CopyWith$Input$file_stream_cursor_value_input<TRes> {
  _CopyWithStubImpl$Input$file_stream_cursor_value_input(this._res);

  TRes _res;

  call({
    String? file_id,
    String? name,
    bool? public,
    String? signed_url,
    String? type,
    String? user_id,
  }) =>
      _res;
}

class Input$file_updates {
  factory Input$file_updates({
    Input$file_set_input? $_set,
    required Input$file_bool_exp where,
  }) =>
      Input$file_updates._({
        if ($_set != null) r'_set': $_set,
        r'where': where,
      });

  Input$file_updates._(this._$data);

  factory Input$file_updates.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_set')) {
      final l$$_set = data['_set'];
      result$data['_set'] = l$$_set == null
          ? null
          : Input$file_set_input.fromJson((l$$_set as Map<String, dynamic>));
    }
    final l$where = data['where'];
    result$data['where'] =
        Input$file_bool_exp.fromJson((l$where as Map<String, dynamic>));
    return Input$file_updates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$file_set_input? get $_set => (_$data['_set'] as Input$file_set_input?);
  Input$file_bool_exp get where => (_$data['where'] as Input$file_bool_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_set')) {
      final l$$_set = $_set;
      result$data['_set'] = l$$_set?.toJson();
    }
    final l$where = where;
    result$data['where'] = l$where.toJson();
    return result$data;
  }

  CopyWith$Input$file_updates<Input$file_updates> get copyWith =>
      CopyWith$Input$file_updates(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$file_updates) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_set = $_set;
    final lOther$$_set = other.$_set;
    if (_$data.containsKey('_set') != other._$data.containsKey('_set')) {
      return false;
    }
    if (l$$_set != lOther$$_set) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_set = $_set;
    final l$where = where;
    return Object.hashAll([
      _$data.containsKey('_set') ? l$$_set : const {},
      l$where,
    ]);
  }
}

abstract class CopyWith$Input$file_updates<TRes> {
  factory CopyWith$Input$file_updates(
    Input$file_updates instance,
    TRes Function(Input$file_updates) then,
  ) = _CopyWithImpl$Input$file_updates;

  factory CopyWith$Input$file_updates.stub(TRes res) =
      _CopyWithStubImpl$Input$file_updates;

  TRes call({
    Input$file_set_input? $_set,
    Input$file_bool_exp? where,
  });
  CopyWith$Input$file_set_input<TRes> get $_set;
  CopyWith$Input$file_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$file_updates<TRes>
    implements CopyWith$Input$file_updates<TRes> {
  _CopyWithImpl$Input$file_updates(
    this._instance,
    this._then,
  );

  final Input$file_updates _instance;

  final TRes Function(Input$file_updates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_set = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$file_updates._({
        ..._instance._$data,
        if ($_set != _undefined) '_set': ($_set as Input$file_set_input?),
        if (where != _undefined && where != null)
          'where': (where as Input$file_bool_exp),
      }));
  CopyWith$Input$file_set_input<TRes> get $_set {
    final local$$_set = _instance.$_set;
    return local$$_set == null
        ? CopyWith$Input$file_set_input.stub(_then(_instance))
        : CopyWith$Input$file_set_input(local$$_set, (e) => call($_set: e));
  }

  CopyWith$Input$file_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return CopyWith$Input$file_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$file_updates<TRes>
    implements CopyWith$Input$file_updates<TRes> {
  _CopyWithStubImpl$Input$file_updates(this._res);

  TRes _res;

  call({
    Input$file_set_input? $_set,
    Input$file_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$file_set_input<TRes> get $_set =>
      CopyWith$Input$file_set_input.stub(_res);
  CopyWith$Input$file_bool_exp<TRes> get where =>
      CopyWith$Input$file_bool_exp.stub(_res);
}

class Input$public_user_bool_exp {
  factory Input$public_user_bool_exp({
    List<Input$public_user_bool_exp>? $_and,
    Input$public_user_bool_exp? $_not,
    List<Input$public_user_bool_exp>? $_or,
    Input$String_comparison_exp? message,
    Input$Int_comparison_exp? number,
    Input$String_comparison_exp? user_id,
  }) =>
      Input$public_user_bool_exp._({
        if ($_and != null) r'_and': $_and,
        if ($_not != null) r'_not': $_not,
        if ($_or != null) r'_or': $_or,
        if (message != null) r'message': message,
        if (number != null) r'number': number,
        if (user_id != null) r'user_id': user_id,
      });

  Input$public_user_bool_exp._(this._$data);

  factory Input$public_user_bool_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_and')) {
      final l$$_and = data['_and'];
      result$data['_and'] = (l$$_and as List<dynamic>?)
          ?.map((e) =>
              Input$public_user_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('_not')) {
      final l$$_not = data['_not'];
      result$data['_not'] = l$$_not == null
          ? null
          : Input$public_user_bool_exp.fromJson(
              (l$$_not as Map<String, dynamic>));
    }
    if (data.containsKey('_or')) {
      final l$$_or = data['_or'];
      result$data['_or'] = (l$$_or as List<dynamic>?)
          ?.map((e) =>
              Input$public_user_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = l$message == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$message as Map<String, dynamic>));
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = l$number == null
          ? null
          : Input$Int_comparison_exp.fromJson(
              (l$number as Map<String, dynamic>));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$user_id as Map<String, dynamic>));
    }
    return Input$public_user_bool_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$public_user_bool_exp>? get $_and =>
      (_$data['_and'] as List<Input$public_user_bool_exp>?);
  Input$public_user_bool_exp? get $_not =>
      (_$data['_not'] as Input$public_user_bool_exp?);
  List<Input$public_user_bool_exp>? get $_or =>
      (_$data['_or'] as List<Input$public_user_bool_exp>?);
  Input$String_comparison_exp? get message =>
      (_$data['message'] as Input$String_comparison_exp?);
  Input$Int_comparison_exp? get number =>
      (_$data['number'] as Input$Int_comparison_exp?);
  Input$String_comparison_exp? get user_id =>
      (_$data['user_id'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_and')) {
      final l$$_and = $_and;
      result$data['_and'] = l$$_and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('_not')) {
      final l$$_not = $_not;
      result$data['_not'] = l$$_not?.toJson();
    }
    if (_$data.containsKey('_or')) {
      final l$$_or = $_or;
      result$data['_or'] = l$$_or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] = l$message?.toJson();
    }
    if (_$data.containsKey('number')) {
      final l$number = number;
      result$data['number'] = l$number?.toJson();
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$public_user_bool_exp<Input$public_user_bool_exp>
      get copyWith => CopyWith$Input$public_user_bool_exp(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_bool_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_and = $_and;
    final lOther$$_and = other.$_and;
    if (_$data.containsKey('_and') != other._$data.containsKey('_and')) {
      return false;
    }
    if (l$$_and != null && lOther$$_and != null) {
      if (l$$_and.length != lOther$$_and.length) {
        return false;
      }
      for (int i = 0; i < l$$_and.length; i++) {
        final l$$_and$entry = l$$_and[i];
        final lOther$$_and$entry = lOther$$_and[i];
        if (l$$_and$entry != lOther$$_and$entry) {
          return false;
        }
      }
    } else if (l$$_and != lOther$$_and) {
      return false;
    }
    final l$$_not = $_not;
    final lOther$$_not = other.$_not;
    if (_$data.containsKey('_not') != other._$data.containsKey('_not')) {
      return false;
    }
    if (l$$_not != lOther$$_not) {
      return false;
    }
    final l$$_or = $_or;
    final lOther$$_or = other.$_or;
    if (_$data.containsKey('_or') != other._$data.containsKey('_or')) {
      return false;
    }
    if (l$$_or != null && lOther$$_or != null) {
      if (l$$_or.length != lOther$$_or.length) {
        return false;
      }
      for (int i = 0; i < l$$_or.length; i++) {
        final l$$_or$entry = l$$_or[i];
        final lOther$$_or$entry = lOther$$_or[i];
        if (l$$_or$entry != lOther$$_or$entry) {
          return false;
        }
      }
    } else if (l$$_or != lOther$$_or) {
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
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_and = $_and;
    final l$$_not = $_not;
    final l$$_or = $_or;
    final l$message = message;
    final l$number = number;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('_and')
          ? l$$_and == null
              ? null
              : Object.hashAll(l$$_and.map((v) => v))
          : const {},
      _$data.containsKey('_not') ? l$$_not : const {},
      _$data.containsKey('_or')
          ? l$$_or == null
              ? null
              : Object.hashAll(l$$_or.map((v) => v))
          : const {},
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_bool_exp<TRes> {
  factory CopyWith$Input$public_user_bool_exp(
    Input$public_user_bool_exp instance,
    TRes Function(Input$public_user_bool_exp) then,
  ) = _CopyWithImpl$Input$public_user_bool_exp;

  factory CopyWith$Input$public_user_bool_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_bool_exp;

  TRes call({
    List<Input$public_user_bool_exp>? $_and,
    Input$public_user_bool_exp? $_not,
    List<Input$public_user_bool_exp>? $_or,
    Input$String_comparison_exp? message,
    Input$Int_comparison_exp? number,
    Input$String_comparison_exp? user_id,
  });
  TRes $_and(
      Iterable<Input$public_user_bool_exp>? Function(
              Iterable<
                  CopyWith$Input$public_user_bool_exp<
                      Input$public_user_bool_exp>>?)
          _fn);
  CopyWith$Input$public_user_bool_exp<TRes> get $_not;
  TRes $_or(
      Iterable<Input$public_user_bool_exp>? Function(
              Iterable<
                  CopyWith$Input$public_user_bool_exp<
                      Input$public_user_bool_exp>>?)
          _fn);
  CopyWith$Input$String_comparison_exp<TRes> get message;
  CopyWith$Input$Int_comparison_exp<TRes> get number;
  CopyWith$Input$String_comparison_exp<TRes> get user_id;
}

class _CopyWithImpl$Input$public_user_bool_exp<TRes>
    implements CopyWith$Input$public_user_bool_exp<TRes> {
  _CopyWithImpl$Input$public_user_bool_exp(
    this._instance,
    this._then,
  );

  final Input$public_user_bool_exp _instance;

  final TRes Function(Input$public_user_bool_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_and = _undefined,
    Object? $_not = _undefined,
    Object? $_or = _undefined,
    Object? message = _undefined,
    Object? number = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$public_user_bool_exp._({
        ..._instance._$data,
        if ($_and != _undefined)
          '_and': ($_and as List<Input$public_user_bool_exp>?),
        if ($_not != _undefined) '_not': ($_not as Input$public_user_bool_exp?),
        if ($_or != _undefined)
          '_or': ($_or as List<Input$public_user_bool_exp>?),
        if (message != _undefined)
          'message': (message as Input$String_comparison_exp?),
        if (number != _undefined)
          'number': (number as Input$Int_comparison_exp?),
        if (user_id != _undefined)
          'user_id': (user_id as Input$String_comparison_exp?),
      }));
  TRes $_and(
          Iterable<Input$public_user_bool_exp>? Function(
                  Iterable<
                      CopyWith$Input$public_user_bool_exp<
                          Input$public_user_bool_exp>>?)
              _fn) =>
      call(
          $_and: _fn(
              _instance.$_and?.map((e) => CopyWith$Input$public_user_bool_exp(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Input$public_user_bool_exp<TRes> get $_not {
    final local$$_not = _instance.$_not;
    return local$$_not == null
        ? CopyWith$Input$public_user_bool_exp.stub(_then(_instance))
        : CopyWith$Input$public_user_bool_exp(
            local$$_not, (e) => call($_not: e));
  }

  TRes $_or(
          Iterable<Input$public_user_bool_exp>? Function(
                  Iterable<
                      CopyWith$Input$public_user_bool_exp<
                          Input$public_user_bool_exp>>?)
              _fn) =>
      call(
          $_or: _fn(
              _instance.$_or?.map((e) => CopyWith$Input$public_user_bool_exp(
                    e,
                    (i) => i,
                  )))?.toList());
  CopyWith$Input$String_comparison_exp<TRes> get message {
    final local$message = _instance.message;
    return local$message == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$message, (e) => call(message: e));
  }

  CopyWith$Input$Int_comparison_exp<TRes> get number {
    final local$number = _instance.number;
    return local$number == null
        ? CopyWith$Input$Int_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$Int_comparison_exp(
            local$number, (e) => call(number: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get user_id {
    final local$user_id = _instance.user_id;
    return local$user_id == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$user_id, (e) => call(user_id: e));
  }
}

class _CopyWithStubImpl$Input$public_user_bool_exp<TRes>
    implements CopyWith$Input$public_user_bool_exp<TRes> {
  _CopyWithStubImpl$Input$public_user_bool_exp(this._res);

  TRes _res;

  call({
    List<Input$public_user_bool_exp>? $_and,
    Input$public_user_bool_exp? $_not,
    List<Input$public_user_bool_exp>? $_or,
    Input$String_comparison_exp? message,
    Input$Int_comparison_exp? number,
    Input$String_comparison_exp? user_id,
  }) =>
      _res;
  $_and(_fn) => _res;
  CopyWith$Input$public_user_bool_exp<TRes> get $_not =>
      CopyWith$Input$public_user_bool_exp.stub(_res);
  $_or(_fn) => _res;
  CopyWith$Input$String_comparison_exp<TRes> get message =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$Int_comparison_exp<TRes> get number =>
      CopyWith$Input$Int_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get user_id =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}

class Input$public_user_inc_input {
  factory Input$public_user_inc_input({int? number}) =>
      Input$public_user_inc_input._({
        if (number != null) r'number': number,
      });

  Input$public_user_inc_input._(this._$data);

  factory Input$public_user_inc_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    return Input$public_user_inc_input._(result$data);
  }

  Map<String, dynamic> _$data;

  int? get number => (_$data['number'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('number')) {
      final l$number = number;
      result$data['number'] = l$number;
    }
    return result$data;
  }

  CopyWith$Input$public_user_inc_input<Input$public_user_inc_input>
      get copyWith => CopyWith$Input$public_user_inc_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_inc_input) ||
        runtimeType != other.runtimeType) {
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
    final l$number = number;
    return Object.hashAll([_$data.containsKey('number') ? l$number : const {}]);
  }
}

abstract class CopyWith$Input$public_user_inc_input<TRes> {
  factory CopyWith$Input$public_user_inc_input(
    Input$public_user_inc_input instance,
    TRes Function(Input$public_user_inc_input) then,
  ) = _CopyWithImpl$Input$public_user_inc_input;

  factory CopyWith$Input$public_user_inc_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_inc_input;

  TRes call({int? number});
}

class _CopyWithImpl$Input$public_user_inc_input<TRes>
    implements CopyWith$Input$public_user_inc_input<TRes> {
  _CopyWithImpl$Input$public_user_inc_input(
    this._instance,
    this._then,
  );

  final Input$public_user_inc_input _instance;

  final TRes Function(Input$public_user_inc_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? number = _undefined}) =>
      _then(Input$public_user_inc_input._({
        ..._instance._$data,
        if (number != _undefined) 'number': (number as int?),
      }));
}

class _CopyWithStubImpl$Input$public_user_inc_input<TRes>
    implements CopyWith$Input$public_user_inc_input<TRes> {
  _CopyWithStubImpl$Input$public_user_inc_input(this._res);

  TRes _res;

  call({int? number}) => _res;
}

class Input$public_user_insert_input {
  factory Input$public_user_insert_input({
    String? message,
    int? number,
    String? user_id,
  }) =>
      Input$public_user_insert_input._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
        if (user_id != null) r'user_id': user_id,
      });

  Input$public_user_insert_input._(this._$data);

  factory Input$public_user_insert_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$public_user_insert_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get message => (_$data['message'] as String?);
  int? get number => (_$data['number'] as int?);
  String? get user_id => (_$data['user_id'] as String?);
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
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$public_user_insert_input<Input$public_user_insert_input>
      get copyWith => CopyWith$Input$public_user_insert_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_insert_input) ||
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
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_insert_input<TRes> {
  factory CopyWith$Input$public_user_insert_input(
    Input$public_user_insert_input instance,
    TRes Function(Input$public_user_insert_input) then,
  ) = _CopyWithImpl$Input$public_user_insert_input;

  factory CopyWith$Input$public_user_insert_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_insert_input;

  TRes call({
    String? message,
    int? number,
    String? user_id,
  });
}

class _CopyWithImpl$Input$public_user_insert_input<TRes>
    implements CopyWith$Input$public_user_insert_input<TRes> {
  _CopyWithImpl$Input$public_user_insert_input(
    this._instance,
    this._then,
  );

  final Input$public_user_insert_input _instance;

  final TRes Function(Input$public_user_insert_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$public_user_insert_input._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$public_user_insert_input<TRes>
    implements CopyWith$Input$public_user_insert_input<TRes> {
  _CopyWithStubImpl$Input$public_user_insert_input(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? user_id,
  }) =>
      _res;
}

class Input$public_user_on_conflict {
  factory Input$public_user_on_conflict({
    required Enum$public_user_constraint constraint,
    required List<Enum$public_user_update_column> update_columns,
    Input$public_user_bool_exp? where,
  }) =>
      Input$public_user_on_conflict._({
        r'constraint': constraint,
        r'update_columns': update_columns,
        if (where != null) r'where': where,
      });

  Input$public_user_on_conflict._(this._$data);

  factory Input$public_user_on_conflict.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$constraint = data['constraint'];
    result$data['constraint'] =
        fromJson$Enum$public_user_constraint((l$constraint as String));
    final l$update_columns = data['update_columns'];
    result$data['update_columns'] = (l$update_columns as List<dynamic>)
        .map((e) => fromJson$Enum$public_user_update_column((e as String)))
        .toList();
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$public_user_bool_exp.fromJson(
              (l$where as Map<String, dynamic>));
    }
    return Input$public_user_on_conflict._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$public_user_constraint get constraint =>
      (_$data['constraint'] as Enum$public_user_constraint);
  List<Enum$public_user_update_column> get update_columns =>
      (_$data['update_columns'] as List<Enum$public_user_update_column>);
  Input$public_user_bool_exp? get where =>
      (_$data['where'] as Input$public_user_bool_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$constraint = constraint;
    result$data['constraint'] =
        toJson$Enum$public_user_constraint(l$constraint);
    final l$update_columns = update_columns;
    result$data['update_columns'] = l$update_columns
        .map((e) => toJson$Enum$public_user_update_column(e))
        .toList();
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$public_user_on_conflict<Input$public_user_on_conflict>
      get copyWith => CopyWith$Input$public_user_on_conflict(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_on_conflict) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$constraint = constraint;
    final lOther$constraint = other.constraint;
    if (l$constraint != lOther$constraint) {
      return false;
    }
    final l$update_columns = update_columns;
    final lOther$update_columns = other.update_columns;
    if (l$update_columns.length != lOther$update_columns.length) {
      return false;
    }
    for (int i = 0; i < l$update_columns.length; i++) {
      final l$update_columns$entry = l$update_columns[i];
      final lOther$update_columns$entry = lOther$update_columns[i];
      if (l$update_columns$entry != lOther$update_columns$entry) {
        return false;
      }
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$constraint = constraint;
    final l$update_columns = update_columns;
    final l$where = where;
    return Object.hashAll([
      l$constraint,
      Object.hashAll(l$update_columns.map((v) => v)),
      _$data.containsKey('where') ? l$where : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_on_conflict<TRes> {
  factory CopyWith$Input$public_user_on_conflict(
    Input$public_user_on_conflict instance,
    TRes Function(Input$public_user_on_conflict) then,
  ) = _CopyWithImpl$Input$public_user_on_conflict;

  factory CopyWith$Input$public_user_on_conflict.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_on_conflict;

  TRes call({
    Enum$public_user_constraint? constraint,
    List<Enum$public_user_update_column>? update_columns,
    Input$public_user_bool_exp? where,
  });
  CopyWith$Input$public_user_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$public_user_on_conflict<TRes>
    implements CopyWith$Input$public_user_on_conflict<TRes> {
  _CopyWithImpl$Input$public_user_on_conflict(
    this._instance,
    this._then,
  );

  final Input$public_user_on_conflict _instance;

  final TRes Function(Input$public_user_on_conflict) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? constraint = _undefined,
    Object? update_columns = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$public_user_on_conflict._({
        ..._instance._$data,
        if (constraint != _undefined && constraint != null)
          'constraint': (constraint as Enum$public_user_constraint),
        if (update_columns != _undefined && update_columns != null)
          'update_columns':
              (update_columns as List<Enum$public_user_update_column>),
        if (where != _undefined)
          'where': (where as Input$public_user_bool_exp?),
      }));
  CopyWith$Input$public_user_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return local$where == null
        ? CopyWith$Input$public_user_bool_exp.stub(_then(_instance))
        : CopyWith$Input$public_user_bool_exp(
            local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$public_user_on_conflict<TRes>
    implements CopyWith$Input$public_user_on_conflict<TRes> {
  _CopyWithStubImpl$Input$public_user_on_conflict(this._res);

  TRes _res;

  call({
    Enum$public_user_constraint? constraint,
    List<Enum$public_user_update_column>? update_columns,
    Input$public_user_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$public_user_bool_exp<TRes> get where =>
      CopyWith$Input$public_user_bool_exp.stub(_res);
}

class Input$public_user_order_by {
  factory Input$public_user_order_by({
    Enum$order_by? message,
    Enum$order_by? number,
    Enum$order_by? user_id,
  }) =>
      Input$public_user_order_by._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
        if (user_id != null) r'user_id': user_id,
      });

  Input$public_user_order_by._(this._$data);

  factory Input$public_user_order_by.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = l$message == null
          ? null
          : fromJson$Enum$order_by((l$message as String));
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = l$number == null
          ? null
          : fromJson$Enum$order_by((l$number as String));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : fromJson$Enum$order_by((l$user_id as String));
    }
    return Input$public_user_order_by._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$order_by? get message => (_$data['message'] as Enum$order_by?);
  Enum$order_by? get number => (_$data['number'] as Enum$order_by?);
  Enum$order_by? get user_id => (_$data['user_id'] as Enum$order_by?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('message')) {
      final l$message = message;
      result$data['message'] =
          l$message == null ? null : toJson$Enum$order_by(l$message);
    }
    if (_$data.containsKey('number')) {
      final l$number = number;
      result$data['number'] =
          l$number == null ? null : toJson$Enum$order_by(l$number);
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] =
          l$user_id == null ? null : toJson$Enum$order_by(l$user_id);
    }
    return result$data;
  }

  CopyWith$Input$public_user_order_by<Input$public_user_order_by>
      get copyWith => CopyWith$Input$public_user_order_by(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_order_by) ||
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
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_order_by<TRes> {
  factory CopyWith$Input$public_user_order_by(
    Input$public_user_order_by instance,
    TRes Function(Input$public_user_order_by) then,
  ) = _CopyWithImpl$Input$public_user_order_by;

  factory CopyWith$Input$public_user_order_by.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_order_by;

  TRes call({
    Enum$order_by? message,
    Enum$order_by? number,
    Enum$order_by? user_id,
  });
}

class _CopyWithImpl$Input$public_user_order_by<TRes>
    implements CopyWith$Input$public_user_order_by<TRes> {
  _CopyWithImpl$Input$public_user_order_by(
    this._instance,
    this._then,
  );

  final Input$public_user_order_by _instance;

  final TRes Function(Input$public_user_order_by) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$public_user_order_by._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as Enum$order_by?),
        if (number != _undefined) 'number': (number as Enum$order_by?),
        if (user_id != _undefined) 'user_id': (user_id as Enum$order_by?),
      }));
}

class _CopyWithStubImpl$Input$public_user_order_by<TRes>
    implements CopyWith$Input$public_user_order_by<TRes> {
  _CopyWithStubImpl$Input$public_user_order_by(this._res);

  TRes _res;

  call({
    Enum$order_by? message,
    Enum$order_by? number,
    Enum$order_by? user_id,
  }) =>
      _res;
}

class Input$public_user_pk_columns_input {
  factory Input$public_user_pk_columns_input({required String user_id}) =>
      Input$public_user_pk_columns_input._({
        r'user_id': user_id,
      });

  Input$public_user_pk_columns_input._(this._$data);

  factory Input$public_user_pk_columns_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    return Input$public_user_pk_columns_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Input$public_user_pk_columns_input<
          Input$public_user_pk_columns_input>
      get copyWith => CopyWith$Input$public_user_pk_columns_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_pk_columns_input) ||
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

abstract class CopyWith$Input$public_user_pk_columns_input<TRes> {
  factory CopyWith$Input$public_user_pk_columns_input(
    Input$public_user_pk_columns_input instance,
    TRes Function(Input$public_user_pk_columns_input) then,
  ) = _CopyWithImpl$Input$public_user_pk_columns_input;

  factory CopyWith$Input$public_user_pk_columns_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_pk_columns_input;

  TRes call({String? user_id});
}

class _CopyWithImpl$Input$public_user_pk_columns_input<TRes>
    implements CopyWith$Input$public_user_pk_columns_input<TRes> {
  _CopyWithImpl$Input$public_user_pk_columns_input(
    this._instance,
    this._then,
  );

  final Input$public_user_pk_columns_input _instance;

  final TRes Function(Input$public_user_pk_columns_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user_id = _undefined}) =>
      _then(Input$public_user_pk_columns_input._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
      }));
}

class _CopyWithStubImpl$Input$public_user_pk_columns_input<TRes>
    implements CopyWith$Input$public_user_pk_columns_input<TRes> {
  _CopyWithStubImpl$Input$public_user_pk_columns_input(this._res);

  TRes _res;

  call({String? user_id}) => _res;
}

class Input$public_user_set_input {
  factory Input$public_user_set_input({
    String? message,
    int? number,
    String? user_id,
  }) =>
      Input$public_user_set_input._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
        if (user_id != null) r'user_id': user_id,
      });

  Input$public_user_set_input._(this._$data);

  factory Input$public_user_set_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$public_user_set_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get message => (_$data['message'] as String?);
  int? get number => (_$data['number'] as int?);
  String? get user_id => (_$data['user_id'] as String?);
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
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$public_user_set_input<Input$public_user_set_input>
      get copyWith => CopyWith$Input$public_user_set_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_set_input) ||
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
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_set_input<TRes> {
  factory CopyWith$Input$public_user_set_input(
    Input$public_user_set_input instance,
    TRes Function(Input$public_user_set_input) then,
  ) = _CopyWithImpl$Input$public_user_set_input;

  factory CopyWith$Input$public_user_set_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_set_input;

  TRes call({
    String? message,
    int? number,
    String? user_id,
  });
}

class _CopyWithImpl$Input$public_user_set_input<TRes>
    implements CopyWith$Input$public_user_set_input<TRes> {
  _CopyWithImpl$Input$public_user_set_input(
    this._instance,
    this._then,
  );

  final Input$public_user_set_input _instance;

  final TRes Function(Input$public_user_set_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$public_user_set_input._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$public_user_set_input<TRes>
    implements CopyWith$Input$public_user_set_input<TRes> {
  _CopyWithStubImpl$Input$public_user_set_input(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? user_id,
  }) =>
      _res;
}

class Input$public_user_stream_cursor_input {
  factory Input$public_user_stream_cursor_input({
    required Input$public_user_stream_cursor_value_input initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      Input$public_user_stream_cursor_input._({
        r'initial_value': initial_value,
        if (ordering != null) r'ordering': ordering,
      });

  Input$public_user_stream_cursor_input._(this._$data);

  factory Input$public_user_stream_cursor_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$initial_value = data['initial_value'];
    result$data['initial_value'] =
        Input$public_user_stream_cursor_value_input.fromJson(
            (l$initial_value as Map<String, dynamic>));
    if (data.containsKey('ordering')) {
      final l$ordering = data['ordering'];
      result$data['ordering'] = l$ordering == null
          ? null
          : fromJson$Enum$cursor_ordering((l$ordering as String));
    }
    return Input$public_user_stream_cursor_input._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$public_user_stream_cursor_value_input get initial_value =>
      (_$data['initial_value'] as Input$public_user_stream_cursor_value_input);
  Enum$cursor_ordering? get ordering =>
      (_$data['ordering'] as Enum$cursor_ordering?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$initial_value = initial_value;
    result$data['initial_value'] = l$initial_value.toJson();
    if (_$data.containsKey('ordering')) {
      final l$ordering = ordering;
      result$data['ordering'] =
          l$ordering == null ? null : toJson$Enum$cursor_ordering(l$ordering);
    }
    return result$data;
  }

  CopyWith$Input$public_user_stream_cursor_input<
          Input$public_user_stream_cursor_input>
      get copyWith => CopyWith$Input$public_user_stream_cursor_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_stream_cursor_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initial_value = initial_value;
    final lOther$initial_value = other.initial_value;
    if (l$initial_value != lOther$initial_value) {
      return false;
    }
    final l$ordering = ordering;
    final lOther$ordering = other.ordering;
    if (_$data.containsKey('ordering') !=
        other._$data.containsKey('ordering')) {
      return false;
    }
    if (l$ordering != lOther$ordering) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$initial_value = initial_value;
    final l$ordering = ordering;
    return Object.hashAll([
      l$initial_value,
      _$data.containsKey('ordering') ? l$ordering : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_stream_cursor_input<TRes> {
  factory CopyWith$Input$public_user_stream_cursor_input(
    Input$public_user_stream_cursor_input instance,
    TRes Function(Input$public_user_stream_cursor_input) then,
  ) = _CopyWithImpl$Input$public_user_stream_cursor_input;

  factory CopyWith$Input$public_user_stream_cursor_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_stream_cursor_input;

  TRes call({
    Input$public_user_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  });
  CopyWith$Input$public_user_stream_cursor_value_input<TRes> get initial_value;
}

class _CopyWithImpl$Input$public_user_stream_cursor_input<TRes>
    implements CopyWith$Input$public_user_stream_cursor_input<TRes> {
  _CopyWithImpl$Input$public_user_stream_cursor_input(
    this._instance,
    this._then,
  );

  final Input$public_user_stream_cursor_input _instance;

  final TRes Function(Input$public_user_stream_cursor_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initial_value = _undefined,
    Object? ordering = _undefined,
  }) =>
      _then(Input$public_user_stream_cursor_input._({
        ..._instance._$data,
        if (initial_value != _undefined && initial_value != null)
          'initial_value':
              (initial_value as Input$public_user_stream_cursor_value_input),
        if (ordering != _undefined)
          'ordering': (ordering as Enum$cursor_ordering?),
      }));
  CopyWith$Input$public_user_stream_cursor_value_input<TRes> get initial_value {
    final local$initial_value = _instance.initial_value;
    return CopyWith$Input$public_user_stream_cursor_value_input(
        local$initial_value, (e) => call(initial_value: e));
  }
}

class _CopyWithStubImpl$Input$public_user_stream_cursor_input<TRes>
    implements CopyWith$Input$public_user_stream_cursor_input<TRes> {
  _CopyWithStubImpl$Input$public_user_stream_cursor_input(this._res);

  TRes _res;

  call({
    Input$public_user_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      _res;
  CopyWith$Input$public_user_stream_cursor_value_input<TRes>
      get initial_value =>
          CopyWith$Input$public_user_stream_cursor_value_input.stub(_res);
}

class Input$public_user_stream_cursor_value_input {
  factory Input$public_user_stream_cursor_value_input({
    String? message,
    int? number,
    String? user_id,
  }) =>
      Input$public_user_stream_cursor_value_input._({
        if (message != null) r'message': message,
        if (number != null) r'number': number,
        if (user_id != null) r'user_id': user_id,
      });

  Input$public_user_stream_cursor_value_input._(this._$data);

  factory Input$public_user_stream_cursor_value_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('message')) {
      final l$message = data['message'];
      result$data['message'] = (l$message as String?);
    }
    if (data.containsKey('number')) {
      final l$number = data['number'];
      result$data['number'] = (l$number as int?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    return Input$public_user_stream_cursor_value_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get message => (_$data['message'] as String?);
  int? get number => (_$data['number'] as int?);
  String? get user_id => (_$data['user_id'] as String?);
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
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    return result$data;
  }

  CopyWith$Input$public_user_stream_cursor_value_input<
          Input$public_user_stream_cursor_value_input>
      get copyWith => CopyWith$Input$public_user_stream_cursor_value_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_stream_cursor_value_input) ||
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
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$message = message;
    final l$number = number;
    final l$user_id = user_id;
    return Object.hashAll([
      _$data.containsKey('message') ? l$message : const {},
      _$data.containsKey('number') ? l$number : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
    ]);
  }
}

abstract class CopyWith$Input$public_user_stream_cursor_value_input<TRes> {
  factory CopyWith$Input$public_user_stream_cursor_value_input(
    Input$public_user_stream_cursor_value_input instance,
    TRes Function(Input$public_user_stream_cursor_value_input) then,
  ) = _CopyWithImpl$Input$public_user_stream_cursor_value_input;

  factory CopyWith$Input$public_user_stream_cursor_value_input.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_stream_cursor_value_input;

  TRes call({
    String? message,
    int? number,
    String? user_id,
  });
}

class _CopyWithImpl$Input$public_user_stream_cursor_value_input<TRes>
    implements CopyWith$Input$public_user_stream_cursor_value_input<TRes> {
  _CopyWithImpl$Input$public_user_stream_cursor_value_input(
    this._instance,
    this._then,
  );

  final Input$public_user_stream_cursor_value_input _instance;

  final TRes Function(Input$public_user_stream_cursor_value_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? message = _undefined,
    Object? number = _undefined,
    Object? user_id = _undefined,
  }) =>
      _then(Input$public_user_stream_cursor_value_input._({
        ..._instance._$data,
        if (message != _undefined) 'message': (message as String?),
        if (number != _undefined) 'number': (number as int?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
      }));
}

class _CopyWithStubImpl$Input$public_user_stream_cursor_value_input<TRes>
    implements CopyWith$Input$public_user_stream_cursor_value_input<TRes> {
  _CopyWithStubImpl$Input$public_user_stream_cursor_value_input(this._res);

  TRes _res;

  call({
    String? message,
    int? number,
    String? user_id,
  }) =>
      _res;
}

class Input$public_user_updates {
  factory Input$public_user_updates({
    Input$public_user_inc_input? $_inc,
    Input$public_user_set_input? $_set,
    required Input$public_user_bool_exp where,
  }) =>
      Input$public_user_updates._({
        if ($_inc != null) r'_inc': $_inc,
        if ($_set != null) r'_set': $_set,
        r'where': where,
      });

  Input$public_user_updates._(this._$data);

  factory Input$public_user_updates.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_inc')) {
      final l$$_inc = data['_inc'];
      result$data['_inc'] = l$$_inc == null
          ? null
          : Input$public_user_inc_input.fromJson(
              (l$$_inc as Map<String, dynamic>));
    }
    if (data.containsKey('_set')) {
      final l$$_set = data['_set'];
      result$data['_set'] = l$$_set == null
          ? null
          : Input$public_user_set_input.fromJson(
              (l$$_set as Map<String, dynamic>));
    }
    final l$where = data['where'];
    result$data['where'] =
        Input$public_user_bool_exp.fromJson((l$where as Map<String, dynamic>));
    return Input$public_user_updates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$public_user_inc_input? get $_inc =>
      (_$data['_inc'] as Input$public_user_inc_input?);
  Input$public_user_set_input? get $_set =>
      (_$data['_set'] as Input$public_user_set_input?);
  Input$public_user_bool_exp get where =>
      (_$data['where'] as Input$public_user_bool_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_inc')) {
      final l$$_inc = $_inc;
      result$data['_inc'] = l$$_inc?.toJson();
    }
    if (_$data.containsKey('_set')) {
      final l$$_set = $_set;
      result$data['_set'] = l$$_set?.toJson();
    }
    final l$where = where;
    result$data['where'] = l$where.toJson();
    return result$data;
  }

  CopyWith$Input$public_user_updates<Input$public_user_updates> get copyWith =>
      CopyWith$Input$public_user_updates(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$public_user_updates) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_inc = $_inc;
    final lOther$$_inc = other.$_inc;
    if (_$data.containsKey('_inc') != other._$data.containsKey('_inc')) {
      return false;
    }
    if (l$$_inc != lOther$$_inc) {
      return false;
    }
    final l$$_set = $_set;
    final lOther$$_set = other.$_set;
    if (_$data.containsKey('_set') != other._$data.containsKey('_set')) {
      return false;
    }
    if (l$$_set != lOther$$_set) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_inc = $_inc;
    final l$$_set = $_set;
    final l$where = where;
    return Object.hashAll([
      _$data.containsKey('_inc') ? l$$_inc : const {},
      _$data.containsKey('_set') ? l$$_set : const {},
      l$where,
    ]);
  }
}

abstract class CopyWith$Input$public_user_updates<TRes> {
  factory CopyWith$Input$public_user_updates(
    Input$public_user_updates instance,
    TRes Function(Input$public_user_updates) then,
  ) = _CopyWithImpl$Input$public_user_updates;

  factory CopyWith$Input$public_user_updates.stub(TRes res) =
      _CopyWithStubImpl$Input$public_user_updates;

  TRes call({
    Input$public_user_inc_input? $_inc,
    Input$public_user_set_input? $_set,
    Input$public_user_bool_exp? where,
  });
  CopyWith$Input$public_user_inc_input<TRes> get $_inc;
  CopyWith$Input$public_user_set_input<TRes> get $_set;
  CopyWith$Input$public_user_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$public_user_updates<TRes>
    implements CopyWith$Input$public_user_updates<TRes> {
  _CopyWithImpl$Input$public_user_updates(
    this._instance,
    this._then,
  );

  final Input$public_user_updates _instance;

  final TRes Function(Input$public_user_updates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_inc = _undefined,
    Object? $_set = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$public_user_updates._({
        ..._instance._$data,
        if ($_inc != _undefined)
          '_inc': ($_inc as Input$public_user_inc_input?),
        if ($_set != _undefined)
          '_set': ($_set as Input$public_user_set_input?),
        if (where != _undefined && where != null)
          'where': (where as Input$public_user_bool_exp),
      }));
  CopyWith$Input$public_user_inc_input<TRes> get $_inc {
    final local$$_inc = _instance.$_inc;
    return local$$_inc == null
        ? CopyWith$Input$public_user_inc_input.stub(_then(_instance))
        : CopyWith$Input$public_user_inc_input(
            local$$_inc, (e) => call($_inc: e));
  }

  CopyWith$Input$public_user_set_input<TRes> get $_set {
    final local$$_set = _instance.$_set;
    return local$$_set == null
        ? CopyWith$Input$public_user_set_input.stub(_then(_instance))
        : CopyWith$Input$public_user_set_input(
            local$$_set, (e) => call($_set: e));
  }

  CopyWith$Input$public_user_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return CopyWith$Input$public_user_bool_exp(
        local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$public_user_updates<TRes>
    implements CopyWith$Input$public_user_updates<TRes> {
  _CopyWithStubImpl$Input$public_user_updates(this._res);

  TRes _res;

  call({
    Input$public_user_inc_input? $_inc,
    Input$public_user_set_input? $_set,
    Input$public_user_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$public_user_inc_input<TRes> get $_inc =>
      CopyWith$Input$public_user_inc_input.stub(_res);
  CopyWith$Input$public_user_set_input<TRes> get $_set =>
      CopyWith$Input$public_user_set_input.stub(_res);
  CopyWith$Input$public_user_bool_exp<TRes> get where =>
      CopyWith$Input$public_user_bool_exp.stub(_res);
}

class Input$timestamptz_comparison_exp {
  factory Input$timestamptz_comparison_exp({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    List<String>? $_in,
    bool? $_is_null,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    List<String>? $_nin,
  }) =>
      Input$timestamptz_comparison_exp._({
        if ($_eq != null) r'_eq': $_eq,
        if ($_gt != null) r'_gt': $_gt,
        if ($_gte != null) r'_gte': $_gte,
        if ($_in != null) r'_in': $_in,
        if ($_is_null != null) r'_is_null': $_is_null,
        if ($_lt != null) r'_lt': $_lt,
        if ($_lte != null) r'_lte': $_lte,
        if ($_neq != null) r'_neq': $_neq,
        if ($_nin != null) r'_nin': $_nin,
      });

  Input$timestamptz_comparison_exp._(this._$data);

  factory Input$timestamptz_comparison_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_eq')) {
      final l$$_eq = data['_eq'];
      result$data['_eq'] = (l$$_eq as String?);
    }
    if (data.containsKey('_gt')) {
      final l$$_gt = data['_gt'];
      result$data['_gt'] = (l$$_gt as String?);
    }
    if (data.containsKey('_gte')) {
      final l$$_gte = data['_gte'];
      result$data['_gte'] = (l$$_gte as String?);
    }
    if (data.containsKey('_in')) {
      final l$$_in = data['_in'];
      result$data['_in'] =
          (l$$_in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('_is_null')) {
      final l$$_is_null = data['_is_null'];
      result$data['_is_null'] = (l$$_is_null as bool?);
    }
    if (data.containsKey('_lt')) {
      final l$$_lt = data['_lt'];
      result$data['_lt'] = (l$$_lt as String?);
    }
    if (data.containsKey('_lte')) {
      final l$$_lte = data['_lte'];
      result$data['_lte'] = (l$$_lte as String?);
    }
    if (data.containsKey('_neq')) {
      final l$$_neq = data['_neq'];
      result$data['_neq'] = (l$$_neq as String?);
    }
    if (data.containsKey('_nin')) {
      final l$$_nin = data['_nin'];
      result$data['_nin'] =
          (l$$_nin as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$timestamptz_comparison_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get $_eq => (_$data['_eq'] as String?);
  String? get $_gt => (_$data['_gt'] as String?);
  String? get $_gte => (_$data['_gte'] as String?);
  List<String>? get $_in => (_$data['_in'] as List<String>?);
  bool? get $_is_null => (_$data['_is_null'] as bool?);
  String? get $_lt => (_$data['_lt'] as String?);
  String? get $_lte => (_$data['_lte'] as String?);
  String? get $_neq => (_$data['_neq'] as String?);
  List<String>? get $_nin => (_$data['_nin'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_eq')) {
      final l$$_eq = $_eq;
      result$data['_eq'] = l$$_eq;
    }
    if (_$data.containsKey('_gt')) {
      final l$$_gt = $_gt;
      result$data['_gt'] = l$$_gt;
    }
    if (_$data.containsKey('_gte')) {
      final l$$_gte = $_gte;
      result$data['_gte'] = l$$_gte;
    }
    if (_$data.containsKey('_in')) {
      final l$$_in = $_in;
      result$data['_in'] = l$$_in?.map((e) => e).toList();
    }
    if (_$data.containsKey('_is_null')) {
      final l$$_is_null = $_is_null;
      result$data['_is_null'] = l$$_is_null;
    }
    if (_$data.containsKey('_lt')) {
      final l$$_lt = $_lt;
      result$data['_lt'] = l$$_lt;
    }
    if (_$data.containsKey('_lte')) {
      final l$$_lte = $_lte;
      result$data['_lte'] = l$$_lte;
    }
    if (_$data.containsKey('_neq')) {
      final l$$_neq = $_neq;
      result$data['_neq'] = l$$_neq;
    }
    if (_$data.containsKey('_nin')) {
      final l$$_nin = $_nin;
      result$data['_nin'] = l$$_nin?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$timestamptz_comparison_exp<Input$timestamptz_comparison_exp>
      get copyWith => CopyWith$Input$timestamptz_comparison_exp(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$timestamptz_comparison_exp) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_eq = $_eq;
    final lOther$$_eq = other.$_eq;
    if (_$data.containsKey('_eq') != other._$data.containsKey('_eq')) {
      return false;
    }
    if (l$$_eq != lOther$$_eq) {
      return false;
    }
    final l$$_gt = $_gt;
    final lOther$$_gt = other.$_gt;
    if (_$data.containsKey('_gt') != other._$data.containsKey('_gt')) {
      return false;
    }
    if (l$$_gt != lOther$$_gt) {
      return false;
    }
    final l$$_gte = $_gte;
    final lOther$$_gte = other.$_gte;
    if (_$data.containsKey('_gte') != other._$data.containsKey('_gte')) {
      return false;
    }
    if (l$$_gte != lOther$$_gte) {
      return false;
    }
    final l$$_in = $_in;
    final lOther$$_in = other.$_in;
    if (_$data.containsKey('_in') != other._$data.containsKey('_in')) {
      return false;
    }
    if (l$$_in != null && lOther$$_in != null) {
      if (l$$_in.length != lOther$$_in.length) {
        return false;
      }
      for (int i = 0; i < l$$_in.length; i++) {
        final l$$_in$entry = l$$_in[i];
        final lOther$$_in$entry = lOther$$_in[i];
        if (l$$_in$entry != lOther$$_in$entry) {
          return false;
        }
      }
    } else if (l$$_in != lOther$$_in) {
      return false;
    }
    final l$$_is_null = $_is_null;
    final lOther$$_is_null = other.$_is_null;
    if (_$data.containsKey('_is_null') !=
        other._$data.containsKey('_is_null')) {
      return false;
    }
    if (l$$_is_null != lOther$$_is_null) {
      return false;
    }
    final l$$_lt = $_lt;
    final lOther$$_lt = other.$_lt;
    if (_$data.containsKey('_lt') != other._$data.containsKey('_lt')) {
      return false;
    }
    if (l$$_lt != lOther$$_lt) {
      return false;
    }
    final l$$_lte = $_lte;
    final lOther$$_lte = other.$_lte;
    if (_$data.containsKey('_lte') != other._$data.containsKey('_lte')) {
      return false;
    }
    if (l$$_lte != lOther$$_lte) {
      return false;
    }
    final l$$_neq = $_neq;
    final lOther$$_neq = other.$_neq;
    if (_$data.containsKey('_neq') != other._$data.containsKey('_neq')) {
      return false;
    }
    if (l$$_neq != lOther$$_neq) {
      return false;
    }
    final l$$_nin = $_nin;
    final lOther$$_nin = other.$_nin;
    if (_$data.containsKey('_nin') != other._$data.containsKey('_nin')) {
      return false;
    }
    if (l$$_nin != null && lOther$$_nin != null) {
      if (l$$_nin.length != lOther$$_nin.length) {
        return false;
      }
      for (int i = 0; i < l$$_nin.length; i++) {
        final l$$_nin$entry = l$$_nin[i];
        final lOther$$_nin$entry = lOther$$_nin[i];
        if (l$$_nin$entry != lOther$$_nin$entry) {
          return false;
        }
      }
    } else if (l$$_nin != lOther$$_nin) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_eq = $_eq;
    final l$$_gt = $_gt;
    final l$$_gte = $_gte;
    final l$$_in = $_in;
    final l$$_is_null = $_is_null;
    final l$$_lt = $_lt;
    final l$$_lte = $_lte;
    final l$$_neq = $_neq;
    final l$$_nin = $_nin;
    return Object.hashAll([
      _$data.containsKey('_eq') ? l$$_eq : const {},
      _$data.containsKey('_gt') ? l$$_gt : const {},
      _$data.containsKey('_gte') ? l$$_gte : const {},
      _$data.containsKey('_in')
          ? l$$_in == null
              ? null
              : Object.hashAll(l$$_in.map((v) => v))
          : const {},
      _$data.containsKey('_is_null') ? l$$_is_null : const {},
      _$data.containsKey('_lt') ? l$$_lt : const {},
      _$data.containsKey('_lte') ? l$$_lte : const {},
      _$data.containsKey('_neq') ? l$$_neq : const {},
      _$data.containsKey('_nin')
          ? l$$_nin == null
              ? null
              : Object.hashAll(l$$_nin.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$timestamptz_comparison_exp<TRes> {
  factory CopyWith$Input$timestamptz_comparison_exp(
    Input$timestamptz_comparison_exp instance,
    TRes Function(Input$timestamptz_comparison_exp) then,
  ) = _CopyWithImpl$Input$timestamptz_comparison_exp;

  factory CopyWith$Input$timestamptz_comparison_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$timestamptz_comparison_exp;

  TRes call({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    List<String>? $_in,
    bool? $_is_null,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    List<String>? $_nin,
  });
}

class _CopyWithImpl$Input$timestamptz_comparison_exp<TRes>
    implements CopyWith$Input$timestamptz_comparison_exp<TRes> {
  _CopyWithImpl$Input$timestamptz_comparison_exp(
    this._instance,
    this._then,
  );

  final Input$timestamptz_comparison_exp _instance;

  final TRes Function(Input$timestamptz_comparison_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_eq = _undefined,
    Object? $_gt = _undefined,
    Object? $_gte = _undefined,
    Object? $_in = _undefined,
    Object? $_is_null = _undefined,
    Object? $_lt = _undefined,
    Object? $_lte = _undefined,
    Object? $_neq = _undefined,
    Object? $_nin = _undefined,
  }) =>
      _then(Input$timestamptz_comparison_exp._({
        ..._instance._$data,
        if ($_eq != _undefined) '_eq': ($_eq as String?),
        if ($_gt != _undefined) '_gt': ($_gt as String?),
        if ($_gte != _undefined) '_gte': ($_gte as String?),
        if ($_in != _undefined) '_in': ($_in as List<String>?),
        if ($_is_null != _undefined) '_is_null': ($_is_null as bool?),
        if ($_lt != _undefined) '_lt': ($_lt as String?),
        if ($_lte != _undefined) '_lte': ($_lte as String?),
        if ($_neq != _undefined) '_neq': ($_neq as String?),
        if ($_nin != _undefined) '_nin': ($_nin as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$timestamptz_comparison_exp<TRes>
    implements CopyWith$Input$timestamptz_comparison_exp<TRes> {
  _CopyWithStubImpl$Input$timestamptz_comparison_exp(this._res);

  TRes _res;

  call({
    String? $_eq,
    String? $_gt,
    String? $_gte,
    List<String>? $_in,
    bool? $_is_null,
    String? $_lt,
    String? $_lte,
    String? $_neq,
    List<String>? $_nin,
  }) =>
      _res;
}

class Input$user_bool_exp {
  factory Input$user_bool_exp({
    List<Input$user_bool_exp>? $_and,
    Input$user_bool_exp? $_not,
    List<Input$user_bool_exp>? $_or,
    Input$timestamptz_comparison_exp? created_at,
    Input$ENUM_ROLE_enum_comparison_exp? role,
    Input$timestamptz_comparison_exp? updated_at,
    Input$String_comparison_exp? user_id,
    Input$String_comparison_exp? user_phone,
  }) =>
      Input$user_bool_exp._({
        if ($_and != null) r'_and': $_and,
        if ($_not != null) r'_not': $_not,
        if ($_or != null) r'_or': $_or,
        if (created_at != null) r'created_at': created_at,
        if (role != null) r'role': role,
        if (updated_at != null) r'updated_at': updated_at,
        if (user_id != null) r'user_id': user_id,
        if (user_phone != null) r'user_phone': user_phone,
      });

  Input$user_bool_exp._(this._$data);

  factory Input$user_bool_exp.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_and')) {
      final l$$_and = data['_and'];
      result$data['_and'] = (l$$_and as List<dynamic>?)
          ?.map(
              (e) => Input$user_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('_not')) {
      final l$$_not = data['_not'];
      result$data['_not'] = l$$_not == null
          ? null
          : Input$user_bool_exp.fromJson((l$$_not as Map<String, dynamic>));
    }
    if (data.containsKey('_or')) {
      final l$$_or = data['_or'];
      result$data['_or'] = (l$$_or as List<dynamic>?)
          ?.map(
              (e) => Input$user_bool_exp.fromJson((e as Map<String, dynamic>)))
          .toList();
    }
    if (data.containsKey('created_at')) {
      final l$created_at = data['created_at'];
      result$data['created_at'] = l$created_at == null
          ? null
          : Input$timestamptz_comparison_exp.fromJson(
              (l$created_at as Map<String, dynamic>));
    }
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = l$role == null
          ? null
          : Input$ENUM_ROLE_enum_comparison_exp.fromJson(
              (l$role as Map<String, dynamic>));
    }
    if (data.containsKey('updated_at')) {
      final l$updated_at = data['updated_at'];
      result$data['updated_at'] = l$updated_at == null
          ? null
          : Input$timestamptz_comparison_exp.fromJson(
              (l$updated_at as Map<String, dynamic>));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$user_id as Map<String, dynamic>));
    }
    if (data.containsKey('user_phone')) {
      final l$user_phone = data['user_phone'];
      result$data['user_phone'] = l$user_phone == null
          ? null
          : Input$String_comparison_exp.fromJson(
              (l$user_phone as Map<String, dynamic>));
    }
    return Input$user_bool_exp._(result$data);
  }

  Map<String, dynamic> _$data;

  List<Input$user_bool_exp>? get $_and =>
      (_$data['_and'] as List<Input$user_bool_exp>?);
  Input$user_bool_exp? get $_not => (_$data['_not'] as Input$user_bool_exp?);
  List<Input$user_bool_exp>? get $_or =>
      (_$data['_or'] as List<Input$user_bool_exp>?);
  Input$timestamptz_comparison_exp? get created_at =>
      (_$data['created_at'] as Input$timestamptz_comparison_exp?);
  Input$ENUM_ROLE_enum_comparison_exp? get role =>
      (_$data['role'] as Input$ENUM_ROLE_enum_comparison_exp?);
  Input$timestamptz_comparison_exp? get updated_at =>
      (_$data['updated_at'] as Input$timestamptz_comparison_exp?);
  Input$String_comparison_exp? get user_id =>
      (_$data['user_id'] as Input$String_comparison_exp?);
  Input$String_comparison_exp? get user_phone =>
      (_$data['user_phone'] as Input$String_comparison_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_and')) {
      final l$$_and = $_and;
      result$data['_and'] = l$$_and?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('_not')) {
      final l$$_not = $_not;
      result$data['_not'] = l$$_not?.toJson();
    }
    if (_$data.containsKey('_or')) {
      final l$$_or = $_or;
      result$data['_or'] = l$$_or?.map((e) => e.toJson()).toList();
    }
    if (_$data.containsKey('created_at')) {
      final l$created_at = created_at;
      result$data['created_at'] = l$created_at?.toJson();
    }
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] = l$role?.toJson();
    }
    if (_$data.containsKey('updated_at')) {
      final l$updated_at = updated_at;
      result$data['updated_at'] = l$updated_at?.toJson();
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id?.toJson();
    }
    if (_$data.containsKey('user_phone')) {
      final l$user_phone = user_phone;
      result$data['user_phone'] = l$user_phone?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$user_bool_exp<Input$user_bool_exp> get copyWith =>
      CopyWith$Input$user_bool_exp(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_bool_exp) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_and = $_and;
    final lOther$$_and = other.$_and;
    if (_$data.containsKey('_and') != other._$data.containsKey('_and')) {
      return false;
    }
    if (l$$_and != null && lOther$$_and != null) {
      if (l$$_and.length != lOther$$_and.length) {
        return false;
      }
      for (int i = 0; i < l$$_and.length; i++) {
        final l$$_and$entry = l$$_and[i];
        final lOther$$_and$entry = lOther$$_and[i];
        if (l$$_and$entry != lOther$$_and$entry) {
          return false;
        }
      }
    } else if (l$$_and != lOther$$_and) {
      return false;
    }
    final l$$_not = $_not;
    final lOther$$_not = other.$_not;
    if (_$data.containsKey('_not') != other._$data.containsKey('_not')) {
      return false;
    }
    if (l$$_not != lOther$$_not) {
      return false;
    }
    final l$$_or = $_or;
    final lOther$$_or = other.$_or;
    if (_$data.containsKey('_or') != other._$data.containsKey('_or')) {
      return false;
    }
    if (l$$_or != null && lOther$$_or != null) {
      if (l$$_or.length != lOther$$_or.length) {
        return false;
      }
      for (int i = 0; i < l$$_or.length; i++) {
        final l$$_or$entry = l$$_or[i];
        final lOther$$_or$entry = lOther$$_or[i];
        if (l$$_or$entry != lOther$$_or$entry) {
          return false;
        }
      }
    } else if (l$$_or != lOther$$_or) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (_$data.containsKey('created_at') !=
        other._$data.containsKey('created_at')) {
      return false;
    }
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (_$data.containsKey('updated_at') !=
        other._$data.containsKey('updated_at')) {
      return false;
    }
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user_phone = user_phone;
    final lOther$user_phone = other.user_phone;
    if (_$data.containsKey('user_phone') !=
        other._$data.containsKey('user_phone')) {
      return false;
    }
    if (l$user_phone != lOther$user_phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_and = $_and;
    final l$$_not = $_not;
    final l$$_or = $_or;
    final l$created_at = created_at;
    final l$role = role;
    final l$updated_at = updated_at;
    final l$user_id = user_id;
    final l$user_phone = user_phone;
    return Object.hashAll([
      _$data.containsKey('_and')
          ? l$$_and == null
              ? null
              : Object.hashAll(l$$_and.map((v) => v))
          : const {},
      _$data.containsKey('_not') ? l$$_not : const {},
      _$data.containsKey('_or')
          ? l$$_or == null
              ? null
              : Object.hashAll(l$$_or.map((v) => v))
          : const {},
      _$data.containsKey('created_at') ? l$created_at : const {},
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('updated_at') ? l$updated_at : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('user_phone') ? l$user_phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_bool_exp<TRes> {
  factory CopyWith$Input$user_bool_exp(
    Input$user_bool_exp instance,
    TRes Function(Input$user_bool_exp) then,
  ) = _CopyWithImpl$Input$user_bool_exp;

  factory CopyWith$Input$user_bool_exp.stub(TRes res) =
      _CopyWithStubImpl$Input$user_bool_exp;

  TRes call({
    List<Input$user_bool_exp>? $_and,
    Input$user_bool_exp? $_not,
    List<Input$user_bool_exp>? $_or,
    Input$timestamptz_comparison_exp? created_at,
    Input$ENUM_ROLE_enum_comparison_exp? role,
    Input$timestamptz_comparison_exp? updated_at,
    Input$String_comparison_exp? user_id,
    Input$String_comparison_exp? user_phone,
  });
  TRes $_and(
      Iterable<Input$user_bool_exp>? Function(
              Iterable<CopyWith$Input$user_bool_exp<Input$user_bool_exp>>?)
          _fn);
  CopyWith$Input$user_bool_exp<TRes> get $_not;
  TRes $_or(
      Iterable<Input$user_bool_exp>? Function(
              Iterable<CopyWith$Input$user_bool_exp<Input$user_bool_exp>>?)
          _fn);
  CopyWith$Input$timestamptz_comparison_exp<TRes> get created_at;
  CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> get role;
  CopyWith$Input$timestamptz_comparison_exp<TRes> get updated_at;
  CopyWith$Input$String_comparison_exp<TRes> get user_id;
  CopyWith$Input$String_comparison_exp<TRes> get user_phone;
}

class _CopyWithImpl$Input$user_bool_exp<TRes>
    implements CopyWith$Input$user_bool_exp<TRes> {
  _CopyWithImpl$Input$user_bool_exp(
    this._instance,
    this._then,
  );

  final Input$user_bool_exp _instance;

  final TRes Function(Input$user_bool_exp) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_and = _undefined,
    Object? $_not = _undefined,
    Object? $_or = _undefined,
    Object? created_at = _undefined,
    Object? role = _undefined,
    Object? updated_at = _undefined,
    Object? user_id = _undefined,
    Object? user_phone = _undefined,
  }) =>
      _then(Input$user_bool_exp._({
        ..._instance._$data,
        if ($_and != _undefined) '_and': ($_and as List<Input$user_bool_exp>?),
        if ($_not != _undefined) '_not': ($_not as Input$user_bool_exp?),
        if ($_or != _undefined) '_or': ($_or as List<Input$user_bool_exp>?),
        if (created_at != _undefined)
          'created_at': (created_at as Input$timestamptz_comparison_exp?),
        if (role != _undefined)
          'role': (role as Input$ENUM_ROLE_enum_comparison_exp?),
        if (updated_at != _undefined)
          'updated_at': (updated_at as Input$timestamptz_comparison_exp?),
        if (user_id != _undefined)
          'user_id': (user_id as Input$String_comparison_exp?),
        if (user_phone != _undefined)
          'user_phone': (user_phone as Input$String_comparison_exp?),
      }));
  TRes $_and(
          Iterable<Input$user_bool_exp>? Function(
                  Iterable<CopyWith$Input$user_bool_exp<Input$user_bool_exp>>?)
              _fn) =>
      call(
          $_and: _fn(_instance.$_and?.map((e) => CopyWith$Input$user_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$user_bool_exp<TRes> get $_not {
    final local$$_not = _instance.$_not;
    return local$$_not == null
        ? CopyWith$Input$user_bool_exp.stub(_then(_instance))
        : CopyWith$Input$user_bool_exp(local$$_not, (e) => call($_not: e));
  }

  TRes $_or(
          Iterable<Input$user_bool_exp>? Function(
                  Iterable<CopyWith$Input$user_bool_exp<Input$user_bool_exp>>?)
              _fn) =>
      call(
          $_or: _fn(_instance.$_or?.map((e) => CopyWith$Input$user_bool_exp(
                e,
                (i) => i,
              )))?.toList());
  CopyWith$Input$timestamptz_comparison_exp<TRes> get created_at {
    final local$created_at = _instance.created_at;
    return local$created_at == null
        ? CopyWith$Input$timestamptz_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$timestamptz_comparison_exp(
            local$created_at, (e) => call(created_at: e));
  }

  CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> get role {
    final local$role = _instance.role;
    return local$role == null
        ? CopyWith$Input$ENUM_ROLE_enum_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$ENUM_ROLE_enum_comparison_exp(
            local$role, (e) => call(role: e));
  }

  CopyWith$Input$timestamptz_comparison_exp<TRes> get updated_at {
    final local$updated_at = _instance.updated_at;
    return local$updated_at == null
        ? CopyWith$Input$timestamptz_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$timestamptz_comparison_exp(
            local$updated_at, (e) => call(updated_at: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get user_id {
    final local$user_id = _instance.user_id;
    return local$user_id == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$user_id, (e) => call(user_id: e));
  }

  CopyWith$Input$String_comparison_exp<TRes> get user_phone {
    final local$user_phone = _instance.user_phone;
    return local$user_phone == null
        ? CopyWith$Input$String_comparison_exp.stub(_then(_instance))
        : CopyWith$Input$String_comparison_exp(
            local$user_phone, (e) => call(user_phone: e));
  }
}

class _CopyWithStubImpl$Input$user_bool_exp<TRes>
    implements CopyWith$Input$user_bool_exp<TRes> {
  _CopyWithStubImpl$Input$user_bool_exp(this._res);

  TRes _res;

  call({
    List<Input$user_bool_exp>? $_and,
    Input$user_bool_exp? $_not,
    List<Input$user_bool_exp>? $_or,
    Input$timestamptz_comparison_exp? created_at,
    Input$ENUM_ROLE_enum_comparison_exp? role,
    Input$timestamptz_comparison_exp? updated_at,
    Input$String_comparison_exp? user_id,
    Input$String_comparison_exp? user_phone,
  }) =>
      _res;
  $_and(_fn) => _res;
  CopyWith$Input$user_bool_exp<TRes> get $_not =>
      CopyWith$Input$user_bool_exp.stub(_res);
  $_or(_fn) => _res;
  CopyWith$Input$timestamptz_comparison_exp<TRes> get created_at =>
      CopyWith$Input$timestamptz_comparison_exp.stub(_res);
  CopyWith$Input$ENUM_ROLE_enum_comparison_exp<TRes> get role =>
      CopyWith$Input$ENUM_ROLE_enum_comparison_exp.stub(_res);
  CopyWith$Input$timestamptz_comparison_exp<TRes> get updated_at =>
      CopyWith$Input$timestamptz_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get user_id =>
      CopyWith$Input$String_comparison_exp.stub(_res);
  CopyWith$Input$String_comparison_exp<TRes> get user_phone =>
      CopyWith$Input$String_comparison_exp.stub(_res);
}

class Input$user_insert_input {
  factory Input$user_insert_input({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      Input$user_insert_input._({
        if (created_at != null) r'created_at': created_at,
        if (role != null) r'role': role,
        if (updated_at != null) r'updated_at': updated_at,
        if (user_id != null) r'user_id': user_id,
        if (user_phone != null) r'user_phone': user_phone,
      });

  Input$user_insert_input._(this._$data);

  factory Input$user_insert_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('created_at')) {
      final l$created_at = data['created_at'];
      result$data['created_at'] = (l$created_at as String?);
    }
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = l$role == null
          ? null
          : fromJson$Enum$ENUM_ROLE_enum((l$role as String));
    }
    if (data.containsKey('updated_at')) {
      final l$updated_at = data['updated_at'];
      result$data['updated_at'] = (l$updated_at as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    if (data.containsKey('user_phone')) {
      final l$user_phone = data['user_phone'];
      result$data['user_phone'] = (l$user_phone as String?);
    }
    return Input$user_insert_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get created_at => (_$data['created_at'] as String?);
  Enum$ENUM_ROLE_enum? get role => (_$data['role'] as Enum$ENUM_ROLE_enum?);
  String? get updated_at => (_$data['updated_at'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  String? get user_phone => (_$data['user_phone'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('created_at')) {
      final l$created_at = created_at;
      result$data['created_at'] = l$created_at;
    }
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          l$role == null ? null : toJson$Enum$ENUM_ROLE_enum(l$role);
    }
    if (_$data.containsKey('updated_at')) {
      final l$updated_at = updated_at;
      result$data['updated_at'] = l$updated_at;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    if (_$data.containsKey('user_phone')) {
      final l$user_phone = user_phone;
      result$data['user_phone'] = l$user_phone;
    }
    return result$data;
  }

  CopyWith$Input$user_insert_input<Input$user_insert_input> get copyWith =>
      CopyWith$Input$user_insert_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_insert_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (_$data.containsKey('created_at') !=
        other._$data.containsKey('created_at')) {
      return false;
    }
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (_$data.containsKey('updated_at') !=
        other._$data.containsKey('updated_at')) {
      return false;
    }
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user_phone = user_phone;
    final lOther$user_phone = other.user_phone;
    if (_$data.containsKey('user_phone') !=
        other._$data.containsKey('user_phone')) {
      return false;
    }
    if (l$user_phone != lOther$user_phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$role = role;
    final l$updated_at = updated_at;
    final l$user_id = user_id;
    final l$user_phone = user_phone;
    return Object.hashAll([
      _$data.containsKey('created_at') ? l$created_at : const {},
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('updated_at') ? l$updated_at : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('user_phone') ? l$user_phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_insert_input<TRes> {
  factory CopyWith$Input$user_insert_input(
    Input$user_insert_input instance,
    TRes Function(Input$user_insert_input) then,
  ) = _CopyWithImpl$Input$user_insert_input;

  factory CopyWith$Input$user_insert_input.stub(TRes res) =
      _CopyWithStubImpl$Input$user_insert_input;

  TRes call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  });
}

class _CopyWithImpl$Input$user_insert_input<TRes>
    implements CopyWith$Input$user_insert_input<TRes> {
  _CopyWithImpl$Input$user_insert_input(
    this._instance,
    this._then,
  );

  final Input$user_insert_input _instance;

  final TRes Function(Input$user_insert_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? created_at = _undefined,
    Object? role = _undefined,
    Object? updated_at = _undefined,
    Object? user_id = _undefined,
    Object? user_phone = _undefined,
  }) =>
      _then(Input$user_insert_input._({
        ..._instance._$data,
        if (created_at != _undefined) 'created_at': (created_at as String?),
        if (role != _undefined) 'role': (role as Enum$ENUM_ROLE_enum?),
        if (updated_at != _undefined) 'updated_at': (updated_at as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
        if (user_phone != _undefined) 'user_phone': (user_phone as String?),
      }));
}

class _CopyWithStubImpl$Input$user_insert_input<TRes>
    implements CopyWith$Input$user_insert_input<TRes> {
  _CopyWithStubImpl$Input$user_insert_input(this._res);

  TRes _res;

  call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      _res;
}

class Input$user_on_conflict {
  factory Input$user_on_conflict({
    required Enum$user_constraint constraint,
    required List<Enum$user_update_column> update_columns,
    Input$user_bool_exp? where,
  }) =>
      Input$user_on_conflict._({
        r'constraint': constraint,
        r'update_columns': update_columns,
        if (where != null) r'where': where,
      });

  Input$user_on_conflict._(this._$data);

  factory Input$user_on_conflict.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$constraint = data['constraint'];
    result$data['constraint'] =
        fromJson$Enum$user_constraint((l$constraint as String));
    final l$update_columns = data['update_columns'];
    result$data['update_columns'] = (l$update_columns as List<dynamic>)
        .map((e) => fromJson$Enum$user_update_column((e as String)))
        .toList();
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$user_bool_exp.fromJson((l$where as Map<String, dynamic>));
    }
    return Input$user_on_conflict._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$user_constraint get constraint =>
      (_$data['constraint'] as Enum$user_constraint);
  List<Enum$user_update_column> get update_columns =>
      (_$data['update_columns'] as List<Enum$user_update_column>);
  Input$user_bool_exp? get where => (_$data['where'] as Input$user_bool_exp?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$constraint = constraint;
    result$data['constraint'] = toJson$Enum$user_constraint(l$constraint);
    final l$update_columns = update_columns;
    result$data['update_columns'] =
        l$update_columns.map((e) => toJson$Enum$user_update_column(e)).toList();
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$user_on_conflict<Input$user_on_conflict> get copyWith =>
      CopyWith$Input$user_on_conflict(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_on_conflict) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$constraint = constraint;
    final lOther$constraint = other.constraint;
    if (l$constraint != lOther$constraint) {
      return false;
    }
    final l$update_columns = update_columns;
    final lOther$update_columns = other.update_columns;
    if (l$update_columns.length != lOther$update_columns.length) {
      return false;
    }
    for (int i = 0; i < l$update_columns.length; i++) {
      final l$update_columns$entry = l$update_columns[i];
      final lOther$update_columns$entry = lOther$update_columns[i];
      if (l$update_columns$entry != lOther$update_columns$entry) {
        return false;
      }
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$constraint = constraint;
    final l$update_columns = update_columns;
    final l$where = where;
    return Object.hashAll([
      l$constraint,
      Object.hashAll(l$update_columns.map((v) => v)),
      _$data.containsKey('where') ? l$where : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_on_conflict<TRes> {
  factory CopyWith$Input$user_on_conflict(
    Input$user_on_conflict instance,
    TRes Function(Input$user_on_conflict) then,
  ) = _CopyWithImpl$Input$user_on_conflict;

  factory CopyWith$Input$user_on_conflict.stub(TRes res) =
      _CopyWithStubImpl$Input$user_on_conflict;

  TRes call({
    Enum$user_constraint? constraint,
    List<Enum$user_update_column>? update_columns,
    Input$user_bool_exp? where,
  });
  CopyWith$Input$user_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$user_on_conflict<TRes>
    implements CopyWith$Input$user_on_conflict<TRes> {
  _CopyWithImpl$Input$user_on_conflict(
    this._instance,
    this._then,
  );

  final Input$user_on_conflict _instance;

  final TRes Function(Input$user_on_conflict) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? constraint = _undefined,
    Object? update_columns = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$user_on_conflict._({
        ..._instance._$data,
        if (constraint != _undefined && constraint != null)
          'constraint': (constraint as Enum$user_constraint),
        if (update_columns != _undefined && update_columns != null)
          'update_columns': (update_columns as List<Enum$user_update_column>),
        if (where != _undefined) 'where': (where as Input$user_bool_exp?),
      }));
  CopyWith$Input$user_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return local$where == null
        ? CopyWith$Input$user_bool_exp.stub(_then(_instance))
        : CopyWith$Input$user_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$user_on_conflict<TRes>
    implements CopyWith$Input$user_on_conflict<TRes> {
  _CopyWithStubImpl$Input$user_on_conflict(this._res);

  TRes _res;

  call({
    Enum$user_constraint? constraint,
    List<Enum$user_update_column>? update_columns,
    Input$user_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$user_bool_exp<TRes> get where =>
      CopyWith$Input$user_bool_exp.stub(_res);
}

class Input$user_order_by {
  factory Input$user_order_by({
    Enum$order_by? created_at,
    Enum$order_by? role,
    Enum$order_by? updated_at,
    Enum$order_by? user_id,
    Enum$order_by? user_phone,
  }) =>
      Input$user_order_by._({
        if (created_at != null) r'created_at': created_at,
        if (role != null) r'role': role,
        if (updated_at != null) r'updated_at': updated_at,
        if (user_id != null) r'user_id': user_id,
        if (user_phone != null) r'user_phone': user_phone,
      });

  Input$user_order_by._(this._$data);

  factory Input$user_order_by.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('created_at')) {
      final l$created_at = data['created_at'];
      result$data['created_at'] = l$created_at == null
          ? null
          : fromJson$Enum$order_by((l$created_at as String));
    }
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] =
          l$role == null ? null : fromJson$Enum$order_by((l$role as String));
    }
    if (data.containsKey('updated_at')) {
      final l$updated_at = data['updated_at'];
      result$data['updated_at'] = l$updated_at == null
          ? null
          : fromJson$Enum$order_by((l$updated_at as String));
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = l$user_id == null
          ? null
          : fromJson$Enum$order_by((l$user_id as String));
    }
    if (data.containsKey('user_phone')) {
      final l$user_phone = data['user_phone'];
      result$data['user_phone'] = l$user_phone == null
          ? null
          : fromJson$Enum$order_by((l$user_phone as String));
    }
    return Input$user_order_by._(result$data);
  }

  Map<String, dynamic> _$data;

  Enum$order_by? get created_at => (_$data['created_at'] as Enum$order_by?);
  Enum$order_by? get role => (_$data['role'] as Enum$order_by?);
  Enum$order_by? get updated_at => (_$data['updated_at'] as Enum$order_by?);
  Enum$order_by? get user_id => (_$data['user_id'] as Enum$order_by?);
  Enum$order_by? get user_phone => (_$data['user_phone'] as Enum$order_by?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('created_at')) {
      final l$created_at = created_at;
      result$data['created_at'] =
          l$created_at == null ? null : toJson$Enum$order_by(l$created_at);
    }
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          l$role == null ? null : toJson$Enum$order_by(l$role);
    }
    if (_$data.containsKey('updated_at')) {
      final l$updated_at = updated_at;
      result$data['updated_at'] =
          l$updated_at == null ? null : toJson$Enum$order_by(l$updated_at);
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] =
          l$user_id == null ? null : toJson$Enum$order_by(l$user_id);
    }
    if (_$data.containsKey('user_phone')) {
      final l$user_phone = user_phone;
      result$data['user_phone'] =
          l$user_phone == null ? null : toJson$Enum$order_by(l$user_phone);
    }
    return result$data;
  }

  CopyWith$Input$user_order_by<Input$user_order_by> get copyWith =>
      CopyWith$Input$user_order_by(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_order_by) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (_$data.containsKey('created_at') !=
        other._$data.containsKey('created_at')) {
      return false;
    }
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (_$data.containsKey('updated_at') !=
        other._$data.containsKey('updated_at')) {
      return false;
    }
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user_phone = user_phone;
    final lOther$user_phone = other.user_phone;
    if (_$data.containsKey('user_phone') !=
        other._$data.containsKey('user_phone')) {
      return false;
    }
    if (l$user_phone != lOther$user_phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$role = role;
    final l$updated_at = updated_at;
    final l$user_id = user_id;
    final l$user_phone = user_phone;
    return Object.hashAll([
      _$data.containsKey('created_at') ? l$created_at : const {},
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('updated_at') ? l$updated_at : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('user_phone') ? l$user_phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_order_by<TRes> {
  factory CopyWith$Input$user_order_by(
    Input$user_order_by instance,
    TRes Function(Input$user_order_by) then,
  ) = _CopyWithImpl$Input$user_order_by;

  factory CopyWith$Input$user_order_by.stub(TRes res) =
      _CopyWithStubImpl$Input$user_order_by;

  TRes call({
    Enum$order_by? created_at,
    Enum$order_by? role,
    Enum$order_by? updated_at,
    Enum$order_by? user_id,
    Enum$order_by? user_phone,
  });
}

class _CopyWithImpl$Input$user_order_by<TRes>
    implements CopyWith$Input$user_order_by<TRes> {
  _CopyWithImpl$Input$user_order_by(
    this._instance,
    this._then,
  );

  final Input$user_order_by _instance;

  final TRes Function(Input$user_order_by) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? created_at = _undefined,
    Object? role = _undefined,
    Object? updated_at = _undefined,
    Object? user_id = _undefined,
    Object? user_phone = _undefined,
  }) =>
      _then(Input$user_order_by._({
        ..._instance._$data,
        if (created_at != _undefined)
          'created_at': (created_at as Enum$order_by?),
        if (role != _undefined) 'role': (role as Enum$order_by?),
        if (updated_at != _undefined)
          'updated_at': (updated_at as Enum$order_by?),
        if (user_id != _undefined) 'user_id': (user_id as Enum$order_by?),
        if (user_phone != _undefined)
          'user_phone': (user_phone as Enum$order_by?),
      }));
}

class _CopyWithStubImpl$Input$user_order_by<TRes>
    implements CopyWith$Input$user_order_by<TRes> {
  _CopyWithStubImpl$Input$user_order_by(this._res);

  TRes _res;

  call({
    Enum$order_by? created_at,
    Enum$order_by? role,
    Enum$order_by? updated_at,
    Enum$order_by? user_id,
    Enum$order_by? user_phone,
  }) =>
      _res;
}

class Input$user_pk_columns_input {
  factory Input$user_pk_columns_input({required String user_id}) =>
      Input$user_pk_columns_input._({
        r'user_id': user_id,
      });

  Input$user_pk_columns_input._(this._$data);

  factory Input$user_pk_columns_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$user_id = data['user_id'];
    result$data['user_id'] = (l$user_id as String);
    return Input$user_pk_columns_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String get user_id => (_$data['user_id'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$user_id = user_id;
    result$data['user_id'] = l$user_id;
    return result$data;
  }

  CopyWith$Input$user_pk_columns_input<Input$user_pk_columns_input>
      get copyWith => CopyWith$Input$user_pk_columns_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_pk_columns_input) ||
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

abstract class CopyWith$Input$user_pk_columns_input<TRes> {
  factory CopyWith$Input$user_pk_columns_input(
    Input$user_pk_columns_input instance,
    TRes Function(Input$user_pk_columns_input) then,
  ) = _CopyWithImpl$Input$user_pk_columns_input;

  factory CopyWith$Input$user_pk_columns_input.stub(TRes res) =
      _CopyWithStubImpl$Input$user_pk_columns_input;

  TRes call({String? user_id});
}

class _CopyWithImpl$Input$user_pk_columns_input<TRes>
    implements CopyWith$Input$user_pk_columns_input<TRes> {
  _CopyWithImpl$Input$user_pk_columns_input(
    this._instance,
    this._then,
  );

  final Input$user_pk_columns_input _instance;

  final TRes Function(Input$user_pk_columns_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? user_id = _undefined}) =>
      _then(Input$user_pk_columns_input._({
        ..._instance._$data,
        if (user_id != _undefined && user_id != null)
          'user_id': (user_id as String),
      }));
}

class _CopyWithStubImpl$Input$user_pk_columns_input<TRes>
    implements CopyWith$Input$user_pk_columns_input<TRes> {
  _CopyWithStubImpl$Input$user_pk_columns_input(this._res);

  TRes _res;

  call({String? user_id}) => _res;
}

class Input$user_set_input {
  factory Input$user_set_input({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      Input$user_set_input._({
        if (created_at != null) r'created_at': created_at,
        if (role != null) r'role': role,
        if (updated_at != null) r'updated_at': updated_at,
        if (user_id != null) r'user_id': user_id,
        if (user_phone != null) r'user_phone': user_phone,
      });

  Input$user_set_input._(this._$data);

  factory Input$user_set_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('created_at')) {
      final l$created_at = data['created_at'];
      result$data['created_at'] = (l$created_at as String?);
    }
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = l$role == null
          ? null
          : fromJson$Enum$ENUM_ROLE_enum((l$role as String));
    }
    if (data.containsKey('updated_at')) {
      final l$updated_at = data['updated_at'];
      result$data['updated_at'] = (l$updated_at as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    if (data.containsKey('user_phone')) {
      final l$user_phone = data['user_phone'];
      result$data['user_phone'] = (l$user_phone as String?);
    }
    return Input$user_set_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get created_at => (_$data['created_at'] as String?);
  Enum$ENUM_ROLE_enum? get role => (_$data['role'] as Enum$ENUM_ROLE_enum?);
  String? get updated_at => (_$data['updated_at'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  String? get user_phone => (_$data['user_phone'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('created_at')) {
      final l$created_at = created_at;
      result$data['created_at'] = l$created_at;
    }
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          l$role == null ? null : toJson$Enum$ENUM_ROLE_enum(l$role);
    }
    if (_$data.containsKey('updated_at')) {
      final l$updated_at = updated_at;
      result$data['updated_at'] = l$updated_at;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    if (_$data.containsKey('user_phone')) {
      final l$user_phone = user_phone;
      result$data['user_phone'] = l$user_phone;
    }
    return result$data;
  }

  CopyWith$Input$user_set_input<Input$user_set_input> get copyWith =>
      CopyWith$Input$user_set_input(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_set_input) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (_$data.containsKey('created_at') !=
        other._$data.containsKey('created_at')) {
      return false;
    }
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (_$data.containsKey('updated_at') !=
        other._$data.containsKey('updated_at')) {
      return false;
    }
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user_phone = user_phone;
    final lOther$user_phone = other.user_phone;
    if (_$data.containsKey('user_phone') !=
        other._$data.containsKey('user_phone')) {
      return false;
    }
    if (l$user_phone != lOther$user_phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$role = role;
    final l$updated_at = updated_at;
    final l$user_id = user_id;
    final l$user_phone = user_phone;
    return Object.hashAll([
      _$data.containsKey('created_at') ? l$created_at : const {},
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('updated_at') ? l$updated_at : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('user_phone') ? l$user_phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_set_input<TRes> {
  factory CopyWith$Input$user_set_input(
    Input$user_set_input instance,
    TRes Function(Input$user_set_input) then,
  ) = _CopyWithImpl$Input$user_set_input;

  factory CopyWith$Input$user_set_input.stub(TRes res) =
      _CopyWithStubImpl$Input$user_set_input;

  TRes call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  });
}

class _CopyWithImpl$Input$user_set_input<TRes>
    implements CopyWith$Input$user_set_input<TRes> {
  _CopyWithImpl$Input$user_set_input(
    this._instance,
    this._then,
  );

  final Input$user_set_input _instance;

  final TRes Function(Input$user_set_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? created_at = _undefined,
    Object? role = _undefined,
    Object? updated_at = _undefined,
    Object? user_id = _undefined,
    Object? user_phone = _undefined,
  }) =>
      _then(Input$user_set_input._({
        ..._instance._$data,
        if (created_at != _undefined) 'created_at': (created_at as String?),
        if (role != _undefined) 'role': (role as Enum$ENUM_ROLE_enum?),
        if (updated_at != _undefined) 'updated_at': (updated_at as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
        if (user_phone != _undefined) 'user_phone': (user_phone as String?),
      }));
}

class _CopyWithStubImpl$Input$user_set_input<TRes>
    implements CopyWith$Input$user_set_input<TRes> {
  _CopyWithStubImpl$Input$user_set_input(this._res);

  TRes _res;

  call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      _res;
}

class Input$user_stream_cursor_input {
  factory Input$user_stream_cursor_input({
    required Input$user_stream_cursor_value_input initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      Input$user_stream_cursor_input._({
        r'initial_value': initial_value,
        if (ordering != null) r'ordering': ordering,
      });

  Input$user_stream_cursor_input._(this._$data);

  factory Input$user_stream_cursor_input.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$initial_value = data['initial_value'];
    result$data['initial_value'] =
        Input$user_stream_cursor_value_input.fromJson(
            (l$initial_value as Map<String, dynamic>));
    if (data.containsKey('ordering')) {
      final l$ordering = data['ordering'];
      result$data['ordering'] = l$ordering == null
          ? null
          : fromJson$Enum$cursor_ordering((l$ordering as String));
    }
    return Input$user_stream_cursor_input._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$user_stream_cursor_value_input get initial_value =>
      (_$data['initial_value'] as Input$user_stream_cursor_value_input);
  Enum$cursor_ordering? get ordering =>
      (_$data['ordering'] as Enum$cursor_ordering?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$initial_value = initial_value;
    result$data['initial_value'] = l$initial_value.toJson();
    if (_$data.containsKey('ordering')) {
      final l$ordering = ordering;
      result$data['ordering'] =
          l$ordering == null ? null : toJson$Enum$cursor_ordering(l$ordering);
    }
    return result$data;
  }

  CopyWith$Input$user_stream_cursor_input<Input$user_stream_cursor_input>
      get copyWith => CopyWith$Input$user_stream_cursor_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_stream_cursor_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$initial_value = initial_value;
    final lOther$initial_value = other.initial_value;
    if (l$initial_value != lOther$initial_value) {
      return false;
    }
    final l$ordering = ordering;
    final lOther$ordering = other.ordering;
    if (_$data.containsKey('ordering') !=
        other._$data.containsKey('ordering')) {
      return false;
    }
    if (l$ordering != lOther$ordering) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$initial_value = initial_value;
    final l$ordering = ordering;
    return Object.hashAll([
      l$initial_value,
      _$data.containsKey('ordering') ? l$ordering : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_stream_cursor_input<TRes> {
  factory CopyWith$Input$user_stream_cursor_input(
    Input$user_stream_cursor_input instance,
    TRes Function(Input$user_stream_cursor_input) then,
  ) = _CopyWithImpl$Input$user_stream_cursor_input;

  factory CopyWith$Input$user_stream_cursor_input.stub(TRes res) =
      _CopyWithStubImpl$Input$user_stream_cursor_input;

  TRes call({
    Input$user_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  });
  CopyWith$Input$user_stream_cursor_value_input<TRes> get initial_value;
}

class _CopyWithImpl$Input$user_stream_cursor_input<TRes>
    implements CopyWith$Input$user_stream_cursor_input<TRes> {
  _CopyWithImpl$Input$user_stream_cursor_input(
    this._instance,
    this._then,
  );

  final Input$user_stream_cursor_input _instance;

  final TRes Function(Input$user_stream_cursor_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? initial_value = _undefined,
    Object? ordering = _undefined,
  }) =>
      _then(Input$user_stream_cursor_input._({
        ..._instance._$data,
        if (initial_value != _undefined && initial_value != null)
          'initial_value':
              (initial_value as Input$user_stream_cursor_value_input),
        if (ordering != _undefined)
          'ordering': (ordering as Enum$cursor_ordering?),
      }));
  CopyWith$Input$user_stream_cursor_value_input<TRes> get initial_value {
    final local$initial_value = _instance.initial_value;
    return CopyWith$Input$user_stream_cursor_value_input(
        local$initial_value, (e) => call(initial_value: e));
  }
}

class _CopyWithStubImpl$Input$user_stream_cursor_input<TRes>
    implements CopyWith$Input$user_stream_cursor_input<TRes> {
  _CopyWithStubImpl$Input$user_stream_cursor_input(this._res);

  TRes _res;

  call({
    Input$user_stream_cursor_value_input? initial_value,
    Enum$cursor_ordering? ordering,
  }) =>
      _res;
  CopyWith$Input$user_stream_cursor_value_input<TRes> get initial_value =>
      CopyWith$Input$user_stream_cursor_value_input.stub(_res);
}

class Input$user_stream_cursor_value_input {
  factory Input$user_stream_cursor_value_input({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      Input$user_stream_cursor_value_input._({
        if (created_at != null) r'created_at': created_at,
        if (role != null) r'role': role,
        if (updated_at != null) r'updated_at': updated_at,
        if (user_id != null) r'user_id': user_id,
        if (user_phone != null) r'user_phone': user_phone,
      });

  Input$user_stream_cursor_value_input._(this._$data);

  factory Input$user_stream_cursor_value_input.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('created_at')) {
      final l$created_at = data['created_at'];
      result$data['created_at'] = (l$created_at as String?);
    }
    if (data.containsKey('role')) {
      final l$role = data['role'];
      result$data['role'] = l$role == null
          ? null
          : fromJson$Enum$ENUM_ROLE_enum((l$role as String));
    }
    if (data.containsKey('updated_at')) {
      final l$updated_at = data['updated_at'];
      result$data['updated_at'] = (l$updated_at as String?);
    }
    if (data.containsKey('user_id')) {
      final l$user_id = data['user_id'];
      result$data['user_id'] = (l$user_id as String?);
    }
    if (data.containsKey('user_phone')) {
      final l$user_phone = data['user_phone'];
      result$data['user_phone'] = (l$user_phone as String?);
    }
    return Input$user_stream_cursor_value_input._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get created_at => (_$data['created_at'] as String?);
  Enum$ENUM_ROLE_enum? get role => (_$data['role'] as Enum$ENUM_ROLE_enum?);
  String? get updated_at => (_$data['updated_at'] as String?);
  String? get user_id => (_$data['user_id'] as String?);
  String? get user_phone => (_$data['user_phone'] as String?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('created_at')) {
      final l$created_at = created_at;
      result$data['created_at'] = l$created_at;
    }
    if (_$data.containsKey('role')) {
      final l$role = role;
      result$data['role'] =
          l$role == null ? null : toJson$Enum$ENUM_ROLE_enum(l$role);
    }
    if (_$data.containsKey('updated_at')) {
      final l$updated_at = updated_at;
      result$data['updated_at'] = l$updated_at;
    }
    if (_$data.containsKey('user_id')) {
      final l$user_id = user_id;
      result$data['user_id'] = l$user_id;
    }
    if (_$data.containsKey('user_phone')) {
      final l$user_phone = user_phone;
      result$data['user_phone'] = l$user_phone;
    }
    return result$data;
  }

  CopyWith$Input$user_stream_cursor_value_input<
          Input$user_stream_cursor_value_input>
      get copyWith => CopyWith$Input$user_stream_cursor_value_input(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_stream_cursor_value_input) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$created_at = created_at;
    final lOther$created_at = other.created_at;
    if (_$data.containsKey('created_at') !=
        other._$data.containsKey('created_at')) {
      return false;
    }
    if (l$created_at != lOther$created_at) {
      return false;
    }
    final l$role = role;
    final lOther$role = other.role;
    if (_$data.containsKey('role') != other._$data.containsKey('role')) {
      return false;
    }
    if (l$role != lOther$role) {
      return false;
    }
    final l$updated_at = updated_at;
    final lOther$updated_at = other.updated_at;
    if (_$data.containsKey('updated_at') !=
        other._$data.containsKey('updated_at')) {
      return false;
    }
    if (l$updated_at != lOther$updated_at) {
      return false;
    }
    final l$user_id = user_id;
    final lOther$user_id = other.user_id;
    if (_$data.containsKey('user_id') != other._$data.containsKey('user_id')) {
      return false;
    }
    if (l$user_id != lOther$user_id) {
      return false;
    }
    final l$user_phone = user_phone;
    final lOther$user_phone = other.user_phone;
    if (_$data.containsKey('user_phone') !=
        other._$data.containsKey('user_phone')) {
      return false;
    }
    if (l$user_phone != lOther$user_phone) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$created_at = created_at;
    final l$role = role;
    final l$updated_at = updated_at;
    final l$user_id = user_id;
    final l$user_phone = user_phone;
    return Object.hashAll([
      _$data.containsKey('created_at') ? l$created_at : const {},
      _$data.containsKey('role') ? l$role : const {},
      _$data.containsKey('updated_at') ? l$updated_at : const {},
      _$data.containsKey('user_id') ? l$user_id : const {},
      _$data.containsKey('user_phone') ? l$user_phone : const {},
    ]);
  }
}

abstract class CopyWith$Input$user_stream_cursor_value_input<TRes> {
  factory CopyWith$Input$user_stream_cursor_value_input(
    Input$user_stream_cursor_value_input instance,
    TRes Function(Input$user_stream_cursor_value_input) then,
  ) = _CopyWithImpl$Input$user_stream_cursor_value_input;

  factory CopyWith$Input$user_stream_cursor_value_input.stub(TRes res) =
      _CopyWithStubImpl$Input$user_stream_cursor_value_input;

  TRes call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  });
}

class _CopyWithImpl$Input$user_stream_cursor_value_input<TRes>
    implements CopyWith$Input$user_stream_cursor_value_input<TRes> {
  _CopyWithImpl$Input$user_stream_cursor_value_input(
    this._instance,
    this._then,
  );

  final Input$user_stream_cursor_value_input _instance;

  final TRes Function(Input$user_stream_cursor_value_input) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? created_at = _undefined,
    Object? role = _undefined,
    Object? updated_at = _undefined,
    Object? user_id = _undefined,
    Object? user_phone = _undefined,
  }) =>
      _then(Input$user_stream_cursor_value_input._({
        ..._instance._$data,
        if (created_at != _undefined) 'created_at': (created_at as String?),
        if (role != _undefined) 'role': (role as Enum$ENUM_ROLE_enum?),
        if (updated_at != _undefined) 'updated_at': (updated_at as String?),
        if (user_id != _undefined) 'user_id': (user_id as String?),
        if (user_phone != _undefined) 'user_phone': (user_phone as String?),
      }));
}

class _CopyWithStubImpl$Input$user_stream_cursor_value_input<TRes>
    implements CopyWith$Input$user_stream_cursor_value_input<TRes> {
  _CopyWithStubImpl$Input$user_stream_cursor_value_input(this._res);

  TRes _res;

  call({
    String? created_at,
    Enum$ENUM_ROLE_enum? role,
    String? updated_at,
    String? user_id,
    String? user_phone,
  }) =>
      _res;
}

class Input$user_updates {
  factory Input$user_updates({
    Input$user_set_input? $_set,
    required Input$user_bool_exp where,
  }) =>
      Input$user_updates._({
        if ($_set != null) r'_set': $_set,
        r'where': where,
      });

  Input$user_updates._(this._$data);

  factory Input$user_updates.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('_set')) {
      final l$$_set = data['_set'];
      result$data['_set'] = l$$_set == null
          ? null
          : Input$user_set_input.fromJson((l$$_set as Map<String, dynamic>));
    }
    final l$where = data['where'];
    result$data['where'] =
        Input$user_bool_exp.fromJson((l$where as Map<String, dynamic>));
    return Input$user_updates._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$user_set_input? get $_set => (_$data['_set'] as Input$user_set_input?);
  Input$user_bool_exp get where => (_$data['where'] as Input$user_bool_exp);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('_set')) {
      final l$$_set = $_set;
      result$data['_set'] = l$$_set?.toJson();
    }
    final l$where = where;
    result$data['where'] = l$where.toJson();
    return result$data;
  }

  CopyWith$Input$user_updates<Input$user_updates> get copyWith =>
      CopyWith$Input$user_updates(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$user_updates) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$$_set = $_set;
    final lOther$$_set = other.$_set;
    if (_$data.containsKey('_set') != other._$data.containsKey('_set')) {
      return false;
    }
    if (l$$_set != lOther$$_set) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (l$where != lOther$where) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$$_set = $_set;
    final l$where = where;
    return Object.hashAll([
      _$data.containsKey('_set') ? l$$_set : const {},
      l$where,
    ]);
  }
}

abstract class CopyWith$Input$user_updates<TRes> {
  factory CopyWith$Input$user_updates(
    Input$user_updates instance,
    TRes Function(Input$user_updates) then,
  ) = _CopyWithImpl$Input$user_updates;

  factory CopyWith$Input$user_updates.stub(TRes res) =
      _CopyWithStubImpl$Input$user_updates;

  TRes call({
    Input$user_set_input? $_set,
    Input$user_bool_exp? where,
  });
  CopyWith$Input$user_set_input<TRes> get $_set;
  CopyWith$Input$user_bool_exp<TRes> get where;
}

class _CopyWithImpl$Input$user_updates<TRes>
    implements CopyWith$Input$user_updates<TRes> {
  _CopyWithImpl$Input$user_updates(
    this._instance,
    this._then,
  );

  final Input$user_updates _instance;

  final TRes Function(Input$user_updates) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? $_set = _undefined,
    Object? where = _undefined,
  }) =>
      _then(Input$user_updates._({
        ..._instance._$data,
        if ($_set != _undefined) '_set': ($_set as Input$user_set_input?),
        if (where != _undefined && where != null)
          'where': (where as Input$user_bool_exp),
      }));
  CopyWith$Input$user_set_input<TRes> get $_set {
    final local$$_set = _instance.$_set;
    return local$$_set == null
        ? CopyWith$Input$user_set_input.stub(_then(_instance))
        : CopyWith$Input$user_set_input(local$$_set, (e) => call($_set: e));
  }

  CopyWith$Input$user_bool_exp<TRes> get where {
    final local$where = _instance.where;
    return CopyWith$Input$user_bool_exp(local$where, (e) => call(where: e));
  }
}

class _CopyWithStubImpl$Input$user_updates<TRes>
    implements CopyWith$Input$user_updates<TRes> {
  _CopyWithStubImpl$Input$user_updates(this._res);

  TRes _res;

  call({
    Input$user_set_input? $_set,
    Input$user_bool_exp? where,
  }) =>
      _res;
  CopyWith$Input$user_set_input<TRes> get $_set =>
      CopyWith$Input$user_set_input.stub(_res);
  CopyWith$Input$user_bool_exp<TRes> get where =>
      CopyWith$Input$user_bool_exp.stub(_res);
}

enum Enum$ENUM_ROLE_constraint { ENUM_ROLE_pkey, $unknown }

String toJson$Enum$ENUM_ROLE_constraint(Enum$ENUM_ROLE_constraint e) {
  switch (e) {
    case Enum$ENUM_ROLE_constraint.ENUM_ROLE_pkey:
      return r'ENUM_ROLE_pkey';
    case Enum$ENUM_ROLE_constraint.$unknown:
      return r'$unknown';
  }
}

Enum$ENUM_ROLE_constraint fromJson$Enum$ENUM_ROLE_constraint(String value) {
  switch (value) {
    case r'ENUM_ROLE_pkey':
      return Enum$ENUM_ROLE_constraint.ENUM_ROLE_pkey;
    default:
      return Enum$ENUM_ROLE_constraint.$unknown;
  }
}

enum Enum$ENUM_ROLE_enum { admin, user, $unknown }

String toJson$Enum$ENUM_ROLE_enum(Enum$ENUM_ROLE_enum e) {
  switch (e) {
    case Enum$ENUM_ROLE_enum.admin:
      return r'admin';
    case Enum$ENUM_ROLE_enum.user:
      return r'user';
    case Enum$ENUM_ROLE_enum.$unknown:
      return r'$unknown';
  }
}

Enum$ENUM_ROLE_enum fromJson$Enum$ENUM_ROLE_enum(String value) {
  switch (value) {
    case r'admin':
      return Enum$ENUM_ROLE_enum.admin;
    case r'user':
      return Enum$ENUM_ROLE_enum.user;
    default:
      return Enum$ENUM_ROLE_enum.$unknown;
  }
}

enum Enum$ENUM_ROLE_select_column { comment, value, $unknown }

String toJson$Enum$ENUM_ROLE_select_column(Enum$ENUM_ROLE_select_column e) {
  switch (e) {
    case Enum$ENUM_ROLE_select_column.comment:
      return r'comment';
    case Enum$ENUM_ROLE_select_column.value:
      return r'value';
    case Enum$ENUM_ROLE_select_column.$unknown:
      return r'$unknown';
  }
}

Enum$ENUM_ROLE_select_column fromJson$Enum$ENUM_ROLE_select_column(
    String value) {
  switch (value) {
    case r'comment':
      return Enum$ENUM_ROLE_select_column.comment;
    case r'value':
      return Enum$ENUM_ROLE_select_column.value;
    default:
      return Enum$ENUM_ROLE_select_column.$unknown;
  }
}

enum Enum$ENUM_ROLE_update_column { comment, value, $unknown }

String toJson$Enum$ENUM_ROLE_update_column(Enum$ENUM_ROLE_update_column e) {
  switch (e) {
    case Enum$ENUM_ROLE_update_column.comment:
      return r'comment';
    case Enum$ENUM_ROLE_update_column.value:
      return r'value';
    case Enum$ENUM_ROLE_update_column.$unknown:
      return r'$unknown';
  }
}

Enum$ENUM_ROLE_update_column fromJson$Enum$ENUM_ROLE_update_column(
    String value) {
  switch (value) {
    case r'comment':
      return Enum$ENUM_ROLE_update_column.comment;
    case r'value':
      return Enum$ENUM_ROLE_update_column.value;
    default:
      return Enum$ENUM_ROLE_update_column.$unknown;
  }
}

enum Enum$app_constraint { app_pkey, $unknown }

String toJson$Enum$app_constraint(Enum$app_constraint e) {
  switch (e) {
    case Enum$app_constraint.app_pkey:
      return r'app_pkey';
    case Enum$app_constraint.$unknown:
      return r'$unknown';
  }
}

Enum$app_constraint fromJson$Enum$app_constraint(String value) {
  switch (value) {
    case r'app_pkey':
      return Enum$app_constraint.app_pkey;
    default:
      return Enum$app_constraint.$unknown;
  }
}

enum Enum$app_select_column {
  name,
  storage_bucket,
  version_latest,
  version_supported,
  $unknown
}

String toJson$Enum$app_select_column(Enum$app_select_column e) {
  switch (e) {
    case Enum$app_select_column.name:
      return r'name';
    case Enum$app_select_column.storage_bucket:
      return r'storage_bucket';
    case Enum$app_select_column.version_latest:
      return r'version_latest';
    case Enum$app_select_column.version_supported:
      return r'version_supported';
    case Enum$app_select_column.$unknown:
      return r'$unknown';
  }
}

Enum$app_select_column fromJson$Enum$app_select_column(String value) {
  switch (value) {
    case r'name':
      return Enum$app_select_column.name;
    case r'storage_bucket':
      return Enum$app_select_column.storage_bucket;
    case r'version_latest':
      return Enum$app_select_column.version_latest;
    case r'version_supported':
      return Enum$app_select_column.version_supported;
    default:
      return Enum$app_select_column.$unknown;
  }
}

enum Enum$app_update_column {
  name,
  storage_bucket,
  version_latest,
  version_supported,
  $unknown
}

String toJson$Enum$app_update_column(Enum$app_update_column e) {
  switch (e) {
    case Enum$app_update_column.name:
      return r'name';
    case Enum$app_update_column.storage_bucket:
      return r'storage_bucket';
    case Enum$app_update_column.version_latest:
      return r'version_latest';
    case Enum$app_update_column.version_supported:
      return r'version_supported';
    case Enum$app_update_column.$unknown:
      return r'$unknown';
  }
}

Enum$app_update_column fromJson$Enum$app_update_column(String value) {
  switch (value) {
    case r'name':
      return Enum$app_update_column.name;
    case r'storage_bucket':
      return Enum$app_update_column.storage_bucket;
    case r'version_latest':
      return Enum$app_update_column.version_latest;
    case r'version_supported':
      return Enum$app_update_column.version_supported;
    default:
      return Enum$app_update_column.$unknown;
  }
}

enum Enum$cursor_ordering { ASC, DESC, $unknown }

String toJson$Enum$cursor_ordering(Enum$cursor_ordering e) {
  switch (e) {
    case Enum$cursor_ordering.ASC:
      return r'ASC';
    case Enum$cursor_ordering.DESC:
      return r'DESC';
    case Enum$cursor_ordering.$unknown:
      return r'$unknown';
  }
}

Enum$cursor_ordering fromJson$Enum$cursor_ordering(String value) {
  switch (value) {
    case r'ASC':
      return Enum$cursor_ordering.ASC;
    case r'DESC':
      return Enum$cursor_ordering.DESC;
    default:
      return Enum$cursor_ordering.$unknown;
  }
}

enum Enum$file_constraint { file_pkey, $unknown }

String toJson$Enum$file_constraint(Enum$file_constraint e) {
  switch (e) {
    case Enum$file_constraint.file_pkey:
      return r'file_pkey';
    case Enum$file_constraint.$unknown:
      return r'$unknown';
  }
}

Enum$file_constraint fromJson$Enum$file_constraint(String value) {
  switch (value) {
    case r'file_pkey':
      return Enum$file_constraint.file_pkey;
    default:
      return Enum$file_constraint.$unknown;
  }
}

enum Enum$file_select_column {
  file_id,
  name,
  public,
  signed_url,
  type,
  user_id,
  $unknown
}

String toJson$Enum$file_select_column(Enum$file_select_column e) {
  switch (e) {
    case Enum$file_select_column.file_id:
      return r'file_id';
    case Enum$file_select_column.name:
      return r'name';
    case Enum$file_select_column.public:
      return r'public';
    case Enum$file_select_column.signed_url:
      return r'signed_url';
    case Enum$file_select_column.type:
      return r'type';
    case Enum$file_select_column.user_id:
      return r'user_id';
    case Enum$file_select_column.$unknown:
      return r'$unknown';
  }
}

Enum$file_select_column fromJson$Enum$file_select_column(String value) {
  switch (value) {
    case r'file_id':
      return Enum$file_select_column.file_id;
    case r'name':
      return Enum$file_select_column.name;
    case r'public':
      return Enum$file_select_column.public;
    case r'signed_url':
      return Enum$file_select_column.signed_url;
    case r'type':
      return Enum$file_select_column.type;
    case r'user_id':
      return Enum$file_select_column.user_id;
    default:
      return Enum$file_select_column.$unknown;
  }
}

enum Enum$file_update_column {
  file_id,
  name,
  public,
  signed_url,
  type,
  user_id,
  $unknown
}

String toJson$Enum$file_update_column(Enum$file_update_column e) {
  switch (e) {
    case Enum$file_update_column.file_id:
      return r'file_id';
    case Enum$file_update_column.name:
      return r'name';
    case Enum$file_update_column.public:
      return r'public';
    case Enum$file_update_column.signed_url:
      return r'signed_url';
    case Enum$file_update_column.type:
      return r'type';
    case Enum$file_update_column.user_id:
      return r'user_id';
    case Enum$file_update_column.$unknown:
      return r'$unknown';
  }
}

Enum$file_update_column fromJson$Enum$file_update_column(String value) {
  switch (value) {
    case r'file_id':
      return Enum$file_update_column.file_id;
    case r'name':
      return Enum$file_update_column.name;
    case r'public':
      return Enum$file_update_column.public;
    case r'signed_url':
      return Enum$file_update_column.signed_url;
    case r'type':
      return Enum$file_update_column.type;
    case r'user_id':
      return Enum$file_update_column.user_id;
    default:
      return Enum$file_update_column.$unknown;
  }
}

enum Enum$order_by {
  asc,
  asc_nulls_first,
  asc_nulls_last,
  desc,
  desc_nulls_first,
  desc_nulls_last,
  $unknown
}

String toJson$Enum$order_by(Enum$order_by e) {
  switch (e) {
    case Enum$order_by.asc:
      return r'asc';
    case Enum$order_by.asc_nulls_first:
      return r'asc_nulls_first';
    case Enum$order_by.asc_nulls_last:
      return r'asc_nulls_last';
    case Enum$order_by.desc:
      return r'desc';
    case Enum$order_by.desc_nulls_first:
      return r'desc_nulls_first';
    case Enum$order_by.desc_nulls_last:
      return r'desc_nulls_last';
    case Enum$order_by.$unknown:
      return r'$unknown';
  }
}

Enum$order_by fromJson$Enum$order_by(String value) {
  switch (value) {
    case r'asc':
      return Enum$order_by.asc;
    case r'asc_nulls_first':
      return Enum$order_by.asc_nulls_first;
    case r'asc_nulls_last':
      return Enum$order_by.asc_nulls_last;
    case r'desc':
      return Enum$order_by.desc;
    case r'desc_nulls_first':
      return Enum$order_by.desc_nulls_first;
    case r'desc_nulls_last':
      return Enum$order_by.desc_nulls_last;
    default:
      return Enum$order_by.$unknown;
  }
}

enum Enum$public_user_constraint { public_user_pkey, $unknown }

String toJson$Enum$public_user_constraint(Enum$public_user_constraint e) {
  switch (e) {
    case Enum$public_user_constraint.public_user_pkey:
      return r'public_user_pkey';
    case Enum$public_user_constraint.$unknown:
      return r'$unknown';
  }
}

Enum$public_user_constraint fromJson$Enum$public_user_constraint(String value) {
  switch (value) {
    case r'public_user_pkey':
      return Enum$public_user_constraint.public_user_pkey;
    default:
      return Enum$public_user_constraint.$unknown;
  }
}

enum Enum$public_user_select_column { message, number, user_id, $unknown }

String toJson$Enum$public_user_select_column(Enum$public_user_select_column e) {
  switch (e) {
    case Enum$public_user_select_column.message:
      return r'message';
    case Enum$public_user_select_column.number:
      return r'number';
    case Enum$public_user_select_column.user_id:
      return r'user_id';
    case Enum$public_user_select_column.$unknown:
      return r'$unknown';
  }
}

Enum$public_user_select_column fromJson$Enum$public_user_select_column(
    String value) {
  switch (value) {
    case r'message':
      return Enum$public_user_select_column.message;
    case r'number':
      return Enum$public_user_select_column.number;
    case r'user_id':
      return Enum$public_user_select_column.user_id;
    default:
      return Enum$public_user_select_column.$unknown;
  }
}

enum Enum$public_user_update_column { message, number, user_id, $unknown }

String toJson$Enum$public_user_update_column(Enum$public_user_update_column e) {
  switch (e) {
    case Enum$public_user_update_column.message:
      return r'message';
    case Enum$public_user_update_column.number:
      return r'number';
    case Enum$public_user_update_column.user_id:
      return r'user_id';
    case Enum$public_user_update_column.$unknown:
      return r'$unknown';
  }
}

Enum$public_user_update_column fromJson$Enum$public_user_update_column(
    String value) {
  switch (value) {
    case r'message':
      return Enum$public_user_update_column.message;
    case r'number':
      return Enum$public_user_update_column.number;
    case r'user_id':
      return Enum$public_user_update_column.user_id;
    default:
      return Enum$public_user_update_column.$unknown;
  }
}

enum Enum$user_constraint { user_pkey, user_user_phone_key, $unknown }

String toJson$Enum$user_constraint(Enum$user_constraint e) {
  switch (e) {
    case Enum$user_constraint.user_pkey:
      return r'user_pkey';
    case Enum$user_constraint.user_user_phone_key:
      return r'user_user_phone_key';
    case Enum$user_constraint.$unknown:
      return r'$unknown';
  }
}

Enum$user_constraint fromJson$Enum$user_constraint(String value) {
  switch (value) {
    case r'user_pkey':
      return Enum$user_constraint.user_pkey;
    case r'user_user_phone_key':
      return Enum$user_constraint.user_user_phone_key;
    default:
      return Enum$user_constraint.$unknown;
  }
}

enum Enum$user_select_column {
  created_at,
  role,
  updated_at,
  user_id,
  user_phone,
  $unknown
}

String toJson$Enum$user_select_column(Enum$user_select_column e) {
  switch (e) {
    case Enum$user_select_column.created_at:
      return r'created_at';
    case Enum$user_select_column.role:
      return r'role';
    case Enum$user_select_column.updated_at:
      return r'updated_at';
    case Enum$user_select_column.user_id:
      return r'user_id';
    case Enum$user_select_column.user_phone:
      return r'user_phone';
    case Enum$user_select_column.$unknown:
      return r'$unknown';
  }
}

Enum$user_select_column fromJson$Enum$user_select_column(String value) {
  switch (value) {
    case r'created_at':
      return Enum$user_select_column.created_at;
    case r'role':
      return Enum$user_select_column.role;
    case r'updated_at':
      return Enum$user_select_column.updated_at;
    case r'user_id':
      return Enum$user_select_column.user_id;
    case r'user_phone':
      return Enum$user_select_column.user_phone;
    default:
      return Enum$user_select_column.$unknown;
  }
}

enum Enum$user_update_column {
  created_at,
  role,
  updated_at,
  user_id,
  user_phone,
  $unknown
}

String toJson$Enum$user_update_column(Enum$user_update_column e) {
  switch (e) {
    case Enum$user_update_column.created_at:
      return r'created_at';
    case Enum$user_update_column.role:
      return r'role';
    case Enum$user_update_column.updated_at:
      return r'updated_at';
    case Enum$user_update_column.user_id:
      return r'user_id';
    case Enum$user_update_column.user_phone:
      return r'user_phone';
    case Enum$user_update_column.$unknown:
      return r'$unknown';
  }
}

Enum$user_update_column fromJson$Enum$user_update_column(String value) {
  switch (value) {
    case r'created_at':
      return Enum$user_update_column.created_at;
    case r'role':
      return Enum$user_update_column.role;
    case r'updated_at':
      return Enum$user_update_column.updated_at;
    case r'user_id':
      return Enum$user_update_column.user_id;
    case r'user_phone':
      return Enum$user_update_column.user_phone;
    default:
      return Enum$user_update_column.$unknown;
  }
}

const possibleTypesMap = <String, Set<String>>{};
