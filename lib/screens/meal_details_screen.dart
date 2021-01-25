import 'package:flutter/material.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    Meal currentMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(currentMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              currentMeal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Card(
                elevation: 15,
                child: Container(
                  width: MediaQuery.of(context).size.width * .95,
                  child: Column(
                    children: [
                      Text(
                        'Ingredients',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Container(
                        // height: 60 * currentMeal.ingredients.length.toDouble(),
                        child: ListView(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: currentMeal.ingredients.map((ingredient) {
                            return ListTile(
                                leading: Icon(Icons.circle),
                                title: Text(ingredient));
                          }).toList(),
                        ),
                      ),
                      Text(
                        'Steps',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Container(
                        // height: 70 * currentMeal.steps.length.toDouble(),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: currentMeal.steps.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Theme.of(context).accentColor,
                                child: Text('${index + 1}'),
                              ),
                              title: Text(currentMeal.steps[index]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
