import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/models/product_model.dart';
import 'package:untitled1/screens/update_screen.dart';
import '../services/ai_services.dart';
import '../widget/custom_card.dart';

class UserScreen extends StatelessWidget{
  static String id = "User Page";
 late List<ProductModel> product ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Api test"),
      ),
       body: Padding(
           padding: const EdgeInsets.only(left:15 ,right: 15,  top: 40),
           child: FutureBuilder <List<ProductModel>>(
               future:  ProductGetData().fetchProducts(),
               builder: (context , snapshot){
                 if(snapshot.connectionState == ConnectionState.done){
                   if(snapshot.hasData == true){
                     List<ProductModel> product = snapshot.data!;
                     return  GridView.builder(
                         clipBehavior: Clip.none,
                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           childAspectRatio: .87 ,
                           crossAxisSpacing: 15,
                           mainAxisSpacing: 35,
                         ),
                         itemCount:product.length ,
                         itemBuilder: (context , index) {
                           return  Center(
                             child: Custom_Stack(products: product[index],),
                           );
                         });
                   }
                   return Text("result of error data test${snapshot.hasError}");
                 }
                 else{
                   return Center(child: CircularProgressIndicator());
                 }
               })
       ),

      // Container(
      //
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //    print(UserServices().getUserData());
      //   },
      //   child:Icon( Icons.ac_unit),
      // ),
    );
  }


}