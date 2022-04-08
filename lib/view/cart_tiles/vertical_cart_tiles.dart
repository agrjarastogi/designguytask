import 'package:ecommerce/api/item_api.dart';
import 'package:ecommerce/model/item_model.dart';
import 'package:flutter/material.dart';

import '../../constants/text_types.dart';
import '../../model/cart_model.dart';

class VerticalCartTile extends StatefulWidget{

  final Map<String,int> item;

  const VerticalCartTile({required this.item, Key? key}): super(key:key);

  @override
  _VerticalCartTile createState() => _VerticalCartTile();
}

class _VerticalCartTile extends State<VerticalCartTile>{
  late ItemModel item;
  int count = 0;
  
  @override
  void initState() {
    super.initState();
    item = getItemById(widget.item['productId']);
    count = CartModel.mapOfProductToQuantity[item.id.toString()] ?? 0;
  }

  onIncrease() {
    CartModel.mapOfProductToQuantity[item.id.toString()] = ++count;
    setState(() {
      count = count;
    });
  }

  onDecrease() {
    CartModel.mapOfProductToQuantity[item.id.toString()] = --count;
    if(count==0){
      dispose();
    }
    setState(() {
      count = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(count == 0){
      return const SizedBox.shrink();
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width / 1.2,
          height: 150,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Stack(children: [
                    const Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 80,
                        width: 80,
                        child: Image.network(
                          item.image,
                          alignment: Alignment.center,
                          colorBlendMode: BlendMode.multiply,
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Text(
                                item.title,
                                style: heading.copyWith(fontSize: 20),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                              255, 27, 192, 129)
                                          .withOpacity(0.4),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Text(
                                    item.category,
                                    style: TextStyle(
                                        color: Colors.blue.shade900
                                            .withOpacity(0.6),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                          ],
                        ),
                          Text(
                            '\$${item.price}',
                            style: subheading.copyWith(fontSize: 15),
                          ),
                        addCartButton(),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }

  ItemModel getItemById(int? itemId) => item  = allProduct.firstWhere((element) => element.id == itemId);

  addCartButton() {
    if (count == 0) {
      return GestureDetector(
        onTap: onIncrease,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
            ),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width / 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                )
              ],
            )),
      );
    }
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.red,
        ),
        padding: const EdgeInsets.all(4.0),
        width: MediaQuery.of(context).size.width / 3.5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: onIncrease,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 10,
                )),
            Text(
              ' $count ',
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
                onPressed: onDecrease,
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 10,
                )),
          ],
        ));
  }


}