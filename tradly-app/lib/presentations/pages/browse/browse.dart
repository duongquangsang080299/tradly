import 'package:flutter/material.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/widgets/not_found.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TAScaffold(
      body: const NotFoundScreen(),
    );
  }
}
