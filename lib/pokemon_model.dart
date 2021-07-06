import 'package:flutter/cupertino.dart';

class PokemonModel {
  List<Pokemon> pokemon;

  PokemonModel({this.pokemon});

  PokemonModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      pokemon = new List<Pokemon>();
      json['data'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pokemon {
  String property_category;
  String location;
  String city;
  String district;
  String address_of_property;
  String details;
  String email;
  String contact_no;
  String price;
  String rooms;
  String washrooms;


  Pokemon(
      {this.property_category,
        this.location,
        this.city,
        this.district,
        this.address_of_property,
        this.details,
        this.email,
        this.contact_no,
        this.price,
        this.rooms,
        this.washrooms,});

  Pokemon.fromJson(Map<String, dynamic> json) {
    property_category = json['property_category'] ;
    location = json['location'];
    city = json['city'] ;
    district = json['district'] ;
    address_of_property = json['address_of_property'] ;
    details = json['details'];
    email = json['email'] ;
    contact_no = json['contact_no'];
    price = json['price'] ;
    rooms = json['rooms'] ;
    washrooms = json['washrooms'] ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['property_category'] = this.property_category;
    data['location'] = this.location;
    data['city'] = this.city;
    data['district'] = this.district;
    data['address_of_property'] = this.address_of_property;
    data['details'] = this.details;
    data['email'] = this.email;
    data['contact_no'] = this.contact_no;
    data['price'] = this.price;
    data['rooms'] = this.rooms;
    data['washrooms'] = this.washrooms;


    return data;
  }
}
//
// class NextEvolution {
//   String num;
//   String name;
//
//   NextEvolution({this.num, this.name});
//
//   NextEvolution.fromJson(Map<String, dynamic> json) {
//     num = json['num'];
//     name = json['name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['num'] = this.num;
//     data['name'] = this.name;
//     return data;
//   }
// }