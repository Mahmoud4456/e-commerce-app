import 'package:flutter/material.dart';
import 'package:untitled1/widget/custom_bottom.dart';
import 'package:untitled1/widget/form_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../models/product_model.dart';
import '../services/update_services.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen({super.key});

  static String id = "Update Page";

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName, des, image;
  dynamic? price;

  @override
  Widget build(BuildContext context) {
    bool isLouding = false;
    ProductModel products =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLouding,
      child: Scaffold(
        appBar: AppBar(
          elevation: .5,
          backgroundColor: Colors.transparent,
          title: Text("Update Page"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FormItem(
                onChange: (data) {
                  productName = data;
                },
                label: "Product Name",
              ),
              SizedBox(
                height: 10,
              ),
              FormItem(
                  label: "Description",
                  onChange: (data) {
                    return des;
                  }),
              SizedBox(
                height: 10,
              ),
              FormItem(
                label: "Price",
                onChange: (data) {
                  price = data;
                },
                type: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              FormItem(
                  label: "Image",
                  onChange: (data) {
                    image = data;
                  }),
              SizedBox(
                height: 50,
              ),
              CustomBottom(
                  onTap: () async {
                    isLouding = true;
                    setState(() {});
                    try {
                     await upDateMethod(products);
                      print("Secsess ");
                    } catch (e) {
                      print(e.toString());
                    }
                    setState(() {});
                    isLouding = false;
                  },
                  text: "Update"),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> upDateMethod(ProductModel products) async{
    Put().updateProductServices(
      id: products.id.toString(),
        title: productName  == null ?  products.title :   productName!,
        price: price == null ? products.price.toString()  : price!,
        des: des == null ?  products.description  : des! ,
        image: image == null ? products.image : image! ,
        category: products.category

    );

  }
}
