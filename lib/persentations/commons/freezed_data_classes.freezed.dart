// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(username: $username, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String username, final String password) =
      _$LoginObjectImpl;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReceiveOrderObject {
  String get refferenceNumber => throw _privateConstructorUsedError;
  String get supplierId => throw _privateConstructorUsedError;
  String get warehouseId => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;
  List<ReceiptProductParam> get productList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReceiveOrderObjectCopyWith<ReceiveOrderObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiveOrderObjectCopyWith<$Res> {
  factory $ReceiveOrderObjectCopyWith(
          ReceiveOrderObject value, $Res Function(ReceiveOrderObject) then) =
      _$ReceiveOrderObjectCopyWithImpl<$Res, ReceiveOrderObject>;
  @useResult
  $Res call(
      {String refferenceNumber,
      String supplierId,
      String warehouseId,
      String note,
      File file,
      List<ReceiptProductParam> productList});
}

/// @nodoc
class _$ReceiveOrderObjectCopyWithImpl<$Res, $Val extends ReceiveOrderObject>
    implements $ReceiveOrderObjectCopyWith<$Res> {
  _$ReceiveOrderObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refferenceNumber = null,
    Object? supplierId = null,
    Object? warehouseId = null,
    Object? note = null,
    Object? file = null,
    Object? productList = null,
  }) {
    return _then(_value.copyWith(
      refferenceNumber: null == refferenceNumber
          ? _value.refferenceNumber
          : refferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      warehouseId: null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptProductParam>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiveOrderObjectImplCopyWith<$Res>
    implements $ReceiveOrderObjectCopyWith<$Res> {
  factory _$$ReceiveOrderObjectImplCopyWith(_$ReceiveOrderObjectImpl value,
          $Res Function(_$ReceiveOrderObjectImpl) then) =
      __$$ReceiveOrderObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String refferenceNumber,
      String supplierId,
      String warehouseId,
      String note,
      File file,
      List<ReceiptProductParam> productList});
}

/// @nodoc
class __$$ReceiveOrderObjectImplCopyWithImpl<$Res>
    extends _$ReceiveOrderObjectCopyWithImpl<$Res, _$ReceiveOrderObjectImpl>
    implements _$$ReceiveOrderObjectImplCopyWith<$Res> {
  __$$ReceiveOrderObjectImplCopyWithImpl(_$ReceiveOrderObjectImpl _value,
      $Res Function(_$ReceiveOrderObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refferenceNumber = null,
    Object? supplierId = null,
    Object? warehouseId = null,
    Object? note = null,
    Object? file = null,
    Object? productList = null,
  }) {
    return _then(_$ReceiveOrderObjectImpl(
      null == refferenceNumber
          ? _value.refferenceNumber
          : refferenceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      null == warehouseId
          ? _value.warehouseId
          : warehouseId // ignore: cast_nullable_to_non_nullable
              as String,
      null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
      null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<ReceiptProductParam>,
    ));
  }
}

/// @nodoc

class _$ReceiveOrderObjectImpl implements _ReceiveOrderObject {
  _$ReceiveOrderObjectImpl(
      this.refferenceNumber,
      this.supplierId,
      this.warehouseId,
      this.note,
      this.file,
      final List<ReceiptProductParam> productList)
      : _productList = productList;

  @override
  final String refferenceNumber;
  @override
  final String supplierId;
  @override
  final String warehouseId;
  @override
  final String note;
  @override
  final File file;
  final List<ReceiptProductParam> _productList;
  @override
  List<ReceiptProductParam> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  String toString() {
    return 'ReceiveOrderObject(refferenceNumber: $refferenceNumber, supplierId: $supplierId, warehouseId: $warehouseId, note: $note, file: $file, productList: $productList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveOrderObjectImpl &&
            (identical(other.refferenceNumber, refferenceNumber) ||
                other.refferenceNumber == refferenceNumber) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.warehouseId, warehouseId) ||
                other.warehouseId == warehouseId) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.file, file) || other.file == file) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      refferenceNumber,
      supplierId,
      warehouseId,
      note,
      file,
      const DeepCollectionEquality().hash(_productList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveOrderObjectImplCopyWith<_$ReceiveOrderObjectImpl> get copyWith =>
      __$$ReceiveOrderObjectImplCopyWithImpl<_$ReceiveOrderObjectImpl>(
          this, _$identity);
}

abstract class _ReceiveOrderObject implements ReceiveOrderObject {
  factory _ReceiveOrderObject(
      final String refferenceNumber,
      final String supplierId,
      final String warehouseId,
      final String note,
      final File file,
      final List<ReceiptProductParam> productList) = _$ReceiveOrderObjectImpl;

