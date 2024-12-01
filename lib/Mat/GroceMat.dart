import 'package:flutter/material.dart';
import '../class/DishMaterial.dart';
import '../dummy/MakeList.dart';
import '../class/DataDummyHelper.dart';
import '../dummy/MaterialDish.dart';

class GrocesMat extends StatefulWidget {
  final MakeList plant;

  const GrocesMat({Key? key, required this.plant}) : super(key: key);

  @override
  State<GrocesMat> createState() => _GrocesMatState();
}

class _GrocesMatState extends State<GrocesMat> {
  List<DishMaterial> getMaterials(String dishId) {
    return DummyDataHelper.getMaterials(dishId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nguyên liệu",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 16),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.plant.list.length,
              itemBuilder: (context, index) {
                final dish = widget.plant.list[index];
                final materials = getMaterials(dish.dishId);
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dish.dishName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: materials.map((material) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),

                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  material.dishMaterialName
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    '${material.dishMaterialMass}g',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}