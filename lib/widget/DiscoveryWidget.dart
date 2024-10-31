import 'package:flutter/material.dart';
import 'package:shimmerai/dummy/MakeList.dart';
import 'DiscoveryCard.dart';

class DiscoveryWidget extends StatefulWidget {
  final MakeList list;

  const DiscoveryWidget({
    super.key,
    required this.list,
  });

  @override
  State<DiscoveryWidget> createState() => _DiscoveryWidgetState();
}

class _DiscoveryWidgetState extends State<DiscoveryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.list.title,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (int i = 0; i < widget.list.list.length; i++)
                  Row(
                    children: [
                      DiscoveryCard(dish: widget.list.list[i],),
                      SizedBox(width: 20)
                    ],
                  )
              ],
            ),
          ),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}