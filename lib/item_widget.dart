import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:flutter_grocery_ui/data.dart';
import 'package:flutter_grocery_ui/product_detail.dart';

import 'models/product.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.product,
  }) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetail(
            product: product,
          );
        }));
      },
      child: Card(
        elevation: 2,
        shadowColor: Color.fromARGB(255, 20, 20, 20),
        color: Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: product.images[0],
              child: SizedBox(
                width: 160,
                child: Image.network(product.images[0]),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            
            const SizedBox(
              height: 7,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                product.title,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 102, 102, 102),
                ),
              ),
            ),
            Text(
              'Rp.${product.price}.000',
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            // const SizedBox(
            //   height: 2,
            // ),
            // Text(
            //   product.price.toString(),
            //   style: const TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.w300,
            //   ),
            // ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 2,
              color: Color.fromARGB(255, 255, 255, 255),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: const [
                        Icon(
                          Icons.add_shopping_cart,
                          size: 18,
                          color: Color.fromARGB(255, 254, 97, 0),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Color.fromARGB(255, 254, 97, 0),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    // Row(
                    //   children: const [
                    //     Icon(
                    //       Icons.remove_circle_outline,
                    //       size: 18,
                    //       color: Color.fromARGB(255, 254, 97, 0),
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(horizontal: 5),
                    //       child: Text('0'),
                    //     ),
                    //     Icon(
                    //       Icons.add_circle_outline,
                    //       size: 18,
                    //       color: Color.fromARGB(255, 254, 97, 0),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
