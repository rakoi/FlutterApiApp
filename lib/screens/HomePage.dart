import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CharacterListItem.dart';
import 'package:ricknmorty/Models/Characters.dart';
import 'package:ricknmorty/controllers/CharactersController.dart';
import 'CharacterDetail.dart';

class HomePage extends StatelessWidget{
   static var pageNo =1;
   CharactersController charactersController=new CharactersController();
   Future<List<Character>> allcharacters= CharactersController.getcharacters(pageNo);


   @override
  Widget build(BuildContext context) {

     ScrollController scrollcontroller=new ScrollController();

     scrollcontroller.addListener((){
       if(scrollcontroller.position.maxScrollExtent==scrollcontroller.position.pixels){

        pageNo++;
        CharactersController.getcharacters(pageNo);

       }
     });

    return new Scaffold(
      appBar: new AppBar(
        title: Text('Squanch'),
      ),
      body: new Container(
     //  child: new Text("HELLo"),
        child:generateCharactersWidgets(allcharacters,scrollcontroller) ,
      ),
    );
  }
  Widget generateCharactersWidgets(Future<List<Character>> characters,ScrollController sc){
   // return characters.map((e) => new CharacterListItem()).toList();
    return FutureBuilder(
      future: characters,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        if(snapshot.connectionState==ConnectionState.done) {
          return ListView.builder(
            itemCount: snapshot.data.length,

            controller: sc,


            itemBuilder: (BuildContext context, index) {

              var itemslength = snapshot.data.length - 1;
                if (itemslength == index) {
                pageNo++;
                CharactersController.getcharacters(pageNo);
              }


              return new CharacterListItem(
                  snapshot.data[index].id, snapshot.data[index].name,
                  snapshot.data[index].image_url,
                  snapshot.data[index].location);
            },

          );
        }else if(snapshot.hasError){
          return Container(
            child: Center(
              child: Text("Something Went Wrong ..."),

            ),
          );
        }else{
          return Container(
                child: Center(
                  child: Text("Loading ..."),
                ),
          );
        }
      },
    );
  }

}