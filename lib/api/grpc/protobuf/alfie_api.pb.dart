///
//  Generated code. Do not modify.
//  source: alfie_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class RegisterRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName', protoName: 'firstName')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName', protoName: 'lastName')
    ..hasRequiredFields = false
  ;

  RegisterRequest._() : super();
  factory RegisterRequest({
    $core.String? email,
    $core.String? password,
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    return _result;
  }
  factory RegisterRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterRequest clone() => RegisterRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterRequest copyWith(void Function(RegisterRequest) updates) => super.copyWith((message) => updates(message as RegisterRequest)) as RegisterRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterRequest create() => RegisterRequest._();
  RegisterRequest createEmptyInstance() => create();
  static $pb.PbList<RegisterRequest> createRepeated() => $pb.PbList<RegisterRequest>();
  @$core.pragma('dart2js:noInline')
  static RegisterRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterRequest>(create);
  static RegisterRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => clearField(4);
}

class VerifyUserAccountRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyUserAccountRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  VerifyUserAccountRequest._() : super();
  factory VerifyUserAccountRequest({
    $core.String? email,
    $core.String? code,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory VerifyUserAccountRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyUserAccountRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyUserAccountRequest clone() => VerifyUserAccountRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyUserAccountRequest copyWith(void Function(VerifyUserAccountRequest) updates) => super.copyWith((message) => updates(message as VerifyUserAccountRequest)) as VerifyUserAccountRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyUserAccountRequest create() => VerifyUserAccountRequest._();
  VerifyUserAccountRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyUserAccountRequest> createRepeated() => $pb.PbList<VerifyUserAccountRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyUserAccountRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyUserAccountRequest>(create);
  static VerifyUserAccountRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class ResendUserVerificationCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResendUserVerificationCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  ResendUserVerificationCodeRequest._() : super();
  factory ResendUserVerificationCodeRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ResendUserVerificationCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendUserVerificationCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendUserVerificationCodeRequest clone() => ResendUserVerificationCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendUserVerificationCodeRequest copyWith(void Function(ResendUserVerificationCodeRequest) updates) => super.copyWith((message) => updates(message as ResendUserVerificationCodeRequest)) as ResendUserVerificationCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResendUserVerificationCodeRequest create() => ResendUserVerificationCodeRequest._();
  ResendUserVerificationCodeRequest createEmptyInstance() => create();
  static $pb.PbList<ResendUserVerificationCodeRequest> createRepeated() => $pb.PbList<ResendUserVerificationCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static ResendUserVerificationCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendUserVerificationCodeRequest>(create);
  static ResendUserVerificationCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  LoginRequest._() : super();
  factory LoginRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory LoginRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginRequest clone() => LoginRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginRequest copyWith(void Function(LoginRequest) updates) => super.copyWith((message) => updates(message as LoginRequest)) as LoginRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginRequest create() => LoginRequest._();
  LoginRequest createEmptyInstance() => create();
  static $pb.PbList<LoginRequest> createRepeated() => $pb.PbList<LoginRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginRequest>(create);
  static LoginRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class VerifyLoginCodeRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLoginCodeRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..hasRequiredFields = false
  ;

  VerifyLoginCodeRequest._() : super();
  factory VerifyLoginCodeRequest({
    $core.String? email,
    $core.String? code,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    return _result;
  }
  factory VerifyLoginCodeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLoginCodeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLoginCodeRequest clone() => VerifyLoginCodeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLoginCodeRequest copyWith(void Function(VerifyLoginCodeRequest) updates) => super.copyWith((message) => updates(message as VerifyLoginCodeRequest)) as VerifyLoginCodeRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLoginCodeRequest create() => VerifyLoginCodeRequest._();
  VerifyLoginCodeRequest createEmptyInstance() => create();
  static $pb.PbList<VerifyLoginCodeRequest> createRepeated() => $pb.PbList<VerifyLoginCodeRequest>();
  @$core.pragma('dart2js:noInline')
  static VerifyLoginCodeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLoginCodeRequest>(create);
  static VerifyLoginCodeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

class ForgotPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForgotPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..hasRequiredFields = false
  ;

  ForgotPasswordRequest._() : super();
  factory ForgotPasswordRequest({
    $core.String? email,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    return _result;
  }
  factory ForgotPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest clone() => ForgotPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPasswordRequest copyWith(void Function(ForgotPasswordRequest) updates) => super.copyWith((message) => updates(message as ForgotPasswordRequest)) as ForgotPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest create() => ForgotPasswordRequest._();
  ForgotPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ForgotPasswordRequest> createRepeated() => $pb.PbList<ForgotPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPasswordRequest>(create);
  static ForgotPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'code')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'password')
    ..hasRequiredFields = false
  ;

  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest({
    $core.String? email,
    $core.String? code,
    $core.String? password,
  }) {
    final _result = create();
    if (email != null) {
      _result.email = email;
    }
    if (code != null) {
      _result.code = code;
    }
    if (password != null) {
      _result.password = password;
    }
    return _result;
  }
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest)) as ResetPasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => clearField(3);
}

class UpdateUserInfoRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserInfoRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName', protoName: 'firstName')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName', protoName: 'lastName')
    ..hasRequiredFields = false
  ;

  UpdateUserInfoRequest._() : super();
  factory UpdateUserInfoRequest({
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final _result = create();
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    return _result;
  }
  factory UpdateUserInfoRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserInfoRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserInfoRequest clone() => UpdateUserInfoRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserInfoRequest copyWith(void Function(UpdateUserInfoRequest) updates) => super.copyWith((message) => updates(message as UpdateUserInfoRequest)) as UpdateUserInfoRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoRequest create() => UpdateUserInfoRequest._();
  UpdateUserInfoRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateUserInfoRequest> createRepeated() => $pb.PbList<UpdateUserInfoRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserInfoRequest>(create);
  static UpdateUserInfoRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);
}

class UpdatePasswordRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePasswordRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'oldPassword', protoName: 'oldPassword')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'newPassword', protoName: 'newPassword')
    ..hasRequiredFields = false
  ;

  UpdatePasswordRequest._() : super();
  factory UpdatePasswordRequest({
    $core.String? oldPassword,
    $core.String? newPassword,
  }) {
    final _result = create();
    if (oldPassword != null) {
      _result.oldPassword = oldPassword;
    }
    if (newPassword != null) {
      _result.newPassword = newPassword;
    }
    return _result;
  }
  factory UpdatePasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePasswordRequest clone() => UpdatePasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePasswordRequest copyWith(void Function(UpdatePasswordRequest) updates) => super.copyWith((message) => updates(message as UpdatePasswordRequest)) as UpdatePasswordRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordRequest create() => UpdatePasswordRequest._();
  UpdatePasswordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePasswordRequest> createRepeated() => $pb.PbList<UpdatePasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePasswordRequest>(create);
  static UpdatePasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get oldPassword => $_getSZ(0);
  @$pb.TagNumber(1)
  set oldPassword($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOldPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearOldPassword() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => clearField(2);
}

class CreateUploadURLForCardsDatabaseBackupRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUploadURLForCardsDatabaseBackupRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateUploadURLForCardsDatabaseBackupRequest._() : super();
  factory CreateUploadURLForCardsDatabaseBackupRequest() => create();
  factory CreateUploadURLForCardsDatabaseBackupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUploadURLForCardsDatabaseBackupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUploadURLForCardsDatabaseBackupRequest clone() => CreateUploadURLForCardsDatabaseBackupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUploadURLForCardsDatabaseBackupRequest copyWith(void Function(CreateUploadURLForCardsDatabaseBackupRequest) updates) => super.copyWith((message) => updates(message as CreateUploadURLForCardsDatabaseBackupRequest)) as CreateUploadURLForCardsDatabaseBackupRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUploadURLForCardsDatabaseBackupRequest create() => CreateUploadURLForCardsDatabaseBackupRequest._();
  CreateUploadURLForCardsDatabaseBackupRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUploadURLForCardsDatabaseBackupRequest> createRepeated() => $pb.PbList<CreateUploadURLForCardsDatabaseBackupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUploadURLForCardsDatabaseBackupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUploadURLForCardsDatabaseBackupRequest>(create);
  static CreateUploadURLForCardsDatabaseBackupRequest? _defaultInstance;
}

