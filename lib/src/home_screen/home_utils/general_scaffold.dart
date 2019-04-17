import 'package:flutter/material.dart';
import 'package:flutter_edition_2/src/home_screen/home_utils/album_pojo.dart';
import 'package:flutter_edition_2/src/home_screen/home_utils/utils.dart';

class GeneralScaffold extends StatelessWidget {
  const GeneralScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AlbumPOJO>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<AlbumPOJO> snapshot) {
          final AlbumPOJO aux = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingSpinner();
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListTileContainer(aux: aux);
            }
          }
        },
      ),
    );
  }
}