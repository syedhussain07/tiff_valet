import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BMIWidget extends StatefulWidget {
  const BMIWidget({Key? key}) : super(key: key);

  @override
  _BMIWidgetState createState() => _BMIWidgetState();
}

class _BMIWidgetState extends State<BMIWidget> {
  final _formKey = GlobalKey<FormState>();
  double? _height, _weight, _bmi;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _bmi = _calculateBMI();
      });
    }
  }

  double _calculateBMI() {
    return _weight! / (_height! * _height!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter your height (in meters)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
                onSaved: (value) {
                  _height = double.parse(value!);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Enter your weight (in kg)',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
                onSaved: (value) {
                  _weight = double.parse(value!);
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Calculate BMI'),
              ),
              if (_bmi != null)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BMI: ${_bmi!.toStringAsFixed(1)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Last Updated On: ${DateFormat.yMMMd().format(DateTime.now())}',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
