import 'package:flutter/material.dart';
import 'package:flutter_flutter/core/rout_utils.dart';
import 'package:flutter_flutter/features/character_ditails/view.dart';
import '../../core/models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RouteUtils.push(
        context: context,
        view: CharacterDetailsView(
          id: character.id,
        ),
      ),
      child: Container(
        height: 400,
        margin: EdgeInsets.only(bottom: 20),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width - 40,
          child: Text(
            character.name,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.3),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            image: DecorationImage(
                image: NetworkImage(character.image), fit: BoxFit.fill),
            boxShadow: [
              BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 6)
            ]),
      ),
    );
  }
}
