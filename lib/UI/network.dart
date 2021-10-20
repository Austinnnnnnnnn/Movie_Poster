

import 'dart:convert';

import 'package:http/http.dart';
import 'package:movie_search_engine/UI/movie_Infor.dart';

class Network{

  Future <movieInformation> getMovieInfo(String movieName) async {
    String finalUrl= "https://www.omdbapi.com/?t="+movieName+"&apikey=2893e2b9";

    final Response= await get(Uri.parse(finalUrl));

    if (Response.statusCode==200){
      print(Response.body);
      return movieInformation.fromJson(jsonDecode(Response.body));
    }else{
      throw Exception("Error get movie information");
    }
  }
}


