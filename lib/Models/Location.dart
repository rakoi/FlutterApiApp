class Location{
  String _name;
  String _url;

  Location(this._name,this._url);

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }


}