import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_edition_2/src/home_screen/home_utils/album_pojo.dart';
import 'package:http/http.dart';

Future<AlbumPOJO> fetchData() async {
    final Response response = await get('https://jsonplaceholder.typicode.com/photos/1');

    final dynamic state = json.decode(response.body);
    AlbumPOJO aux = AlbumPOJO.fromJson(state);
    print(aux);
    return aux;
  }
  
class ListTileContainer extends StatelessWidget {
  const ListTileContainer({
    Key key,
    @required this.aux,
  }) : super(key: key);

  final AlbumPOJO aux;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListTile(
        leading: Image.network(
          aux.thumbnailUrl,
          height: 200,
          width: 200,
        ),
        title: Text(aux.title),
        subtitle: Text(aux.url),
      ),
    );
  }
}

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}