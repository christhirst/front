import 'package:grpc/grpc.dart';
import '../proto/generated/data.pbgrpc.dart';

void tt() async {
  final channel = ClientChannel('0.0.0.0',
      port: 9090,
      options:
          const ChannelOptions(credentials: ChannelCredentials.insecure()));

  final stub = LoginUserClient(channel);
  print(channel.host);
  var response = await stub.getUser(UserRequest());
  print('Response receoved: ${response}');
}
