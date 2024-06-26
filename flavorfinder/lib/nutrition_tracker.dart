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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _dateController.text =
          picked.toString(); // Update the text field with the selected date
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Nutrition Tracker',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      _selectDate(context); // Call function to show date picker
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: _dateController,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _caloriesController,
                    decoration: InputDecoration(
                      labelText: 'Calories',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter calories';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _proteinsController,
                    decoration: InputDecoration(
                      labelText: 'Proteins (g)',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter proteins';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _fatsController,
                    decoration: InputDecoration(
                      labelText: 'Fats (g)',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter fats';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: _carbsController,
                    decoration: InputDecoration(
                      labelText: 'Carbs (g)',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
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
            Expanded(
              flex: 3,
              child: _entries.isNotEmpty
                  ? SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(
                        text: 'Nutritional Intake',
                        textStyle: TextStyle(color: Colors.white),
                      ),
                      legend: Legend(
                        isVisible: true,
                        textStyle: TextStyle(color: Colors.white),
                      ),
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
                    )
                  : Center(
                      child: Text(
                        'No entries yet.',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: _entries.length,
                itemBuilder: (context, index) {
                  final entry = _entries[index];
                  return ListTile(
                    title: Text(
                      '${entry['date']}',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'Calories: ${entry['calories']}, Proteins: ${entry['proteins']}g, Fats: ${entry['fats']}g, Carbs: ${entry['carbs']}g',
                      style: TextStyle(color: Colors.white),
                    ),
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
