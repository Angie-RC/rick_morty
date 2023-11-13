
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:rick_morty/models/character.dart';

class CharacterService {
  String baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List> getAll() async {
    final http.Response response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      log(response.body);
      final List maps = jsonResponse['results'];
      return maps.map((map) => Character.fromJson(map)).toList();
    }
    return [];
  }
}