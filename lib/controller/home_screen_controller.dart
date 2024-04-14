import 'dart:convert';

import 'package:api_complex_model_conversion/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  var myData;
  List<StudentModel> studentModelList = [];
  Map<String, dynamic> studentMap = {
    "data": [
      {
        "name": "Alexander Rodriguez",
        "place": "123456789",
        "age": 3,
        "ph": "23456789",
        "batch": "cvbnm,",
      },
      {
        "name": "John Doe",
        "place": "987654321",
        "age": 20,
        "ph": "9876543210",
        "batch": "xyz",
      },
      {
        "name": "Jane Smith",
        "place": "456789123",
        "age": 25,
        "ph": "1234567890",
        "batch": "abc",
      },
      {
        "name": "Alice Johnson",
        "place": "789123456",
        "age": 22,
        "ph": "4567890123",
        "batch": "def",
      },
      {
        "name": "Bob Roberts",
        "place": "321654987",
        "age": 19,
        "ph": "7890123456",
        "batch": "ghi",
      },
    ]
  };
  void convertToModel() {
    StudentRestModel res = StudentRestModel.fromJson(studentMap);
    studentModelList = res.studentList ?? [];
  }

  // get data from api
  Future<void> getData() async {
    // url
    Uri url = Uri.parse("https://reqres.in/api/users?page=2");

    // calling api get method
    var response = await http.get(url);

    // checking status code
    if (response.statusCode == 200) {
      print(response.body);
      // converting json
      var convertedData = jsonDecode(response.body);
      myData = convertedData;
    } else {
      print("failed");
    }
  }
}
