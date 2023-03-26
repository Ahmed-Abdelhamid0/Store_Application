import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_srvices.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget
{
  static String id='HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
     backgroundColor: Colors.white,
     elevation: 0.0,
     title: Text(
       'New Tren',
       style: TextStyle(
         color: Colors.black,
       ),
     ),
     centerTitle: true,
     actions:
     [
      IconButton(
          onPressed: (){},
          icon: Icon(
              FontAwesomeIcons.cartShopping,
               color: Colors.black,
          ),
      ),
     ],
   ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0,top:65.0),

          child: FutureBuilder<List<ProductModel>>(
            future: AllProductsServices().getAllProducts(),
            builder: (context,snapshot)
            {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:1.5,
                    crossAxisSpacing:10.0,
                    mainAxisSpacing: 100.0,
                  ),
                  itemBuilder: (context,index) {
                    return CustomCard(product: products[index],);
                  },
                );
              }
              else if
              (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              else
              {
                return Center(child: CircularProgressIndicator());
              }
            },

          ),
        ),
    );
  }
}

