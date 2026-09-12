import 'package:flutter/material.dart';
import './init.dart';

class HomePageRepository {
  Future<Map<String, dynamic>> loadData() async {
    var configMap = await initializeApp();
    return Map<String, dynamic>.from(configMap);
  }

  Future<Map<String, dynamic>> getConfigData() async {
    return await loadData();
  }
}
