// nutrition_tracker.dart
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class NutritionTracker extends StatefulWidget {
  @override
  _NutritionTrackerState createState() => _NutritionTrackerState();
}

class _NutritionTrackerState extends State<NutritionTracker> {
  final List<Map<String, dynamic>> _entries = [];
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinsController = TextEditingController();
  final _fatsController = TextEditingController();
  final _carbsController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _caloriesController.dispose();
    _proteinsController.dispose();
    _fatsController.dispose();
    _carbsController.dispose();
    super.dispose();
  }

  void _addEntry() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _entries.add({
          'date': _dateController.text,
          'calories': int.parse(_caloriesController.text),
          'proteins': int.parse(_proteinsController.text),
          'fats': int.parse(_fatsController.text),
          'carbs': int.parse(_carbsController.text),
        });
        _dateController.clear();
        _caloriesController.clear();
        _proteinsController.clear();
        _fatsController.clear();
        _carbsController.clear();
      });
    }
  }

  List<ChartData> getChartData(String nutrient) {
    return _entries
        .map((entry) => ChartData(entry['date'], entry[nutrient].toDouble()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nutrition Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(labelText: 'Date'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a date';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _caloriesController,
                    decoration: InputDecoration(labelText: 'Calories'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter calories';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _proteinsController,
                    decoration: InputDecoration(labelText: 'Proteins (g)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter proteins';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _fatsController,
                    decoration: InputDecoration(labelText: 'Fats (g)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter fats';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _carbsController,
                    decoration: InputDecoration(labelText: 'Carbs (g)'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter carbs';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addEntry,
                    child: Text('Add Entry'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _entries.isNotEmpty
                ? Expanded(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(text: 'Nutritional Intake'),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <LineSeries<ChartData, String>>[
                        LineSeries<ChartData, String>(
                          dataSource: getChartData('calories'),
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.value,
                          name: 'Calories',
                        ),
                        LineSeries<ChartData, String>(
                          dataSource: getChartData('proteins'),
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.value,
                          name: 'Proteins',
                        ),
                        LineSeries<ChartData, String>(
                          dataSource: getChartData('fats'),
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.value,
                          name: 'Fats',
                        ),
                        LineSeries<ChartData, String>(
                          dataSource: getChartData('carbs'),
                          xValueMapper: (ChartData data, _) => data.date,
                          yValueMapper: (ChartData data, _) => data.value,
                          name: 'Carbs',
                        ),
                      ],
                    ),
                  )
                : Text('No entries yet.'),
            Expanded(
              child: ListView.builder(
                itemCount: _entries.length,
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return ListTile(
                    title: Text('${entry['date']}'),
                    subtitle: Text(
                        'Calories: ${entry['calories']}, Proteins: ${entry['proteins']}g, Fats: ${entry['fats']}g, Carbs: ${entry['carbs']}g'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.date, this.value);
  final String date;
  final double value;
}
