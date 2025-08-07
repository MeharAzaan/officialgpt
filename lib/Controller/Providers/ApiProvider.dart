import 'package:flutter/material.dart';
import 'package:official_gpt/Model/ApiHandler.dart';

class ApiProvider extends ChangeNotifier{
  final api=Api();
  List<String> question=[];
  List<String>answer=[];
  List<String>history=[];
  bool loading = true;
  Future<void>send(String q)async {
    try{
      loading=true;
      question.add(q);
      final ans = await api.sendRequest(q);
      if(ans!=null){
        answer.add(ans);
        history.add(q);
        loading=false;
        notifyListeners();
      }
    }
    catch(e){
      print(e.toString());
    }
  }
}