

import 'package:flutter/material.dart';
import 'package:untitled1/models/product_model.dart';

import '../screens/update_screen.dart';

class Custom_Stack extends StatelessWidget {
   Custom_Stack({
    super.key,
   required this.products
  });
 ProductModel products ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateScreen.id , arguments: products);
      },
      child: Stack(
        clipBehavior:Clip.none,
        children: [
          Positioned(
            child: Container(
              height: 140,
              width: 200,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(.2),
                    spreadRadius: 0,
                    offset: Offset(5,5),
                  ),
                ],
              ),
              child:  Card(
                elevation: 10,
                child:  Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(products.title.substring(0 , 7),
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            r"$" "${products.price.toString()}",
                          ),
                          Icon(Icons.favorite ,
                            color: Colors.red,),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left:65,
            top: -40,
            child:
            Image.network( products.image,
                width: 100,height:100),
          ),
        ],
      ),
    );
  }
}