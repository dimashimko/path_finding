import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    S tr = S.of(context);
    return Scaffold(
      body: Center(
        child: Text(tr.home_page),
      ),
    );
  }
}
