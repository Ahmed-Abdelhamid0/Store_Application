import 'package:flutter/material.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product.dart';

class CustomCard extends StatelessWidget {
   CustomCard({
    required this.product,
  });

   ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        Navigator.pushNamed(context, UpdateProductPage.id , arguments: product);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            // height: 130.0,
            // width: 220.0,
            decoration: BoxDecoration(
                boxShadow:
                [
                  BoxShadow(
                    blurRadius: 40.0,
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 0.0,
                    offset: Offset(10.0, 10.0),
                  ),
                ]
            ),
            child: Card(
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0 ,
                  vertical: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Text(
                      product.title.substring(0 , 6),
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 3.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:
                      [
                        Text(
                        r'$' ' ${product.price.toString()}',  //row string (r) to make--> $ part of string ' '
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 30.0,
            top: -65.0,
            child: Image(
              height: 100.0,
              width: 100.0,
              image: NetworkImage(
                product.image,

              ),
            ),
          ),

        ],
      ),
    );
  }
}
