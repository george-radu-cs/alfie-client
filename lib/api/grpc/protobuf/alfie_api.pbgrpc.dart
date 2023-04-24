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
  static final _$addMarketDeck =
      $grpc.ClientMethod<$0.AddMarketDeckRequest, $0.AddMarketDeckReply>(
          '/alfie.protobuf.Alfie/AddMarketDeck',
          ($0.AddMarketDeckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.AddMarketDeckReply.fromBuffer(value));
  static final _$updateMarketDeck =
      $grpc.ClientMethod<$0.UpdateMarketDeckRequest, $0.UpdateMarketDeckReply>(
          '/alfie.protobuf.Alfie/UpdateMarketDeck',
          ($0.UpdateMarketDeckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.UpdateMarketDeckReply.fromBuffer(value));
  static final _$deleteMarketDeck =
      $grpc.ClientMethod<$0.DeleteMarketDeckRequest, $0.DeleteMarketDeckReply>(
          '/alfie.protobuf.Alfie/DeleteMarketDeck',
          ($0.DeleteMarketDeckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.DeleteMarketDeckReply.fromBuffer(value));
  static final _$getMarketDecks =
      $grpc.ClientMethod<$0.GetMarketDeckRequest, $0.GetMarketDeckReply>(
          '/alfie.protobuf.Alfie/GetMarketDecks',
          ($0.GetMarketDeckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetMarketDeckReply.fromBuffer(value));
  static final _$getPopularMarketDecks = $grpc.ClientMethod<
          $0.GetPopularMarketDecksRequest, $0.GetPopularMarketDecksReply>(
      '/alfie.protobuf.Alfie/GetPopularMarketDecks',
      ($0.GetPopularMarketDecksRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetPopularMarketDecksReply.fromBuffer(value));
  static final _$getMarketDeck =
      $grpc.ClientMethod<$0.GetMarketDeckRequest, $0.GetMarketDeckReply>(
          '/alfie.protobuf.Alfie/GetMarketDeck',
          ($0.GetMarketDeckRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetMarketDeckReply.fromBuffer(value));
  static final _$getMyMarketDecks =
      $grpc.ClientMethod<$0.GetMyMarketDecksRequest, $0.GetMyMarketDecksReply>(
          '/alfie.protobuf.Alfie/GetMyMarketDecks',
          ($0.GetMyMarketDecksRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.GetMyMarketDecksReply.fromBuffer(value));
  static final _$addMarketDeckReview = $grpc.ClientMethod<
          $0.AddMarketDeckReviewRequest, $0.AddMarketDeckReviewReply>(
      '/alfie.protobuf.Alfie/AddMarketDeckReview',
      ($0.AddMarketDeckReviewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.AddMarketDeckReviewReply.fromBuffer(value));
  static final _$updateMarketDeckReview = $grpc.ClientMethod<
          $0.UpdateMarketDeckReviewRequest, $0.UpdateMarketDeckReviewReply>(
      '/alfie.protobuf.Alfie/UpdateMarketDeckReview',
      ($0.UpdateMarketDeckReviewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.UpdateMarketDeckReviewReply.fromBuffer(value));
  static final _$deleteMarketDeckReview = $grpc.ClientMethod<
          $0.DeleteMarketDeckReviewRequest, $0.DeleteMarketDeckReviewReply>(
      '/alfie.protobuf.Alfie/DeleteMarketDeckReview',
      ($0.DeleteMarketDeckReviewRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.DeleteMarketDeckReviewReply.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.AddMarketDeckReply> addMarketDeck(
      $0.AddMarketDeckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addMarketDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateMarketDeckReply> updateMarketDeck(
      $0.UpdateMarketDeckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateMarketDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteMarketDeckReply> deleteMarketDeck(
      $0.DeleteMarketDeckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMarketDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMarketDeckReply> getMarketDecks(
      $0.GetMarketDeckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMarketDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPopularMarketDecksReply> getPopularMarketDecks(
      $0.GetPopularMarketDecksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPopularMarketDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMarketDeckReply> getMarketDeck(
      $0.GetMarketDeckRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMarketDeck, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetMyMarketDecksReply> getMyMarketDecks(
      $0.GetMyMarketDecksRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyMarketDecks, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddMarketDeckReviewReply> addMarketDeckReview(
      $0.AddMarketDeckReviewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addMarketDeckReview, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateMarketDeckReviewReply> updateMarketDeckReview(
      $0.UpdateMarketDeckReviewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateMarketDeckReview, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.DeleteMarketDeckReviewReply> deleteMarketDeckReview(
      $0.DeleteMarketDeckReviewRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteMarketDeckReview, request,
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
    $addMethod(
        $grpc.ServiceMethod<$0.AddMarketDeckRequest, $0.AddMarketDeckReply>(
            'AddMarketDeck',
            addMarketDeck_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.AddMarketDeckRequest.fromBuffer(value),
            ($0.AddMarketDeckReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateMarketDeckRequest,
            $0.UpdateMarketDeckReply>(
        'UpdateMarketDeck',
        updateMarketDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateMarketDeckRequest.fromBuffer(value),
        ($0.UpdateMarketDeckReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteMarketDeckRequest,
            $0.DeleteMarketDeckReply>(
        'DeleteMarketDeck',
        deleteMarketDeck_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteMarketDeckRequest.fromBuffer(value),
        ($0.DeleteMarketDeckReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetMarketDeckRequest, $0.GetMarketDeckReply>(
            'GetMarketDecks',
            getMarketDecks_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetMarketDeckRequest.fromBuffer(value),
            ($0.GetMarketDeckReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPopularMarketDecksRequest,
            $0.GetPopularMarketDecksReply>(
        'GetPopularMarketDecks',
        getPopularMarketDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetPopularMarketDecksRequest.fromBuffer(value),
        ($0.GetPopularMarketDecksReply value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetMarketDeckRequest, $0.GetMarketDeckReply>(
            'GetMarketDeck',
            getMarketDeck_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetMarketDeckRequest.fromBuffer(value),
            ($0.GetMarketDeckReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetMyMarketDecksRequest,
            $0.GetMyMarketDecksReply>(
        'GetMyMarketDecks',
        getMyMarketDecks_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetMyMarketDecksRequest.fromBuffer(value),
        ($0.GetMyMarketDecksReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddMarketDeckReviewRequest,
            $0.AddMarketDeckReviewReply>(
        'AddMarketDeckReview',
        addMarketDeckReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.AddMarketDeckReviewRequest.fromBuffer(value),
        ($0.AddMarketDeckReviewReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateMarketDeckReviewRequest,
            $0.UpdateMarketDeckReviewReply>(
        'UpdateMarketDeckReview',
        updateMarketDeckReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.UpdateMarketDeckReviewRequest.fromBuffer(value),
        ($0.UpdateMarketDeckReviewReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteMarketDeckReviewRequest,
            $0.DeleteMarketDeckReviewReply>(
        'DeleteMarketDeckReview',
        deleteMarketDeckReview_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.DeleteMarketDeckReviewRequest.fromBuffer(value),
        ($0.DeleteMarketDeckReviewReply value) => value.writeToBuffer()));
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

  $async.Future<$0.AddMarketDeckReply> addMarketDeck_Pre($grpc.ServiceCall call,
      $async.Future<$0.AddMarketDeckRequest> request) async {
    return addMarketDeck(call, await request);
  }

  $async.Future<$0.UpdateMarketDeckReply> updateMarketDeck_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateMarketDeckRequest> request) async {
    return updateMarketDeck(call, await request);
  }

  $async.Future<$0.DeleteMarketDeckReply> deleteMarketDeck_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteMarketDeckRequest> request) async {
    return deleteMarketDeck(call, await request);
  }

  $async.Future<$0.GetMarketDeckReply> getMarketDecks_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetMarketDeckRequest> request) async {
    return getMarketDecks(call, await request);
  }

  $async.Future<$0.GetPopularMarketDecksReply> getPopularMarketDecks_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetPopularMarketDecksRequest> request) async {
    return getPopularMarketDecks(call, await request);
  }

  $async.Future<$0.GetMarketDeckReply> getMarketDeck_Pre($grpc.ServiceCall call,
      $async.Future<$0.GetMarketDeckRequest> request) async {
    return getMarketDeck(call, await request);
  }

  $async.Future<$0.GetMyMarketDecksReply> getMyMarketDecks_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetMyMarketDecksRequest> request) async {
    return getMyMarketDecks(call, await request);
  }

  $async.Future<$0.AddMarketDeckReviewReply> addMarketDeckReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.AddMarketDeckReviewRequest> request) async {
    return addMarketDeckReview(call, await request);
  }

  $async.Future<$0.UpdateMarketDeckReviewReply> updateMarketDeckReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UpdateMarketDeckReviewRequest> request) async {
    return updateMarketDeckReview(call, await request);
  }

  $async.Future<$0.DeleteMarketDeckReviewReply> deleteMarketDeckReview_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.DeleteMarketDeckReviewRequest> request) async {
    return deleteMarketDeckReview(call, await request);
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
  $async.Future<$0.AddMarketDeckReply> addMarketDeck(
      $grpc.ServiceCall call, $0.AddMarketDeckRequest request);
  $async.Future<$0.UpdateMarketDeckReply> updateMarketDeck(
      $grpc.ServiceCall call, $0.UpdateMarketDeckRequest request);
  $async.Future<$0.DeleteMarketDeckReply> deleteMarketDeck(
      $grpc.ServiceCall call, $0.DeleteMarketDeckRequest request);
  $async.Future<$0.GetMarketDeckReply> getMarketDecks(
      $grpc.ServiceCall call, $0.GetMarketDeckRequest request);
  $async.Future<$0.GetPopularMarketDecksReply> getPopularMarketDecks(
      $grpc.ServiceCall call, $0.GetPopularMarketDecksRequest request);
  $async.Future<$0.GetMarketDeckReply> getMarketDeck(
      $grpc.ServiceCall call, $0.GetMarketDeckRequest request);
  $async.Future<$0.GetMyMarketDecksReply> getMyMarketDecks(
      $grpc.ServiceCall call, $0.GetMyMarketDecksRequest request);
  $async.Future<$0.AddMarketDeckReviewReply> addMarketDeckReview(
      $grpc.ServiceCall call, $0.AddMarketDeckReviewRequest request);
  $async.Future<$0.UpdateMarketDeckReviewReply> updateMarketDeckReview(
      $grpc.ServiceCall call, $0.UpdateMarketDeckReviewRequest request);
  $async.Future<$0.DeleteMarketDeckReviewReply> deleteMarketDeckReview(
      $grpc.ServiceCall call, $0.DeleteMarketDeckReviewRequest request);
}
