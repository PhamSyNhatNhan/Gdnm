import 'package:flutter/material.dart';
import '../class/Dish.dart';
import '../page/DetailDish.dart';

class SavedRecipesCard extends StatelessWidget {
  final Dish dish_;
  final double cardWeight;
  const SavedRecipesCard({Key? key, required this.dish_, required this.cardWeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDish(
              dishTmp: dish_,
            ),
          ),
        );
      },

      child: Container(
        width: cardWeight,
        child: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    dish_.dishImages[0].dishImage,
                    width: cardWeight - 20,
                    height: cardWeight - 20,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(
                height: 5,
              ),

              Container(
                height: 50,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dish_.dishName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}