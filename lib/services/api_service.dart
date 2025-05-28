

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/distributor_model.dart';
import '../models/add_distributor_request.dart';

class ApiService {
  static const String baseUrl = 'http://128.199.98.121/admin/Api';
  static const String authToken = '4ccda7514adc0f13595a585205fb9761';

  Future<void> addDistributor(AddDistributorRequest request) async {
    final uri = Uri.parse('$baseUrl/add_distributor');
    var requestBody = http.MultipartRequest('POST', uri);
    requestBody.headers['Authorization'] = authToken;

    requestBody.fields.addAll(request.toFormData());

    if (request.imagePath != null) {
      requestBody.files.add(await http.MultipartFile.fromPath('image', request.imagePath!));
    }

    final response = await requestBody.send();
    
    final responseBody = await response.stream.bytesToString();
    print('POST Response: $responseBody');
    if (response.statusCode != 200) {
      throw Exception('Failed to add distributor: $responseBody');
    }
  }

  Future<List<DistributorModel>> getDistributors(String type) async {
    final uri = Uri.parse('$baseUrl/get_retailer_distributor_master/1');
    final response = await http.post( 
      uri,
      headers: {
        'Authorization': authToken,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'type': type}),
    );
    print('GET Request Type: $type');
    print('GET Response Status: ${response.statusCode}');
    print('GET Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final dynamic decodedResponse = jsonDecode(response.body);
      List<dynamic> data;

      if (decodedResponse is List) {
        data = decodedResponse;
      } else if (decodedResponse is Map<String, dynamic>) {
        if (decodedResponse.containsKey('data')) {
          data = decodedResponse['data'] as List<dynamic>;
        } else {
          data = [decodedResponse];
        }
      } else {
        throw Exception('Unexpected response format: ${response.body}');
      }

      
      final filteredData = data.where((json) => json['type'] == type).toList();
      print('Filtered ${type}s: ${filteredData.length}');
      return filteredData.map((json) => DistributorModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch ${type}s: ${response.statusCode}');
    }
  }
}