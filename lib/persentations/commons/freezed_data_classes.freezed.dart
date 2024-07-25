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
