import 'package:ricknmorty/Models/Characters.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ricknmorty/Models/Location.dart';
class CharactersController {
  static List<Character> allchars=[];
  static List<int> items=[0];
  static int page=1;



   static Future <List<Character>> getcharacters(int  pageNo) async{


    var data=await http.get("https://rickandmortyapi.com/api/character/?page=$pageNo");


    var decodedjson=jsonDecode(data.body);
    var results=decodedjson['results'];

    if(results!=null){
     for (var result in results){



       Character character=new Character(result['id'], result['name'], result['species'], result['status'], result['type'], result['image'],
           new Location(result['location']['name'], result['location']['url']),
           result['url']);





       if(!items.contains(character.id)){
         items.add(character.id);

         allchars.add(character);

       }
       print(pageNo);










     }
     }

    return allchars;
  }


   Future  getCharacterData(var id) async{
   var data=await http.get("https://rickandmortyapi.com/api/character/$id");
   var result=jsonDecode(data.body);
   Character character=new Character(result['id'], result['name'], result['species'], result['status'], result['type'], result['image'],
       new Location(result['location']['name'], result['location']['url']),
       result['url']);

   return character;

 }




}