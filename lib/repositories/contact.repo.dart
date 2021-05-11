import 'dart:math';

import 'package:contacts_app/model/contact.model.dart';


class ContactsRepository{
  Map<int,Contact> contacts={
    1:Contact(id:1,name:"Firdaouss NADIF",profile:"FN",type: "Student",score:4),
    2:Contact(id:2,name:"Abdeljalil NADIF",profile:"AN",type: "Developer",score:8),
    3:Contact(id:3,name:"Amine GADI",profile:"AG",type: "Student",score:3),
    4:Contact(id:4,name:"Mohamed YOUSSFI",profile:"MY",type: "Developer",score:10),
    5:Contact(id:5,name:"Soukaina ALAM",profile:"SA",type: "Student",score:4)
  };

  Future<List<Contact>> allContatcs() async {
    // var future = await Future.delayed(Duration(seconds : 1));
    int rnd = new Random().nextInt(10);
    if(rnd>1){ //10% d'avoir des erreurs = Probabilite
      return contacts.values.toList();
    }else{
      throw new Exception("Internet Error");
    }
  }
  Future<List<Contact>> contactsByType(String type) async {
    // var future = await Future.delayed(Duration(seconds : 1));
    int rnd = new Random().nextInt(10);
    if(rnd>3){
      return contacts.values.toList().where((element) => element.type == type).toList();
    }else{
      throw new Exception("Internet Error");
    }
  }
}