import 'package:alfie/api/grpc/protobuf/alfie_api.pbgrpc.dart';
import 'package:alfie/services/user_provider.dart';
import 'package:grpc/grpc.dart';

const String grpcHost = "10.0.2.2";
const int grpcPort = 8080;

class GrpcClient {
  late AlfieClient _client;
  AlfieClient get client => _client;

  GrpcClient._privateConstructor();
  static final GrpcClient instance = GrpcClient._privateConstructor();

  Future<void> init() async {
    final channel = ClientChannel(
      grpcHost,
      port: grpcPort,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    _client = AlfieClient(channel);
  }
}

CallOptions getCallOptionsWithAuthorization(UserProvider userProvider) {
  return CallOptions(metadata: {"authorization": "Bearer ${userProvider.user.token!}"});
}
