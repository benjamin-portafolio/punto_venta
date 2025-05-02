import 'dart:convert';

import 'package:punto_venta/data/models/synchronization/synchronization_response.dart';
import 'package:http/http.dart' as http;

class SynchronizationApiService {
  Future<SynchronizationResponse> fetchSynchronizationInfo() async {
    // Simulate a network call
    final url = Uri.parse('http://192.168.0.200:8000/api/espacios');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Parse the response body
      var decodedResponse = jsonDecode(response.body);
      return SynchronizationResponse.fromJson(decodedResponse);
    } else {
      throw Exception('Failed to load synchronization info');
    }
  }
}
