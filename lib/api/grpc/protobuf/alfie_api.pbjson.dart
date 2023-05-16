///
//  Generated code. Do not modify.
//  source: alfie_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use registerRequestDescriptor instead')
const RegisterRequest$json = const {
  '1': 'RegisterRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'firstName', '3': 3, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 4, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `RegisterRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerRequestDescriptor = $convert.base64Decode('Cg9SZWdpc3RlclJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZBIcCglmaXJzdE5hbWUYAyABKAlSCWZpcnN0TmFtZRIaCghsYXN0TmFtZRgEIAEoCVIIbGFzdE5hbWU=');
@$core.Deprecated('Use verifyUserAccountRequestDescriptor instead')
const VerifyUserAccountRequest$json = const {
  '1': 'VerifyUserAccountRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyUserAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyUserAccountRequestDescriptor = $convert.base64Decode('ChhWZXJpZnlVc2VyQWNjb3VudFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhIKBGNvZGUYAiABKAlSBGNvZGU=');
@$core.Deprecated('Use resendUserVerificationCodeRequestDescriptor instead')
const ResendUserVerificationCodeRequest$json = const {
  '1': 'ResendUserVerificationCodeRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResendUserVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendUserVerificationCodeRequestDescriptor = $convert.base64Decode('CiFSZXNlbmRVc2VyVmVyaWZpY2F0aW9uQ29kZVJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use verifyLoginCodeRequestDescriptor instead')
const VerifyLoginCodeRequest$json = const {
  '1': 'VerifyLoginCodeRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
  ],
};

/// Descriptor for `VerifyLoginCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyLoginCodeRequestDescriptor = $convert.base64Decode('ChZWZXJpZnlMb2dpbkNvZGVSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbBISCgRjb2RlGAIgASgJUgRjb2Rl');
@$core.Deprecated('Use forgotPasswordRequestDescriptor instead')
const ForgotPasswordRequest$json = const {
  '1': 'ForgotPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ForgotPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordRequestDescriptor = $convert.base64Decode('ChVGb3Jnb3RQYXNzd29yZFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');
@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = const {
  '1': 'ResetPasswordRequest',
  '2': const [
    const {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    const {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode('ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSEgoEY29kZRgCIAEoCVIEY29kZRIaCghwYXNzd29yZBgDIAEoCVIIcGFzc3dvcmQ=');
@$core.Deprecated('Use updateUserInfoRequestDescriptor instead')
const UpdateUserInfoRequest$json = const {
  '1': 'UpdateUserInfoRequest',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `UpdateUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoRequestDescriptor = $convert.base64Decode('ChVVcGRhdGVVc2VySW5mb1JlcXVlc3QSHAoJZmlyc3ROYW1lGAEgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYAiABKAlSCGxhc3ROYW1l');
@$core.Deprecated('Use updatePasswordRequestDescriptor instead')
const UpdatePasswordRequest$json = const {
  '1': 'UpdatePasswordRequest',
  '2': const [
    const {'1': 'oldPassword', '3': 1, '4': 1, '5': 9, '10': 'oldPassword'},
    const {'1': 'newPassword', '3': 2, '4': 1, '5': 9, '10': 'newPassword'},
  ],
};

/// Descriptor for `UpdatePasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePasswordRequestDescriptor = $convert.base64Decode('ChVVcGRhdGVQYXNzd29yZFJlcXVlc3QSIAoLb2xkUGFzc3dvcmQYASABKAlSC29sZFBhc3N3b3JkEiAKC25ld1Bhc3N3b3JkGAIgASgJUgtuZXdQYXNzd29yZA==');
@$core.Deprecated('Use createUploadURLForCardsDatabaseBackupRequestDescriptor instead')
const CreateUploadURLForCardsDatabaseBackupRequest$json = const {
  '1': 'CreateUploadURLForCardsDatabaseBackupRequest',
};

/// Descriptor for `CreateUploadURLForCardsDatabaseBackupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUploadURLForCardsDatabaseBackupRequestDescriptor = $convert.base64Decode('CixDcmVhdGVVcGxvYWRVUkxGb3JDYXJkc0RhdGFiYXNlQmFja3VwUmVxdWVzdA==');
@$core.Deprecated('Use createDownloadURLForCardDatabaseBackupRequestDescriptor instead')
const CreateDownloadURLForCardDatabaseBackupRequest$json = const {
  '1': 'CreateDownloadURLForCardDatabaseBackupRequest',
};

/// Descriptor for `CreateDownloadURLForCardDatabaseBackupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDownloadURLForCardDatabaseBackupRequestDescriptor = $convert.base64Decode('Ci1DcmVhdGVEb3dubG9hZFVSTEZvckNhcmREYXRhYmFzZUJhY2t1cFJlcXVlc3Q=');
@$core.Deprecated('Use createMediaFilesUploadURLsRequestDescriptor instead')
const CreateMediaFilesUploadURLsRequest$json = const {
  '1': 'CreateMediaFilesUploadURLsRequest',
  '2': const [
    const {'1': 'fileNames', '3': 1, '4': 3, '5': 9, '10': 'fileNames'},
  ],
};

/// Descriptor for `CreateMediaFilesUploadURLsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMediaFilesUploadURLsRequestDescriptor = $convert.base64Decode('CiFDcmVhdGVNZWRpYUZpbGVzVXBsb2FkVVJMc1JlcXVlc3QSHAoJZmlsZU5hbWVzGAEgAygJUglmaWxlTmFtZXM=');
@$core.Deprecated('Use createMediaFilesDownloadURLsRequestDescriptor instead')
const CreateMediaFilesDownloadURLsRequest$json = const {
  '1': 'CreateMediaFilesDownloadURLsRequest',
  '2': const [
    const {'1': 'fileNames', '3': 1, '4': 3, '5': 9, '10': 'fileNames'},
  ],
};

/// Descriptor for `CreateMediaFilesDownloadURLsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMediaFilesDownloadURLsRequestDescriptor = $convert.base64Decode('CiNDcmVhdGVNZWRpYUZpbGVzRG93bmxvYWRVUkxzUmVxdWVzdBIcCglmaWxlTmFtZXMYASADKAlSCWZpbGVOYW1lcw==');
@$core.Deprecated('Use deleteUnusedMediaFilesRequestDescriptor instead')
const DeleteUnusedMediaFilesRequest$json = const {
  '1': 'DeleteUnusedMediaFilesRequest',
  '2': const [
    const {'1': 'activeFileNames', '3': 1, '4': 3, '5': 9, '10': 'activeFileNames'},
  ],
};

/// Descriptor for `DeleteUnusedMediaFilesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUnusedMediaFilesRequestDescriptor = $convert.base64Decode('Ch1EZWxldGVVbnVzZWRNZWRpYUZpbGVzUmVxdWVzdBIoCg9hY3RpdmVGaWxlTmFtZXMYASADKAlSD2FjdGl2ZUZpbGVOYW1lcw==');
@$core.Deprecated('Use registerReplyDescriptor instead')
const RegisterReply$json = const {
  '1': 'RegisterReply',
};

/// Descriptor for `RegisterReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List registerReplyDescriptor = $convert.base64Decode('Cg1SZWdpc3RlclJlcGx5');
@$core.Deprecated('Use verifyUserAccountReplyDescriptor instead')
const VerifyUserAccountReply$json = const {
  '1': 'VerifyUserAccountReply',
};

/// Descriptor for `VerifyUserAccountReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyUserAccountReplyDescriptor = $convert.base64Decode('ChZWZXJpZnlVc2VyQWNjb3VudFJlcGx5');
@$core.Deprecated('Use resendUserVerificationCodeReplyDescriptor instead')
const ResendUserVerificationCodeReply$json = const {
  '1': 'ResendUserVerificationCodeReply',
};

/// Descriptor for `ResendUserVerificationCodeReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resendUserVerificationCodeReplyDescriptor = $convert.base64Decode('Ch9SZXNlbmRVc2VyVmVyaWZpY2F0aW9uQ29kZVJlcGx5');
@$core.Deprecated('Use loginReplyDescriptor instead')
const LoginReply$json = const {
  '1': 'LoginReply',
};

/// Descriptor for `LoginReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginReplyDescriptor = $convert.base64Decode('CgpMb2dpblJlcGx5');
@$core.Deprecated('Use verifyLoginCodeReplyDescriptor instead')
const VerifyLoginCodeReply$json = const {
  '1': 'VerifyLoginCodeReply',
  '2': const [
    const {'1': 'token', '3': 1, '4': 1, '5': 9, '10': 'token'},
    const {'1': 'firstName', '3': 2, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 3, '4': 1, '5': 9, '10': 'lastName'},
  ],
};

/// Descriptor for `VerifyLoginCodeReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyLoginCodeReplyDescriptor = $convert.base64Decode('ChRWZXJpZnlMb2dpbkNvZGVSZXBseRIUCgV0b2tlbhgBIAEoCVIFdG9rZW4SHAoJZmlyc3ROYW1lGAIgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYAyABKAlSCGxhc3ROYW1l');
@$core.Deprecated('Use forgotPasswordReplyDescriptor instead')
const ForgotPasswordReply$json = const {
  '1': 'ForgotPasswordReply',
};

/// Descriptor for `ForgotPasswordReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List forgotPasswordReplyDescriptor = $convert.base64Decode('ChNGb3Jnb3RQYXNzd29yZFJlcGx5');
@$core.Deprecated('Use resetPasswordReplyDescriptor instead')
const ResetPasswordReply$json = const {
  '1': 'ResetPasswordReply',
};

/// Descriptor for `ResetPasswordReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordReplyDescriptor = $convert.base64Decode('ChJSZXNldFBhc3N3b3JkUmVwbHk=');
@$core.Deprecated('Use updateUserInfoReplyDescriptor instead')
const UpdateUserInfoReply$json = const {
  '1': 'UpdateUserInfoReply',
};

/// Descriptor for `UpdateUserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoReplyDescriptor = $convert.base64Decode('ChNVcGRhdGVVc2VySW5mb1JlcGx5');
@$core.Deprecated('Use updatePasswordReplyDescriptor instead')
const UpdatePasswordReply$json = const {
  '1': 'UpdatePasswordReply',
};

/// Descriptor for `UpdatePasswordReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePasswordReplyDescriptor = $convert.base64Decode('ChNVcGRhdGVQYXNzd29yZFJlcGx5');
@$core.Deprecated('Use createUploadURLForCardsDatabaseBackupReplyDescriptor instead')
const CreateUploadURLForCardsDatabaseBackupReply$json = const {
  '1': 'CreateUploadURLForCardsDatabaseBackupReply',
  '2': const [
    const {'1': 'databaseUploadURL', '3': 1, '4': 1, '5': 9, '10': 'databaseUploadURL'},
    const {'1': 'databaseFileName', '3': 2, '4': 1, '5': 9, '10': 'databaseFileName'},
  ],
};

/// Descriptor for `CreateUploadURLForCardsDatabaseBackupReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUploadURLForCardsDatabaseBackupReplyDescriptor = $convert.base64Decode('CipDcmVhdGVVcGxvYWRVUkxGb3JDYXJkc0RhdGFiYXNlQmFja3VwUmVwbHkSLAoRZGF0YWJhc2VVcGxvYWRVUkwYASABKAlSEWRhdGFiYXNlVXBsb2FkVVJMEioKEGRhdGFiYXNlRmlsZU5hbWUYAiABKAlSEGRhdGFiYXNlRmlsZU5hbWU=');
@$core.Deprecated('Use createDownloadURLForCardDatabaseBackupReplyDescriptor instead')
const CreateDownloadURLForCardDatabaseBackupReply$json = const {
  '1': 'CreateDownloadURLForCardDatabaseBackupReply',
  '2': const [
    const {'1': 'databaseDownloadURL', '3': 1, '4': 1, '5': 9, '10': 'databaseDownloadURL'},
  ],
};

/// Descriptor for `CreateDownloadURLForCardDatabaseBackupReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDownloadURLForCardDatabaseBackupReplyDescriptor = $convert.base64Decode('CitDcmVhdGVEb3dubG9hZFVSTEZvckNhcmREYXRhYmFzZUJhY2t1cFJlcGx5EjAKE2RhdGFiYXNlRG93bmxvYWRVUkwYASABKAlSE2RhdGFiYXNlRG93bmxvYWRVUkw=');
@$core.Deprecated('Use createMediaFilesUploadURLsReplyDescriptor instead')
const CreateMediaFilesUploadURLsReply$json = const {
  '1': 'CreateMediaFilesUploadURLsReply',
  '2': const [
    const {'1': 'mediaFilesUploadURLs', '3': 1, '4': 3, '5': 9, '10': 'mediaFilesUploadURLs'},
  ],
};

/// Descriptor for `CreateMediaFilesUploadURLsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMediaFilesUploadURLsReplyDescriptor = $convert.base64Decode('Ch9DcmVhdGVNZWRpYUZpbGVzVXBsb2FkVVJMc1JlcGx5EjIKFG1lZGlhRmlsZXNVcGxvYWRVUkxzGAEgAygJUhRtZWRpYUZpbGVzVXBsb2FkVVJMcw==');
@$core.Deprecated('Use createMediaFilesDownloadURLsReplyDescriptor instead')
const CreateMediaFilesDownloadURLsReply$json = const {
  '1': 'CreateMediaFilesDownloadURLsReply',
  '2': const [
    const {'1': 'mediaFilesDownloadURLs', '3': 1, '4': 3, '5': 9, '10': 'mediaFilesDownloadURLs'},
    const {'1': 'mediaFilesNames', '3': 2, '4': 3, '5': 9, '10': 'mediaFilesNames'},
  ],
};

/// Descriptor for `CreateMediaFilesDownloadURLsReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createMediaFilesDownloadURLsReplyDescriptor = $convert.base64Decode('CiFDcmVhdGVNZWRpYUZpbGVzRG93bmxvYWRVUkxzUmVwbHkSNgoWbWVkaWFGaWxlc0Rvd25sb2FkVVJMcxgBIAMoCVIWbWVkaWFGaWxlc0Rvd25sb2FkVVJMcxIoCg9tZWRpYUZpbGVzTmFtZXMYAiADKAlSD21lZGlhRmlsZXNOYW1lcw==');
@$core.Deprecated('Use deleteUnusedMediaFilesReplyDescriptor instead')
const DeleteUnusedMediaFilesReply$json = const {
  '1': 'DeleteUnusedMediaFilesReply',
};

/// Descriptor for `DeleteUnusedMediaFilesReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteUnusedMediaFilesReplyDescriptor = $convert.base64Decode('ChtEZWxldGVVbnVzZWRNZWRpYUZpbGVzUmVwbHk=');
