import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget
{
  static String id ='update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName;

  String? desc;

  String? image;

  String? price;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Update Product',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(

            children:
            [
              SizedBox(height: 55.0,),
              CustomTextFormField(

                onChanged: (value)
                {
                  productName=value;

                },
                 hintText: 'Product Name',
                inputType: TextInputType.name,

               ),
              CustomTextFormField(
                onChanged: (value)
                {
                  desc=value;
                },
                hintText: 'Description',
                inputType: TextInputType.name,
              ),
              CustomTextFormField(
                onChanged: (value)
                {
                  price=value;
                },
                hintText: 'Price',
                inputType: TextInputType.number,
              ),
              CustomTextFormField(
                onChanged: (value)
                {
                  image=value;
                },
                hintText: 'Image',
                inputType: TextInputType.text,
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomButton(
                  text: 'Update Now',
                onTap: () async
                {
                  isLoading= true;
                  setState(() {

                  });
                  try {
                   await updateProduct(product);
                    print('success');
                  } catch (e) {
                    print(e.toString());

                  }
                  isLoading= false;
                  setState(() {

                  });

                },

              ),


            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async{
   await  UpdateProductService().
    updateProduct
      (
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!,
        desc:  desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category,
    );

  }
}
