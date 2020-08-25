import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ricknmorty/Models/Location.dart';

import 'CharacterDetail.dart';

class CharacterListItem extends StatelessWidget{

  int _id;
  String _name;
  String _imgurl;
  Location _location;
  CharacterListItem(this._id,this._name,this._imgurl,this._location);

  @override
  Widget build(BuildContext context) {

    return new Card(

      child: new ListTile(

        leading: CircleAvatar(
            backgroundImage: NetworkImage(
                _imgurl
            ),
        ),

        trailing: Icon(Icons.arrow_forward_ios),
        onTap: (){
          onCharacterTap(_id, context);
        },


        subtitle: Text(_location.name),
        //isThreeLine: true,
        dense: true,
        title:new Text(_name,style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
  onCharacterTap(int id ,BuildContext context){

    Navigator.of(context).push(
      // With MaterialPageRoute, you can pass data between pages,
      // but if you have a more complex app, you will quickly get lost.
      MaterialPageRoute(
        builder: (context) =>

            CharacterDetail(_id,_name,_imgurl,_location.name),
      ),
    );
  }
}