  @override
  String get refferenceNumber;
  @override
  String get supplierId;
  @override
  String get warehouseId;
  @override
  String get note;
  @override
  File get file;
  @override
  List<ReceiptProductParam> get productList;
  @override
  @JsonKey(ignore: true)
  _$$ReceiveOrderObjectImplCopyWith<_$ReceiveOrderObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateUserObject {
  String get name => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String get noTelp => throw _privateConstructorUsedError;
  File get file => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateUserObjectCopyWith<UpdateUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateUserObjectCopyWith<$Res> {
  factory $UpdateUserObjectCopyWith(
          UpdateUserObject value, $Res Function(UpdateUserObject) then) =
      _$UpdateUserObjectCopyWithImpl<$Res, UpdateUserObject>;
  @useResult
  $Res call({String name, String? password, String noTelp, File file});
}

/// @nodoc
class _$UpdateUserObjectCopyWithImpl<$Res, $Val extends UpdateUserObject>
    implements $UpdateUserObjectCopyWith<$Res> {
  _$UpdateUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = freezed,
    Object? noTelp = null,
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      noTelp: null == noTelp
          ? _value.noTelp
          : noTelp // ignore: cast_nullable_to_non_nullable
              as String,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateUserObjectImplCopyWith<$Res>
    implements $UpdateUserObjectCopyWith<$Res> {
  factory _$$UpdateUserObjectImplCopyWith(_$UpdateUserObjectImpl value,
          $Res Function(_$UpdateUserObjectImpl) then) =
      __$$UpdateUserObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String? password, String noTelp, File file});
}

/// @nodoc
class __$$UpdateUserObjectImplCopyWithImpl<$Res>
    extends _$UpdateUserObjectCopyWithImpl<$Res, _$UpdateUserObjectImpl>
    implements _$$UpdateUserObjectImplCopyWith<$Res> {
  __$$UpdateUserObjectImplCopyWithImpl(_$UpdateUserObjectImpl _value,
      $Res Function(_$UpdateUserObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? password = freezed,
    Object? noTelp = null,
    Object? file = null,
  }) {
    return _then(_$UpdateUserObjectImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      null == noTelp
          ? _value.noTelp
          : noTelp // ignore: cast_nullable_to_non_nullable
              as String,
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$UpdateUserObjectImpl implements _UpdateUserObject {
  _$UpdateUserObjectImpl(this.name, this.password, this.noTelp, this.file);

  @override
  final String name;
  @override
  final String? password;
  @override
  final String noTelp;
  @override
  final File file;

  @override
  String toString() {
    return 'UpdateUserObject(name: $name, password: $password, noTelp: $noTelp, file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.noTelp, noTelp) || other.noTelp == noTelp) &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, password, noTelp, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserObjectImplCopyWith<_$UpdateUserObjectImpl> get copyWith =>
      __$$UpdateUserObjectImplCopyWithImpl<_$UpdateUserObjectImpl>(
          this, _$identity);
}

abstract class _UpdateUserObject implements UpdateUserObject {
  factory _UpdateUserObject(final String name, final String? password,
      final String noTelp, final File file) = _$UpdateUserObjectImpl;

  @override
  String get name;
  @override
  String? get password;
  @override
  String get noTelp;
  @override
  File get file;
  @override
  @JsonKey(ignore: true)
  _$$UpdateUserObjectImplCopyWith<_$UpdateUserObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreatePurchaseRequestObject {
  String get requestNumber => throw _privateConstructorUsedError;
  String get departmentName => throw _privateConstructorUsedError;
  String get requestDate => throw _privateConstructorUsedError;
  String get requestName => throw _privateConstructorUsedError;
  String get requestDescription => throw _privateConstructorUsedError;
  List<RequestProductParam> get productList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePurchaseRequestObjectCopyWith<CreatePurchaseRequestObject>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePurchaseRequestObjectCopyWith<$Res> {
  factory $CreatePurchaseRequestObjectCopyWith(
          CreatePurchaseRequestObject value,
          $Res Function(CreatePurchaseRequestObject) then) =
      _$CreatePurchaseRequestObjectCopyWithImpl<$Res,
          CreatePurchaseRequestObject>;
  @useResult
  $Res call(
      {String requestNumber,
      String departmentName,
      String requestDate,
      String requestName,
      String requestDescription,
      List<RequestProductParam> productList});
}

/// @nodoc
class _$CreatePurchaseRequestObjectCopyWithImpl<$Res,
        $Val extends CreatePurchaseRequestObject>
    implements $CreatePurchaseRequestObjectCopyWith<$Res> {
  _$CreatePurchaseRequestObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestNumber = null,
    Object? departmentName = null,
    Object? requestDate = null,
    Object? requestName = null,
    Object? requestDescription = null,
    Object? productList = null,
  }) {
    return _then(_value.copyWith(
      requestNumber: null == requestNumber
          ? _value.requestNumber
          : requestNumber // ignore: cast_nullable_to_non_nullable
              as String,
      departmentName: null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      requestName: null == requestName
          ? _value.requestName
          : requestName // ignore: cast_nullable_to_non_nullable
              as String,
      requestDescription: null == requestDescription
          ? _value.requestDescription
          : requestDescription // ignore: cast_nullable_to_non_nullable
              as String,
      productList: null == productList
          ? _value.productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<RequestProductParam>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatePurchaseRequestObjectImplCopyWith<$Res>
    implements $CreatePurchaseRequestObjectCopyWith<$Res> {
  factory _$$CreatePurchaseRequestObjectImplCopyWith(
          _$CreatePurchaseRequestObjectImpl value,
          $Res Function(_$CreatePurchaseRequestObjectImpl) then) =
      __$$CreatePurchaseRequestObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String requestNumber,
      String departmentName,
      String requestDate,
      String requestName,
      String requestDescription,
      List<RequestProductParam> productList});
}

/// @nodoc
class __$$CreatePurchaseRequestObjectImplCopyWithImpl<$Res>
    extends _$CreatePurchaseRequestObjectCopyWithImpl<$Res,
        _$CreatePurchaseRequestObjectImpl>
    implements _$$CreatePurchaseRequestObjectImplCopyWith<$Res> {
  __$$CreatePurchaseRequestObjectImplCopyWithImpl(
      _$CreatePurchaseRequestObjectImpl _value,
      $Res Function(_$CreatePurchaseRequestObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestNumber = null,
    Object? departmentName = null,
    Object? requestDate = null,
    Object? requestName = null,
    Object? requestDescription = null,
    Object? productList = null,
  }) {
    return _then(_$CreatePurchaseRequestObjectImpl(
      null == requestNumber
          ? _value.requestNumber
          : requestNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == departmentName
          ? _value.departmentName
          : departmentName // ignore: cast_nullable_to_non_nullable
              as String,
      null == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as String,
      null == requestName
          ? _value.requestName
          : requestName // ignore: cast_nullable_to_non_nullable
              as String,
      null == requestDescription
          ? _value.requestDescription
          : requestDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == productList
          ? _value._productList
          : productList // ignore: cast_nullable_to_non_nullable
              as List<RequestProductParam>,
    ));
  }
}

/// @nodoc

class _$CreatePurchaseRequestObjectImpl
    implements _CreatePurchaseRequestObject {
  _$CreatePurchaseRequestObjectImpl(
      this.requestNumber,
      this.departmentName,
      this.requestDate,
      this.requestName,
      this.requestDescription,
      final List<RequestProductParam> productList)
      : _productList = productList;

  @override
  final String requestNumber;
  @override
  final String departmentName;
  @override
  final String requestDate;
  @override
  final String requestName;
  @override
  final String requestDescription;
  final List<RequestProductParam> _productList;
  @override
  List<RequestProductParam> get productList {
    if (_productList is EqualUnmodifiableListView) return _productList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productList);
  }

  @override
  String toString() {
    return 'CreatePurchaseRequestObject(requestNumber: $requestNumber, departmentName: $departmentName, requestDate: $requestDate, requestName: $requestName, requestDescription: $requestDescription, productList: $productList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePurchaseRequestObjectImpl &&
            (identical(other.requestNumber, requestNumber) ||
                other.requestNumber == requestNumber) &&
            (identical(other.departmentName, departmentName) ||
                other.departmentName == departmentName) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(other.requestName, requestName) ||
                other.requestName == requestName) &&
            (identical(other.requestDescription, requestDescription) ||
                other.requestDescription == requestDescription) &&
            const DeepCollectionEquality()
                .equals(other._productList, _productList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      requestNumber,
      departmentName,
      requestDate,
      requestName,
      requestDescription,
      const DeepCollectionEquality().hash(_productList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatePurchaseRequestObjectImplCopyWith<_$CreatePurchaseRequestObjectImpl>
      get copyWith => __$$CreatePurchaseRequestObjectImplCopyWithImpl<
          _$CreatePurchaseRequestObjectImpl>(this, _$identity);
}

abstract class _CreatePurchaseRequestObject
    implements CreatePurchaseRequestObject {
  factory _CreatePurchaseRequestObject(
          final String requestNumber,
          final String departmentName,
          final String requestDate,
          final String requestName,
          final String requestDescription,
          final List<RequestProductParam> productList) =
      _$CreatePurchaseRequestObjectImpl;

  @override
  String get requestNumber;
  @override
  String get departmentName;
  @override
  String get requestDate;
  @override
  String get requestName;
  @override
  String get requestDescription;
  @override
  List<RequestProductParam> get productList;
  @override
  @JsonKey(ignore: true)
  _$$CreatePurchaseRequestObjectImplCopyWith<_$CreatePurchaseRequestObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}
