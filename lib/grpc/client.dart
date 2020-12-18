import 'package:grpc/grpc.dart';
import '../proto/generated/data.pbgrpc.dart';

void tt() async {
  final channel = ClientChannel('localhost',
      port: 9092,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));

  final stub = LoginUserClient(channel);
}
