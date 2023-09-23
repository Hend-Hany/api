import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flutter/core/models/character_details.dart';

class CharacterDetailsView extends StatefulWidget {
  const CharacterDetailsView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<CharacterDetailsView> createState() => _CharacterDetailsViewState();
}

class _CharacterDetailsViewState extends State<CharacterDetailsView> {
  bool isLoading = true;
  CharacterDetails? details;

  @override
  void initState() {
    getCharacterDetails();
    super.initState();
  }

  void getCharacterDetails() async {
    try {
      final response = await Dio().get('https://rickandmortyapi.com/api/character/${widget.id}');
      details = CharacterDetails.fromJson(response.data);
    } catch (e) {
      print(e);
    }
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text(character.name),
          ),
      body: Builder(
        builder: (context) {
          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(details==null){
            return Center(
              child:Text('Something went wrong'),
            );
          }
          return Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.network(
                    details!.image,
                    fit: BoxFit.cover,
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(details!.name),
                      SizedBox(height: 12,),
                      Text(details!.gender),
                      SizedBox(height: 12,),
                      if (details?.type != null)
                        Text(details!.type!),

                    ],
                  ),
                ),
              ),
            // ],
          ]);
        }
        ),
    );
  }
}
