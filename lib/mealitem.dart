import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal meal) onSelectMeal;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: InkWell(
            onTap: () {
              onSelectMeal(meal);
            },
            child: Stack(
              // use to add one stack over other in form of z index
              children: [
                FadeInImage(
                  placeholder: MemoryImage(kTransparentImage),
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                  height: 200,
                  width: double.infinity,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                          meal.title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MealitemTrait(
                                icon: Icons.schedule,
                                label: meal.duration.toString()),
                            const SizedBox(
                              width: 12,
                            ),
                            MealitemTrait(
                                icon: Icons.work,
                                label: meal.complexity.name.toString()),
                            const SizedBox(
                              width: 12,
                            ),
                            MealitemTrait(
                                icon: Icons.attach_money,
                                label: meal.affordability.name.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
            //},
            ),
      ),
    );
  }
}
