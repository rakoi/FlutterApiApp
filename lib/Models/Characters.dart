import 'Location.dart';

class Character{

  int _id;
  String _name;
  String _species;
  String _status;
  String _type;
  String _image_url;
  Location _location;
  String _url;


  int get id => _id;

  Character(this._id,this._name,this._species,this._status,this._type,this._image_url,this._location,this._url);



  String get name => _name;

  String get species => _species;

  String get status => _status;

  String get type => _type;

  String get image_url => _image_url;

  Location get location => _location;

  String get url => _url;


}