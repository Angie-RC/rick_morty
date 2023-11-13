import 'package:flutter/material.dart';
import 'package:rick_morty/models/character.dart';
import 'package:rick_morty/repositories/character_repository.dart';

class CharacterFavorites extends StatefulWidget {
  const CharacterFavorites({super.key});
  //final String id;

  @override
  State<CharacterFavorites> createState() => _CharacterFavoritesState();
}

class _CharacterFavoritesState extends State<CharacterFavorites> {
  CharacaterRepository? _characaterRepository;
  List<Character>? _character;

  initialize() async {
    _character = await _characaterRepository?.getAll()?? [];
    setState(() {
      _character = _character;
    });
  }

  @override
  void initState() {
    _characaterRepository = CharacaterRepository();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _character?.length ?? 0,
        itemBuilder: ((context, index) {
          return Card(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_character?[index].name ?? ''),
          ));
        }));
  }
}
