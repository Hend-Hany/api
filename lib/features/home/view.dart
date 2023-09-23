import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flutter/features/widget/character_card.dart';
import '../../core/models/character.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = true;
  List<Character> characters=[];

  @override
  void initState() {
    getCharacter();
    super.initState();
  }

  void getCharacter() async {
    try{
      final response = await Dio().get('https://rickandmortyapi.com/api/character');
      if(response.statusCode==200){
        for(var i in response.data['results']){
          final c=Character.fromJson(i);
          print(c.name);
          characters.add(c);
        }
      }
    }
    catch(e){
      print(e);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context){
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }  else if(characters.isEmpty){
            return Center(
              child: Text('Try Again'),
            );
          }
          return ListView.builder(
              itemCount: characters.length,
              padding: EdgeInsets.all(20),
              itemBuilder: (context, index) {
                return CharacterCard(
                  character: characters[index],
                );
              });
        },
      )
    );
  }
}
