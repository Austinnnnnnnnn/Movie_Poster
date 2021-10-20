
import 'package:flutter/material.dart';
import 'package:movie_search_engine/UI/movie_Infor.dart';
import 'package:movie_search_engine/UI/network.dart';



class homePage extends StatefulWidget {
  const homePage({Key key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override

  List<String> movieList= ["Venom","The Suicide Squad","Free Guy","Injustice","Dragon Fury"];
  Future<movieInformation> movieObject;

  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: MediaQuery.of(context).size.height,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
            separatorBuilder: (context,index)=> SizedBox(width: 0,),
            itemCount: movieList.length,
            itemBuilder: (context,index)=> Container(
                width: MediaQuery.of(context).size.width,
                // decoration: BoxDecoration(
                //   color: Colors.yellowAccent,
                // ),
              child: FutureBuilder(
                future: movieObject=Network().getMovieInfo(movieList[index]),
                builder: (BuildContext context, AsyncSnapshot <movieInformation> snapshot){
                  if(snapshot.hasData){
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data.poster),
                          fit: BoxFit.cover
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2,left: 50,right: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(40),topLeft:Radius.circular(40) ),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 300,
                              width: 265,
                              // margin: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 215),
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                image: DecorationImage(
                                  image: NetworkImage(snapshot.data.poster),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Center(
                              child: Text(snapshot.data.title,style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(snapshot.data.genre.split(",")[0],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(snapshot.data.genre.split(",")[1],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text(snapshot.data.genre.split(",")[2],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(snapshot.data.ratings[0].value),
                                SizedBox(width: 5,),
                                getStar(int.parse(snapshot.data.ratings[0].value[0])),
                              ],
                            ),
                            SizedBox(height: 18,),
                            Container(
                              padding: EdgeInsets.only(left: 30,right: 30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: Colors.grey.withOpacity(0.2)
                              ),
                              child: Center(child: Text(snapshot.data.plot,style: TextStyle(
                                fontSize: 12,
                              ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                }
              ),
            ),
        ),
      ),
    );
  }
}





getStar(int starNum){
  if (starNum==1){
    return Icon(Icons.star,color: Colors.yellow,);
  }else if(starNum==2){
    return Row(
        children: <Widget>[
    Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
        ],
    );
  }else if(starNum==3){
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else if(starNum==4){
    return Row(
      children: <Widget>[
    Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
  Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else if(starNum==5){
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else if(starNum==6){
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else if(starNum==7){
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else if(starNum==8){
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }else{
    return Row(
      children: <Widget>[
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
        Icon(Icons.star,color: Colors.yellow,),
      ],
    );
  }
}