class CreateDownloadURLForCardDatabaseBackupRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDownloadURLForCardDatabaseBackupRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  CreateDownloadURLForCardDatabaseBackupRequest._() : super();
  factory CreateDownloadURLForCardDatabaseBackupRequest() => create();
  factory CreateDownloadURLForCardDatabaseBackupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDownloadURLForCardDatabaseBackupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDownloadURLForCardDatabaseBackupRequest clone() => CreateDownloadURLForCardDatabaseBackupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDownloadURLForCardDatabaseBackupRequest copyWith(void Function(CreateDownloadURLForCardDatabaseBackupRequest) updates) => super.copyWith((message) => updates(message as CreateDownloadURLForCardDatabaseBackupRequest)) as CreateDownloadURLForCardDatabaseBackupRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDownloadURLForCardDatabaseBackupRequest create() => CreateDownloadURLForCardDatabaseBackupRequest._();
  CreateDownloadURLForCardDatabaseBackupRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDownloadURLForCardDatabaseBackupRequest> createRepeated() => $pb.PbList<CreateDownloadURLForCardDatabaseBackupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDownloadURLForCardDatabaseBackupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDownloadURLForCardDatabaseBackupRequest>(create);
  static CreateDownloadURLForCardDatabaseBackupRequest? _defaultInstance;
}

class CreateMediaFilesUploadURLsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMediaFilesUploadURLsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileNames', protoName: 'fileNames')
    ..hasRequiredFields = false
  ;

  CreateMediaFilesUploadURLsRequest._() : super();
  factory CreateMediaFilesUploadURLsRequest({
    $core.Iterable<$core.String>? fileNames,
  }) {
    final _result = create();
    if (fileNames != null) {
      _result.fileNames.addAll(fileNames);
    }
    return _result;
  }
  factory CreateMediaFilesUploadURLsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMediaFilesUploadURLsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMediaFilesUploadURLsRequest clone() => CreateMediaFilesUploadURLsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMediaFilesUploadURLsRequest copyWith(void Function(CreateMediaFilesUploadURLsRequest) updates) => super.copyWith((message) => updates(message as CreateMediaFilesUploadURLsRequest)) as CreateMediaFilesUploadURLsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesUploadURLsRequest create() => CreateMediaFilesUploadURLsRequest._();
  CreateMediaFilesUploadURLsRequest createEmptyInstance() => create();
  static $pb.PbList<CreateMediaFilesUploadURLsRequest> createRepeated() => $pb.PbList<CreateMediaFilesUploadURLsRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesUploadURLsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMediaFilesUploadURLsRequest>(create);
  static CreateMediaFilesUploadURLsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get fileNames => $_getList(0);
}

class CreateMediaFilesDownloadURLsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMediaFilesDownloadURLsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'fileNames', protoName: 'fileNames')
    ..hasRequiredFields = false
  ;

  CreateMediaFilesDownloadURLsRequest._() : super();
  factory CreateMediaFilesDownloadURLsRequest({
    $core.Iterable<$core.String>? fileNames,
  }) {
    final _result = create();
    if (fileNames != null) {
      _result.fileNames.addAll(fileNames);
    }
    return _result;
  }
  factory CreateMediaFilesDownloadURLsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMediaFilesDownloadURLsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMediaFilesDownloadURLsRequest clone() => CreateMediaFilesDownloadURLsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMediaFilesDownloadURLsRequest copyWith(void Function(CreateMediaFilesDownloadURLsRequest) updates) => super.copyWith((message) => updates(message as CreateMediaFilesDownloadURLsRequest)) as CreateMediaFilesDownloadURLsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesDownloadURLsRequest create() => CreateMediaFilesDownloadURLsRequest._();
  CreateMediaFilesDownloadURLsRequest createEmptyInstance() => create();
  static $pb.PbList<CreateMediaFilesDownloadURLsRequest> createRepeated() => $pb.PbList<CreateMediaFilesDownloadURLsRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesDownloadURLsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMediaFilesDownloadURLsRequest>(create);
  static CreateMediaFilesDownloadURLsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get fileNames => $_getList(0);
}

class DeleteUnusedMediaFilesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUnusedMediaFilesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'activeFileNames', protoName: 'activeFileNames')
    ..hasRequiredFields = false
  ;

  DeleteUnusedMediaFilesRequest._() : super();
  factory DeleteUnusedMediaFilesRequest({
    $core.Iterable<$core.String>? activeFileNames,
  }) {
    final _result = create();
    if (activeFileNames != null) {
      _result.activeFileNames.addAll(activeFileNames);
    }
    return _result;
  }
  factory DeleteUnusedMediaFilesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUnusedMediaFilesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUnusedMediaFilesRequest clone() => DeleteUnusedMediaFilesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUnusedMediaFilesRequest copyWith(void Function(DeleteUnusedMediaFilesRequest) updates) => super.copyWith((message) => updates(message as DeleteUnusedMediaFilesRequest)) as DeleteUnusedMediaFilesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUnusedMediaFilesRequest create() => DeleteUnusedMediaFilesRequest._();
  DeleteUnusedMediaFilesRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteUnusedMediaFilesRequest> createRepeated() => $pb.PbList<DeleteUnusedMediaFilesRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteUnusedMediaFilesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUnusedMediaFilesRequest>(create);
  static DeleteUnusedMediaFilesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get activeFileNames => $_getList(0);
}

class RegisterReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RegisterReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  RegisterReply._() : super();
  factory RegisterReply() => create();
  factory RegisterReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RegisterReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RegisterReply clone() => RegisterReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RegisterReply copyWith(void Function(RegisterReply) updates) => super.copyWith((message) => updates(message as RegisterReply)) as RegisterReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RegisterReply create() => RegisterReply._();
  RegisterReply createEmptyInstance() => create();
  static $pb.PbList<RegisterReply> createRepeated() => $pb.PbList<RegisterReply>();
  @$core.pragma('dart2js:noInline')
  static RegisterReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RegisterReply>(create);
  static RegisterReply? _defaultInstance;
}

class VerifyUserAccountReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyUserAccountReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  VerifyUserAccountReply._() : super();
  factory VerifyUserAccountReply() => create();
  factory VerifyUserAccountReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyUserAccountReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyUserAccountReply clone() => VerifyUserAccountReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyUserAccountReply copyWith(void Function(VerifyUserAccountReply) updates) => super.copyWith((message) => updates(message as VerifyUserAccountReply)) as VerifyUserAccountReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyUserAccountReply create() => VerifyUserAccountReply._();
  VerifyUserAccountReply createEmptyInstance() => create();
  static $pb.PbList<VerifyUserAccountReply> createRepeated() => $pb.PbList<VerifyUserAccountReply>();
  @$core.pragma('dart2js:noInline')
  static VerifyUserAccountReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyUserAccountReply>(create);
  static VerifyUserAccountReply? _defaultInstance;
}

class ResendUserVerificationCodeReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResendUserVerificationCodeReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ResendUserVerificationCodeReply._() : super();
  factory ResendUserVerificationCodeReply() => create();
  factory ResendUserVerificationCodeReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResendUserVerificationCodeReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResendUserVerificationCodeReply clone() => ResendUserVerificationCodeReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResendUserVerificationCodeReply copyWith(void Function(ResendUserVerificationCodeReply) updates) => super.copyWith((message) => updates(message as ResendUserVerificationCodeReply)) as ResendUserVerificationCodeReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResendUserVerificationCodeReply create() => ResendUserVerificationCodeReply._();
  ResendUserVerificationCodeReply createEmptyInstance() => create();
  static $pb.PbList<ResendUserVerificationCodeReply> createRepeated() => $pb.PbList<ResendUserVerificationCodeReply>();
  @$core.pragma('dart2js:noInline')
  static ResendUserVerificationCodeReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResendUserVerificationCodeReply>(create);
  static ResendUserVerificationCodeReply? _defaultInstance;
}

class LoginReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LoginReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  LoginReply._() : super();
  factory LoginReply() => create();
  factory LoginReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginReply clone() => LoginReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginReply copyWith(void Function(LoginReply) updates) => super.copyWith((message) => updates(message as LoginReply)) as LoginReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LoginReply create() => LoginReply._();
  LoginReply createEmptyInstance() => create();
  static $pb.PbList<LoginReply> createRepeated() => $pb.PbList<LoginReply>();
  @$core.pragma('dart2js:noInline')
  static LoginReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginReply>(create);
  static LoginReply? _defaultInstance;
}

class VerifyLoginCodeReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'VerifyLoginCodeReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'firstName', protoName: 'firstName')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastName', protoName: 'lastName')
    ..hasRequiredFields = false
  ;

  VerifyLoginCodeReply._() : super();
  factory VerifyLoginCodeReply({
    $core.String? token,
    $core.String? firstName,
    $core.String? lastName,
  }) {
    final _result = create();
    if (token != null) {
      _result.token = token;
    }
    if (firstName != null) {
      _result.firstName = firstName;
    }
    if (lastName != null) {
      _result.lastName = lastName;
    }
    return _result;
  }
  factory VerifyLoginCodeReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VerifyLoginCodeReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VerifyLoginCodeReply clone() => VerifyLoginCodeReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VerifyLoginCodeReply copyWith(void Function(VerifyLoginCodeReply) updates) => super.copyWith((message) => updates(message as VerifyLoginCodeReply)) as VerifyLoginCodeReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static VerifyLoginCodeReply create() => VerifyLoginCodeReply._();
  VerifyLoginCodeReply createEmptyInstance() => create();
  static $pb.PbList<VerifyLoginCodeReply> createRepeated() => $pb.PbList<VerifyLoginCodeReply>();
  @$core.pragma('dart2js:noInline')
  static VerifyLoginCodeReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VerifyLoginCodeReply>(create);
  static VerifyLoginCodeReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get firstName => $_getSZ(1);
  @$pb.TagNumber(2)
  set firstName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFirstName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFirstName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get lastName => $_getSZ(2);
  @$pb.TagNumber(3)
  set lastName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLastName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLastName() => clearField(3);
}

class ForgotPasswordReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ForgotPasswordReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ForgotPasswordReply._() : super();
  factory ForgotPasswordReply() => create();
  factory ForgotPasswordReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ForgotPasswordReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ForgotPasswordReply clone() => ForgotPasswordReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ForgotPasswordReply copyWith(void Function(ForgotPasswordReply) updates) => super.copyWith((message) => updates(message as ForgotPasswordReply)) as ForgotPasswordReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordReply create() => ForgotPasswordReply._();
  ForgotPasswordReply createEmptyInstance() => create();
  static $pb.PbList<ForgotPasswordReply> createRepeated() => $pb.PbList<ForgotPasswordReply>();
  @$core.pragma('dart2js:noInline')
  static ForgotPasswordReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ForgotPasswordReply>(create);
  static ForgotPasswordReply? _defaultInstance;
}

class ResetPasswordReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResetPasswordReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  ResetPasswordReply._() : super();
  factory ResetPasswordReply() => create();
  factory ResetPasswordReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordReply clone() => ResetPasswordReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordReply copyWith(void Function(ResetPasswordReply) updates) => super.copyWith((message) => updates(message as ResetPasswordReply)) as ResetPasswordReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReply create() => ResetPasswordReply._();
  ResetPasswordReply createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordReply> createRepeated() => $pb.PbList<ResetPasswordReply>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordReply>(create);
  static ResetPasswordReply? _defaultInstance;
}

class UpdateUserInfoReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdateUserInfoReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdateUserInfoReply._() : super();
  factory UpdateUserInfoReply() => create();
  factory UpdateUserInfoReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateUserInfoReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateUserInfoReply clone() => UpdateUserInfoReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateUserInfoReply copyWith(void Function(UpdateUserInfoReply) updates) => super.copyWith((message) => updates(message as UpdateUserInfoReply)) as UpdateUserInfoReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoReply create() => UpdateUserInfoReply._();
  UpdateUserInfoReply createEmptyInstance() => create();
  static $pb.PbList<UpdateUserInfoReply> createRepeated() => $pb.PbList<UpdateUserInfoReply>();
  @$core.pragma('dart2js:noInline')
  static UpdateUserInfoReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateUserInfoReply>(create);
  static UpdateUserInfoReply? _defaultInstance;
}

class UpdatePasswordReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'UpdatePasswordReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  UpdatePasswordReply._() : super();
  factory UpdatePasswordReply() => create();
  factory UpdatePasswordReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePasswordReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePasswordReply clone() => UpdatePasswordReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePasswordReply copyWith(void Function(UpdatePasswordReply) updates) => super.copyWith((message) => updates(message as UpdatePasswordReply)) as UpdatePasswordReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordReply create() => UpdatePasswordReply._();
  UpdatePasswordReply createEmptyInstance() => create();
  static $pb.PbList<UpdatePasswordReply> createRepeated() => $pb.PbList<UpdatePasswordReply>();
  @$core.pragma('dart2js:noInline')
  static UpdatePasswordReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePasswordReply>(create);
  static UpdatePasswordReply? _defaultInstance;
}

