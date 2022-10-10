import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NovaTelaPage extends StatelessWidget {
  const NovaTelaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tela'),
      ),
      body: Center(
        child: Text('${ModalRoute.of(context)?.settings.arguments}'),
      ),
    );
  }
}
