///
//  Generated code. Do not modify.
//  source: alfie_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'alfie_api.pb.dart' as $0;
export 'alfie_api.pb.dart';

class AlfieClient extends $grpc.Client {
  static final _$register =
      $grpc.ClientMethod<$0.RegisterRequest, $0.RegisterReply>(
          '/alfie.protobuf.Alfie/Register',
          ($0.RegisterRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.RegisterReply.fromBuffer(value));
  static final _$verifyUserAccount = $grpc.ClientMethod<
          $0.VerifyUserAccountRequest, $0.VerifyUserAccountReply>(
      '/alfie.protobuf.Alfie/VerifyUserAccount',
      ($0.VerifyUserAccountRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.VerifyUserAccountReply.fromBuffer(value));
  static final _$resendUserVerificationCode = $grpc.ClientMethod<
          $0.ResendUserVerificationCodeRequest,
          $0.ResendUserVerificationCodeReply>(
      '/alfie.protobuf.Alfie/ResendUserVerificationCode',
      ($0.ResendUserVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ResendUserVerificationCodeReply.fromBuffer(value));
  static final _$login = $grpc.ClientMethod<$0.LoginRequest, $0.LoginReply>(
      '/alfie.protobuf.Alfie/Login',
      ($0.LoginRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LoginReply.fromBuffer(value));
  static final _$verifyLoginCode =
      $grpc.ClientMethod<$0.VerifyLoginCodeRequest, $0.VerifyLoginCodeReply>(
          '/alfie.protobuf.Alfie/VerifyLoginCode',
          ($0.VerifyLoginCodeRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.VerifyLoginCodeReply.fromBuffer(value));
  static final _$forgotPassword =
      $grpc.ClientMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordReply>(
          '/alfie.protobuf.Alfie/ForgotPassword',
          ($0.ForgotPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ForgotPasswordReply.fromBuffer(value));
  static final _$resetPassword =
      $grpc.ClientMethod<$0.ResetPasswordRequest, $0.ResetPasswordReply>(
          '/alfie.protobuf.Alfie/ResetPassword',
          ($0.ResetPasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResetPasswordReply.fromBuffer(value));
  static final _$updateUserInfo =
      $grpc.ClientMethod<$0.UpdateUserInfoRequest, $0.UpdateUserInfoReply>(
          '/alfie.protobuf.Alfie/UpdateUserInfo',
          ($0.UpdateUserInfoRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateUserInfoReply.fromBuffer(value));
  static final _$updatePassword =
      $grpc.ClientMethod<$0.UpdatePasswordRequest, $0.UpdatePasswordReply>(
          '/alfie.protobuf.Alfie/UpdatePassword',
          ($0.UpdatePasswordRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdatePasswordReply.fromBuffer(value));
  static final _$createUploadURLForCardsDatabaseBackup = $grpc.ClientMethod<
          $0.CreateUploadURLForCardsDatabaseBackupRequest,
          $0.CreateUploadURLForCardsDatabaseBackupReply>(
      '/alfie.protobuf.Alfie/CreateUploadURLForCardsDatabaseBackup',
      ($0.CreateUploadURLForCardsDatabaseBackupRequest value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateUploadURLForCardsDatabaseBackupReply.fromBuffer(value));
  static final _$createDownloadURLForCardsDatabaseBackup = $grpc.ClientMethod<
          $0.CreateDownloadURLForCardDatabaseBackupRequest,
          $0.CreateDownloadURLForCardDatabaseBackupReply>(
      '/alfie.protobuf.Alfie/CreateDownloadURLForCardsDatabaseBackup',
      ($0.CreateDownloadURLForCardDatabaseBackupRequest value) =>
          value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateDownloadURLForCardDatabaseBackupReply.fromBuffer(value));
  static final _$createMediaFilesUploadURLs = $grpc.ClientMethod<
          $0.CreateMediaFilesUploadURLsRequest,
          $0.CreateMediaFilesUploadURLsReply>(
      '/alfie.protobuf.Alfie/CreateMediaFilesUploadURLs',
      ($0.CreateMediaFilesUploadURLsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateMediaFilesUploadURLsReply.fromBuffer(value));
  static final _$createMediaFilesDownloadURLs = $grpc.ClientMethod<
          $0.CreateMediaFilesDownloadURLsRequest,
          $0.CreateMediaFilesDownloadURLsReply>(
      '/alfie.protobuf.Alfie/CreateMediaFilesDownloadURLs',
      ($0.CreateMediaFilesDownloadURLsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.CreateMediaFilesDownloadURLsReply.fromBuffer(value));
  static final _$deleteUnusedMediaFiles = $grpc.ClientMethod<
          $0.DeleteUnusedMediaFilesRequest, $0.DeleteUnusedMediaFilesReply>(
      '/alfie.protobuf.Alfie/DeleteUnusedMediaFiles',
      ($0.DeleteUnusedMediaFilesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeleteUnusedMediaFilesReply.fromBuffer(value));

  AlfieClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.RegisterReply> register($0.RegisterRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$register, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyUserAccountReply> verifyUserAccount(
      $0.VerifyUserAccountRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyUserAccount, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResendUserVerificationCodeReply>
      resendUserVerificationCode($0.ResendUserVerificationCodeRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resendUserVerificationCode, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.LoginReply> login($0.LoginRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$login, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifyLoginCodeReply> verifyLoginCode(
      $0.VerifyLoginCodeRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$verifyLoginCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.ForgotPasswordReply> forgotPassword(
      $0.ForgotPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$forgotPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResetPasswordReply> resetPassword(
      $0.ResetPasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUserInfoReply> updateUserInfo(
      $0.UpdateUserInfoRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePasswordReply> updatePassword(
      $0.UpdatePasswordRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePassword, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateUploadURLForCardsDatabaseBackupReply>
      createUploadURLForCardsDatabaseBackup(
          $0.CreateUploadURLForCardsDatabaseBackupRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUploadURLForCardsDatabaseBackup, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateDownloadURLForCardDatabaseBackupReply>
      createDownloadURLForCardsDatabaseBackup(
          $0.CreateDownloadURLForCardDatabaseBackupRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDownloadURLForCardsDatabaseBackup, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateMediaFilesUploadURLsReply>
      createMediaFilesUploadURLs($0.CreateMediaFilesUploadURLsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMediaFilesUploadURLs, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.CreateMediaFilesDownloadURLsReply>
      createMediaFilesDownloadURLs(
          $0.CreateMediaFilesDownloadURLsRequest request,
          {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMediaFilesDownloadURLs, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.DeleteUnusedMediaFilesReply> deleteUnusedMediaFiles(
      $0.DeleteUnusedMediaFilesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteUnusedMediaFiles, request,
        options: options);
  }
}

abstract class AlfieServiceBase extends $grpc.Service {
  $core.String get $name => 'alfie.protobuf.Alfie';

  AlfieServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RegisterRequest, $0.RegisterReply>(
        'Register',
        register_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RegisterRequest.fromBuffer(value),
        ($0.RegisterReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.VerifyUserAccountRequest,
            $0.VerifyUserAccountReply>(
        'VerifyUserAccount',
        verifyUserAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.VerifyUserAccountRequest.fromBuffer(value),
        ($0.VerifyUserAccountReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResendUserVerificationCodeRequest,
            $0.ResendUserVerificationCodeReply>(
        'ResendUserVerificationCode',
        resendUserVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResendUserVerificationCodeRequest.fromBuffer(value),
        ($0.ResendUserVerificationCodeReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.LoginRequest, $0.LoginReply>(
        'Login',
        login_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.LoginRequest.fromBuffer(value),
        ($0.LoginReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.VerifyLoginCodeRequest, $0.VerifyLoginCodeReply>(
            'VerifyLoginCode',
            verifyLoginCode_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.VerifyLoginCodeRequest.fromBuffer(value),
            ($0.VerifyLoginCodeReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ForgotPasswordRequest, $0.ForgotPasswordReply>(
            'ForgotPassword',
            forgotPassword_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ForgotPasswordRequest.fromBuffer(value),
            ($0.ForgotPasswordReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ResetPasswordRequest, $0.ResetPasswordReply>(
            'ResetPassword',
            resetPassword_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.ResetPasswordRequest.fromBuffer(value),
            ($0.ResetPasswordReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdateUserInfoRequest, $0.UpdateUserInfoReply>(
            'UpdateUserInfo',
            updateUserInfo_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdateUserInfoRequest.fromBuffer(value),
            ($0.UpdateUserInfoReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UpdatePasswordRequest, $0.UpdatePasswordReply>(
            'UpdatePassword',
            updatePassword_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UpdatePasswordRequest.fromBuffer(value),
            ($0.UpdatePasswordReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<
            $0.CreateUploadURLForCardsDatabaseBackupRequest,
            $0.CreateUploadURLForCardsDatabaseBackupReply>(
        'CreateUploadURLForCardsDatabaseBackup',
        createUploadURLForCardsDatabaseBackup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateUploadURLForCardsDatabaseBackupRequest.fromBuffer(value),
        ($0.CreateUploadURLForCardsDatabaseBackupReply value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<
            $0.CreateDownloadURLForCardDatabaseBackupRequest,
            $0.CreateDownloadURLForCardDatabaseBackupReply>(
        'CreateDownloadURLForCardsDatabaseBackup',
        createDownloadURLForCardsDatabaseBackup_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateDownloadURLForCardDatabaseBackupRequest.fromBuffer(value),
        ($0.CreateDownloadURLForCardDatabaseBackupReply value) =>
            value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateMediaFilesUploadURLsRequest,
            $0.CreateMediaFilesUploadURLsReply>(
        'CreateMediaFilesUploadURLs',
        createMediaFilesUploadURLs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateMediaFilesUploadURLsRequest.fromBuffer(value),
        ($0.CreateMediaFilesUploadURLsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateMediaFilesDownloadURLsRequest,
            $0.CreateMediaFilesDownloadURLsReply>(
        'CreateMediaFilesDownloadURLs',
        createMediaFilesDownloadURLs_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.CreateMediaFilesDownloadURLsRequest.fromBuffer(value),
        ($0.CreateMediaFilesDownloadURLsReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteUnusedMediaFilesRequest,
            $0.DeleteUnusedMediaFilesReply>(
        'DeleteUnusedMediaFiles',
        deleteUnusedMediaFiles_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteUnusedMediaFilesRequest.fromBuffer(value),
        ($0.DeleteUnusedMediaFilesReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.RegisterReply> register_Pre(
      $grpc.ServiceCall call, $async.Future<$0.RegisterRequest> request) async {
    return register(call, await request);
  }

  $async.Future<$0.VerifyUserAccountReply> verifyUserAccount_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerifyUserAccountRequest> request) async {
    return verifyUserAccount(call, await request);
  }

  $async.Future<$0.ResendUserVerificationCodeReply>
      resendUserVerificationCode_Pre($grpc.ServiceCall call,
          $async.Future<$0.ResendUserVerificationCodeRequest> request) async {
    return resendUserVerificationCode(call, await request);
  }

  $async.Future<$0.LoginReply> login_Pre(
      $grpc.ServiceCall call, $async.Future<$0.LoginRequest> request) async {
    return login(call, await request);
  }

  $async.Future<$0.VerifyLoginCodeReply> verifyLoginCode_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.VerifyLoginCodeRequest> request) async {
    return verifyLoginCode(call, await request);
  }

  $async.Future<$0.ForgotPasswordReply> forgotPassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ForgotPasswordRequest> request) async {
    return forgotPassword(call, await request);
  }

  $async.Future<$0.ResetPasswordReply> resetPassword_Pre($grpc.ServiceCall call,
      $async.Future<$0.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$0.UpdateUserInfoReply> updateUserInfo_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateUserInfoRequest> request) async {
    return updateUserInfo(call, await request);
  }

  $async.Future<$0.UpdatePasswordReply> updatePassword_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdatePasswordRequest> request) async {
    return updatePassword(call, await request);
  }

  $async.Future<$0.CreateUploadURLForCardsDatabaseBackupReply>
      createUploadURLForCardsDatabaseBackup_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.CreateUploadURLForCardsDatabaseBackupRequest>
              request) async {
    return createUploadURLForCardsDatabaseBackup(call, await request);
  }

  $async.Future<$0.CreateDownloadURLForCardDatabaseBackupReply>
      createDownloadURLForCardsDatabaseBackup_Pre(
          $grpc.ServiceCall call,
          $async.Future<$0.CreateDownloadURLForCardDatabaseBackupRequest>
              request) async {
    return createDownloadURLForCardsDatabaseBackup(call, await request);
  }

  $async.Future<$0.CreateMediaFilesUploadURLsReply>
      createMediaFilesUploadURLs_Pre($grpc.ServiceCall call,
          $async.Future<$0.CreateMediaFilesUploadURLsRequest> request) async {
    return createMediaFilesUploadURLs(call, await request);
  }

  $async.Future<$0.CreateMediaFilesDownloadURLsReply>
      createMediaFilesDownloadURLs_Pre($grpc.ServiceCall call,
          $async.Future<$0.CreateMediaFilesDownloadURLsRequest> request) async {
    return createMediaFilesDownloadURLs(call, await request);
  }

  $async.Future<$0.DeleteUnusedMediaFilesReply> deleteUnusedMediaFiles_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteUnusedMediaFilesRequest> request) async {
    return deleteUnusedMediaFiles(call, await request);
  }

  $async.Future<$0.RegisterReply> register(
      $grpc.ServiceCall call, $0.RegisterRequest request);
  $async.Future<$0.VerifyUserAccountReply> verifyUserAccount(
      $grpc.ServiceCall call, $0.VerifyUserAccountRequest request);
  $async.Future<$0.ResendUserVerificationCodeReply> resendUserVerificationCode(
      $grpc.ServiceCall call, $0.ResendUserVerificationCodeRequest request);
  $async.Future<$0.LoginReply> login(
      $grpc.ServiceCall call, $0.LoginRequest request);
  $async.Future<$0.VerifyLoginCodeReply> verifyLoginCode(
      $grpc.ServiceCall call, $0.VerifyLoginCodeRequest request);
  $async.Future<$0.ForgotPasswordReply> forgotPassword(
      $grpc.ServiceCall call, $0.ForgotPasswordRequest request);
  $async.Future<$0.ResetPasswordReply> resetPassword(
      $grpc.ServiceCall call, $0.ResetPasswordRequest request);
  $async.Future<$0.UpdateUserInfoReply> updateUserInfo(
      $grpc.ServiceCall call, $0.UpdateUserInfoRequest request);
  $async.Future<$0.UpdatePasswordReply> updatePassword(
      $grpc.ServiceCall call, $0.UpdatePasswordRequest request);
  $async.Future<$0.CreateUploadURLForCardsDatabaseBackupReply>
      createUploadURLForCardsDatabaseBackup($grpc.ServiceCall call,
          $0.CreateUploadURLForCardsDatabaseBackupRequest request);
  $async.Future<$0.CreateDownloadURLForCardDatabaseBackupReply>
      createDownloadURLForCardsDatabaseBackup($grpc.ServiceCall call,
          $0.CreateDownloadURLForCardDatabaseBackupRequest request);
  $async.Future<$0.CreateMediaFilesUploadURLsReply> createMediaFilesUploadURLs(
      $grpc.ServiceCall call, $0.CreateMediaFilesUploadURLsRequest request);
  $async.Future<$0.CreateMediaFilesDownloadURLsReply>
      createMediaFilesDownloadURLs($grpc.ServiceCall call,
          $0.CreateMediaFilesDownloadURLsRequest request);
  $async.Future<$0.DeleteUnusedMediaFilesReply> deleteUnusedMediaFiles(
      $grpc.ServiceCall call, $0.DeleteUnusedMediaFilesRequest request);
}
