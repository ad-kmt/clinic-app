import 'package:http/http.dart' as http;
import '../constants.dart';

class API_Manager {

  void getNews() async{
    var client = http.Client();
    var response = await client.get(home_slider_url);
    if (response.statusCode==200){
      var jsonString = response.body;
    }


  }
}