class CreateUploadURLForCardsDatabaseBackupReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateUploadURLForCardsDatabaseBackupReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'databaseUploadURL', protoName: 'databaseUploadURL')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'databaseFileName', protoName: 'databaseFileName')
    ..hasRequiredFields = false
  ;

  CreateUploadURLForCardsDatabaseBackupReply._() : super();
  factory CreateUploadURLForCardsDatabaseBackupReply({
    $core.String? databaseUploadURL,
    $core.String? databaseFileName,
  }) {
    final _result = create();
    if (databaseUploadURL != null) {
      _result.databaseUploadURL = databaseUploadURL;
    }
    if (databaseFileName != null) {
      _result.databaseFileName = databaseFileName;
    }
    return _result;
  }
  factory CreateUploadURLForCardsDatabaseBackupReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateUploadURLForCardsDatabaseBackupReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateUploadURLForCardsDatabaseBackupReply clone() => CreateUploadURLForCardsDatabaseBackupReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateUploadURLForCardsDatabaseBackupReply copyWith(void Function(CreateUploadURLForCardsDatabaseBackupReply) updates) => super.copyWith((message) => updates(message as CreateUploadURLForCardsDatabaseBackupReply)) as CreateUploadURLForCardsDatabaseBackupReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateUploadURLForCardsDatabaseBackupReply create() => CreateUploadURLForCardsDatabaseBackupReply._();
  CreateUploadURLForCardsDatabaseBackupReply createEmptyInstance() => create();
  static $pb.PbList<CreateUploadURLForCardsDatabaseBackupReply> createRepeated() => $pb.PbList<CreateUploadURLForCardsDatabaseBackupReply>();
  @$core.pragma('dart2js:noInline')
  static CreateUploadURLForCardsDatabaseBackupReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateUploadURLForCardsDatabaseBackupReply>(create);
  static CreateUploadURLForCardsDatabaseBackupReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get databaseUploadURL => $_getSZ(0);
  @$pb.TagNumber(1)
  set databaseUploadURL($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDatabaseUploadURL() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatabaseUploadURL() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get databaseFileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set databaseFileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDatabaseFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDatabaseFileName() => clearField(2);
}

class CreateDownloadURLForCardDatabaseBackupReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateDownloadURLForCardDatabaseBackupReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'databaseDownloadURL', protoName: 'databaseDownloadURL')
    ..hasRequiredFields = false
  ;

  CreateDownloadURLForCardDatabaseBackupReply._() : super();
  factory CreateDownloadURLForCardDatabaseBackupReply({
    $core.String? databaseDownloadURL,
  }) {
    final _result = create();
    if (databaseDownloadURL != null) {
      _result.databaseDownloadURL = databaseDownloadURL;
    }
    return _result;
  }
  factory CreateDownloadURLForCardDatabaseBackupReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateDownloadURLForCardDatabaseBackupReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateDownloadURLForCardDatabaseBackupReply clone() => CreateDownloadURLForCardDatabaseBackupReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateDownloadURLForCardDatabaseBackupReply copyWith(void Function(CreateDownloadURLForCardDatabaseBackupReply) updates) => super.copyWith((message) => updates(message as CreateDownloadURLForCardDatabaseBackupReply)) as CreateDownloadURLForCardDatabaseBackupReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateDownloadURLForCardDatabaseBackupReply create() => CreateDownloadURLForCardDatabaseBackupReply._();
  CreateDownloadURLForCardDatabaseBackupReply createEmptyInstance() => create();
  static $pb.PbList<CreateDownloadURLForCardDatabaseBackupReply> createRepeated() => $pb.PbList<CreateDownloadURLForCardDatabaseBackupReply>();
  @$core.pragma('dart2js:noInline')
  static CreateDownloadURLForCardDatabaseBackupReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateDownloadURLForCardDatabaseBackupReply>(create);
  static CreateDownloadURLForCardDatabaseBackupReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get databaseDownloadURL => $_getSZ(0);
  @$pb.TagNumber(1)
  set databaseDownloadURL($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasDatabaseDownloadURL() => $_has(0);
  @$pb.TagNumber(1)
  void clearDatabaseDownloadURL() => clearField(1);
}

class CreateMediaFilesUploadURLsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMediaFilesUploadURLsReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaFilesUploadURLs', protoName: 'mediaFilesUploadURLs')
    ..hasRequiredFields = false
  ;

  CreateMediaFilesUploadURLsReply._() : super();
  factory CreateMediaFilesUploadURLsReply({
    $core.Iterable<$core.String>? mediaFilesUploadURLs,
  }) {
    final _result = create();
    if (mediaFilesUploadURLs != null) {
      _result.mediaFilesUploadURLs.addAll(mediaFilesUploadURLs);
    }
    return _result;
  }
  factory CreateMediaFilesUploadURLsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMediaFilesUploadURLsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMediaFilesUploadURLsReply clone() => CreateMediaFilesUploadURLsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMediaFilesUploadURLsReply copyWith(void Function(CreateMediaFilesUploadURLsReply) updates) => super.copyWith((message) => updates(message as CreateMediaFilesUploadURLsReply)) as CreateMediaFilesUploadURLsReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesUploadURLsReply create() => CreateMediaFilesUploadURLsReply._();
  CreateMediaFilesUploadURLsReply createEmptyInstance() => create();
  static $pb.PbList<CreateMediaFilesUploadURLsReply> createRepeated() => $pb.PbList<CreateMediaFilesUploadURLsReply>();
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesUploadURLsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMediaFilesUploadURLsReply>(create);
  static CreateMediaFilesUploadURLsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get mediaFilesUploadURLs => $_getList(0);
}

class CreateMediaFilesDownloadURLsReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CreateMediaFilesDownloadURLsReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaFilesDownloadURLs', protoName: 'mediaFilesDownloadURLs')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mediaFilesNames', protoName: 'mediaFilesNames')
    ..hasRequiredFields = false
  ;

  CreateMediaFilesDownloadURLsReply._() : super();
  factory CreateMediaFilesDownloadURLsReply({
    $core.Iterable<$core.String>? mediaFilesDownloadURLs,
    $core.Iterable<$core.String>? mediaFilesNames,
  }) {
    final _result = create();
    if (mediaFilesDownloadURLs != null) {
      _result.mediaFilesDownloadURLs.addAll(mediaFilesDownloadURLs);
    }
    if (mediaFilesNames != null) {
      _result.mediaFilesNames.addAll(mediaFilesNames);
    }
    return _result;
  }
  factory CreateMediaFilesDownloadURLsReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateMediaFilesDownloadURLsReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateMediaFilesDownloadURLsReply clone() => CreateMediaFilesDownloadURLsReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateMediaFilesDownloadURLsReply copyWith(void Function(CreateMediaFilesDownloadURLsReply) updates) => super.copyWith((message) => updates(message as CreateMediaFilesDownloadURLsReply)) as CreateMediaFilesDownloadURLsReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesDownloadURLsReply create() => CreateMediaFilesDownloadURLsReply._();
  CreateMediaFilesDownloadURLsReply createEmptyInstance() => create();
  static $pb.PbList<CreateMediaFilesDownloadURLsReply> createRepeated() => $pb.PbList<CreateMediaFilesDownloadURLsReply>();
  @$core.pragma('dart2js:noInline')
  static CreateMediaFilesDownloadURLsReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateMediaFilesDownloadURLsReply>(create);
  static CreateMediaFilesDownloadURLsReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get mediaFilesDownloadURLs => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.String> get mediaFilesNames => $_getList(1);
}

class DeleteUnusedMediaFilesReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DeleteUnusedMediaFilesReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'alfie.protobuf'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  DeleteUnusedMediaFilesReply._() : super();
  factory DeleteUnusedMediaFilesReply() => create();
  factory DeleteUnusedMediaFilesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteUnusedMediaFilesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteUnusedMediaFilesReply clone() => DeleteUnusedMediaFilesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteUnusedMediaFilesReply copyWith(void Function(DeleteUnusedMediaFilesReply) updates) => super.copyWith((message) => updates(message as DeleteUnusedMediaFilesReply)) as DeleteUnusedMediaFilesReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DeleteUnusedMediaFilesReply create() => DeleteUnusedMediaFilesReply._();
  DeleteUnusedMediaFilesReply createEmptyInstance() => create();
  static $pb.PbList<DeleteUnusedMediaFilesReply> createRepeated() => $pb.PbList<DeleteUnusedMediaFilesReply>();
  @$core.pragma('dart2js:noInline')
  static DeleteUnusedMediaFilesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteUnusedMediaFilesReply>(create);
  static DeleteUnusedMediaFilesReply? _defaultInstance;
}

