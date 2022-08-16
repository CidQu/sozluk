import 'package:docker_commander/docker_commander_vm.dart';
import 'package:flutter/material.dart';
import 'package:sozluk/scr/Docker/config.dart';
import 'package:sozluk/env.dart';

class Setup {
  var dockerCommander = DockerCommander(DockerHostLocal());

  Future<String> docker(int status) async {
    if (status == 1) {
      await dockerCommander.initialize();
      await dockerCommander.checkDaemon();
      var network = await dockerCommander.createNetwork();
      var container = await ZemberekConfig().run(dockerCommander,
          network: network, hostname: env.container);
      return 'Zemberek Docker Started';
    } else if (status == 0) {
      var container = dockerCommander.close();
      return 'Docker Closed';
    } else {
      return 'You requested a wrong type of integer. Use 1 to start the docker, use 0 to close.';
    }
  }
}
