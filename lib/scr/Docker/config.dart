import 'package:docker_commander/docker_commander_vm.dart';
import 'package:sozluk/env.dart';

class ZemberekConfig extends DockerContainerConfig<DockerContainer> {
  ZemberekConfig({int? hostPort})
      : super(
          env.container,
          version: 'latest',
          hostPorts: hostPort != null ? [hostPort] : null,
          containerPorts: [4567],
        );
}
