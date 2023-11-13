
import 'package:flutter/material.dart';
import 'package:rick_morty/models/character.dart';
import 'package:rick_morty/repositories/character_repository.dart';
import 'package:rick_morty/services/character_service.dart';

class CharacterList extends StatefulWidget {
  const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  CharacterService? _characterService;
  List? _character;

  initialize() async{
    _character = await _characterService?.getAll()?? [];
    setState(() {
      _character = _character;
    });
  }

  @override
  void initState(){
    _characterService = CharacterService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context){
     return SafeArea(
      child: ListView.builder(
        itemCount: _character?.length ?? 0,
        itemBuilder: (context, index) {
          return CharacterItem(character: _character![index]);
        },
      ),
    );
  }
}

class CharacterItem extends StatefulWidget {
  const CharacterItem({super.key, required this.character});
  final Character character;

  @override
  State<CharacterItem> createState() => _CharacterItemState();
}

class _CharacterItemState extends State<CharacterItem> {
  bool isFavorite = false;

  @override
  void initState() {
    initialize();
    super.initState();
  }

  initialize() async {
    isFavorite = await CharacaterRepository().isFavorite(widget.character);
    if (mounted) {
      setState(() {
        isFavorite = isFavorite;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final image = Image.network(widget.character.image);
    final icon = Icon(Icons.favorite, color: isFavorite ? Colors.cyan : Colors.black);
    final character = widget.character;
     return GestureDetector(
      child: Card(
      elevation: 2,
      child: ListTile(
      leading: SizedBox(
        width: 50.0,
        child: image,
      ),
      title: Text(
        widget.character.name,
      ),
      trailing: IconButton(
        icon: icon,
        onPressed: () {
          setState(() {
                isFavorite = !isFavorite;
              });
              isFavorite
                  ? CharacaterRepository().insert(character)
                  : CharacaterRepository().delete(character);
        },
      ),
    ))
     );
    
}
}



