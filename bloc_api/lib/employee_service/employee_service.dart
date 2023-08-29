import 'dart:convert';
import 'package:bloc_api/employee_model/employee_model.dart';
import 'package:http/http.dart';


Future<EmployeeList> fetchEmployeeStatus() async {
  final response = await get(Uri.parse('https://dummy.restapiexample.com/api/v1/employees'));
  if (response.statusCode == 200) {
    print(response.body);
    return EmployeeList.fromJson(jsonDecode(response.body));
    
  } else {
    throw Exception('Failed to load employee status');
  }
}