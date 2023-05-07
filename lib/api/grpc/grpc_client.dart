import 'package:alfie/api/grpc/protobuf/alfie_api.pbgrpc.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';

class GrpcClient {
  late AlfieClient _client;
  AlfieClient get client => _client;

  GrpcClient._privateConstructor();
  static final GrpcClient instance = GrpcClient._privateConstructor();

  Future<void> init() async {
    ChannelOptions channelOptions;
    if (dotenv.env["IN_PRODUCTION"]!.toLowerCase() == "true") {
      var trustedRoot = await rootBundle.load('assets/ca/alfie-cloud-services.crt');
      channelOptions =
          ChannelOptions(credentials: ChannelCredentials.secure(certificates: trustedRoot.buffer.asUint8List()));
    } else {
      channelOptions = const ChannelOptions(credentials: ChannelCredentials.insecure());
    }
    final channel = ClientChannel(
      dotenv.env["GRPC_HOST"]!,
      port: int.parse(dotenv.env["GRPC_PORT"]!),
      options: channelOptions,
    );
    _client = AlfieClient(channel);
  }
}

CallOptions getCallOptionsWithAuthorization(UserProvider userProvider) {
  return CallOptions(metadata: {"authorization": "Bearer ${userProvider.user.token!}"});
}
