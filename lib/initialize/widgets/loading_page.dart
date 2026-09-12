import 'package:flutter/material.dart';
import '../get_config_data.dart';
import 'package:go_router/go_router.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<void> loadHomeConfigData() async {
    final repository = HomePageRepository();
    final Map<String, dynamic> config = await repository.getConfigData();
    // print(config);
    context.go('/home', extra: config);
  }

  @override
  void initState() {
    super.initState();
    loadHomeConfigData();
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
