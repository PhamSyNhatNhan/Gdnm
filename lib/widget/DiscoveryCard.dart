import 'package:flutter/material.dart';
import 'package:shimmerai/class/Dish.dart';
import 'package:shimmerai/class/SubClass.dart';
import 'package:shimmerai/page/DetailDish.dart';

class DiscoveryCard extends StatefulWidget {
  final Dish dish;

  const DiscoveryCard({
    super.key,
    required this.dish,
  });

  @override
  State<DiscoveryCard> createState() => _DiscoveryCardState();
}

class _DiscoveryCardState extends State<DiscoveryCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
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
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                widget.dish.dishImages[0].dishImage,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 40,
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.dish.dishTimeCook + " phút",
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),

                Text(
                  ' • ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),

                Text(
                  widget.dish.dishUp + " ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500
                  ),
                ),

                Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 15,
                ),


              ],
            ),

            SizedBox(
              height: 0,
            ),

            Text(
              widget.dish.dishName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
              ),
            ),
          ],
        ),
      ),

      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailDish(
              dishTmp: widget.dish,
            ),
          ),
        );
      },
    );
  }
}