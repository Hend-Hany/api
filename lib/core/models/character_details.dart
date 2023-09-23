import 'package:flutter_flutter/core/models/character.dart';

class CharacterDetails extends Character {
  final String status;
  final String species;
  final String? type;
  final String gender;
  final String location;

  CharacterDetails({
    required super.image,
    required super.name,
    required super.id,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.location,
  });

  factory CharacterDetails.fromJson(Map<String, dynamic>json){
    return CharacterDetails(
      image: json['image'],
      name: json['name'] ,
      id: json['id'],
      status: json['status'],
      species: json['species'],
      type: (json['type']as String).isEmpty?null:json['type'],
      gender: json['gender'],
      location: json['location']['name'],
    );
  }
}
