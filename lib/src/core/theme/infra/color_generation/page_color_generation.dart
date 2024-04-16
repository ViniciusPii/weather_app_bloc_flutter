import 'package:flutter/material.dart';

import '/src/core/ui/components/spacing_page.dart';
import 'app_color_generate.dart';

class PageColorGeneration extends StatelessWidget {
  const PageColorGeneration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerar cores'),
      ),
      body: Center(
        child: SpacingPage(
          child: ElevatedButton(
            onPressed: () => AppColorGenerate.generateLog(
              hexa: 0xff0884CF,
              colorName: "emsBlueAlternative",
            ),
            child: const Text("Gerar Cor"),
          ),
        ),
      ),
    );
  }
}
