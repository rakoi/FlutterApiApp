import 'package:flutter/cupertino.dart';

class ImageBanner extends StatelessWidget{
  String _imgUrl;


  ImageBanner(this._imgUrl);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      constraints: BoxConstraints.expand(
        height: 200.0
      ),
      child: Image.network(_imgUrl,
        fit: BoxFit.cover,
      ),

    );
  }
}