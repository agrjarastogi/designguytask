import 'package:ecommerce/api/item_api.dart';
import 'package:flutter/material.dart';

import '../../constants/colorModel.dart';
import '../../model/item_model.dart';
import '../item_tiles/square_item_tiles.dart';

class HorizontalScrollItems extends StatefulWidget{
  const HorizontalScrollItems({Key? key}) : super(key: key);

  _HorizontalScrollItems createState() => _HorizontalScrollItems();
}

class _HorizontalScrollItems extends State<HorizontalScrollItems> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        width: MediaQuery.of(context).size.width - 10,
        child: FutureBuilder(
          future: fetchAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting ||
                snapshot.connectionState == ConnectionState.active) {
              return CircularProgressIndicator.adaptive(
                valueColor:
                    AlwaysStoppedAnimation<Color>(colorSchemeDark.background),
              );
            }
            List<ItemModel> snapshotData = snapshot.data as List<ItemModel>;
            return ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: snapshotData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, pos) {
                  return  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SquareItemTiles(item: snapshotData[pos]),
                  );
                });
          },
        ));
  }
}
