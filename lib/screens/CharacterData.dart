import 'package:flutter/cupertino.dart';
import 'package:ricknmorty/Models/Characters.dart';
import '../controllers/CharactersController.dart';

class CharacterData extends StatelessWidget{

  int _id;
  CharacterData(this._id);
  CharactersController charactersController=new CharactersController();


  @override
  Widget build(BuildContext context) {
     var character=charactersController.getCharacterData(_id);
    return FutureBuilder(
      future: character,
      builder: (BuildContext context,AsyncSnapshot snapshot){
        Character character;
       if(snapshot.connectionState==ConnectionState.done) {
         if(snapshot!=null){
           character= snapshot.data;
         }

         return Expanded(
             child:new Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,

           children: [
             new Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 new Text("Name :"),
                 new Expanded(
                 child:new Text(character.name)
                 )

               ],
             ),
             new Row(
              children: [
                 new Text("Species :"),
                 new Text(character.species)
               ],
             ),
             new  Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                 children: [
                   new Text("Origin :"),
                  new Expanded(

                   child: new Text(character.location.name),
                  )
                 ],
               ),


           ],
         )
         );
       }else if(snapshot.hasError){
         return new Text("Something Went Wrong");
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