import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CharacterData.dart';
import 'ImageBanner.dart';

class CharacterDetail extends StatelessWidget{

  int _id;
  String _name;
  String _imgurl;
  String _locationName;


  CharacterDetail(this._id,this._name,this._imgurl,this._locationName);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title:Text(_name) ,
      ),
      body: new Column(
        children: [
          ImageBanner(_imgurl),
          CharacterData(_id),
        ],
      ),
    );
  }
}