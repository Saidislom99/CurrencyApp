import 'package:flutter/cupertino.dart';
import 'package:new_project/model/user.dart';
import 'package:dio/dio.dart';




class CurrencyService{
  static Future<List<Welcome>> getData() async{
    Response res= await Dio().get("https://nbu.uz/en/exchange-rates/json/");
    print(res.data);
    
    return(res.data as List).map((element) => Welcome.fromJson(element)).toList();
  }
}