import 'package:flutter/material.dart';
import 'dart:math';

enum Gender { male, female }

class HealthCalculationsScreen extends StatefulWidget {
  @override
  _HealthCalculationsScreenState createState() =>
      _HealthCalculationsScreenState();
}

class _HealthCalculationsScreenState extends State<HealthCalculationsScreen> {
  double _age = 30;
  double _height = 170;
  double _weight = 70;
  Gender _gender = Gender.male;

  double _calculateBMI() {
    return _weight / pow(_height / 100, 2);
  }

  double _calculateBSA() {
    return sqrt(_height * _weight / 3600);
  }

  double _calculateWHR() {
    return _weight / _height;
  }

  double _calculateBMR() {
    return 655 + (9.6 * _weight) + (1.8 * _height) - (4.7 * _age);
  }

  double _calculateIBW() {
    return 50 + 2.3 * (_height / 2.54 - 60) + (_age > 40 ? -2 : 0);
  }

  double _calculateLBM() {
    return 0.407 * _weight + 0.267 * _height - 19.2;
  }

  double _calculateTBW() {
    return 2.447 - 0.09145 * _age + 0.1074 * _height + 0.3362 * _weight;
  }

  double _calculateBFP() {
    return 1.2 * _calculateBMI() + 0.23 * _age -
        10.8 * (1 - (_gender == Gender.male ? 1 : 0));
  }

  double _calculateWHtR() {
    return _weight / (_height / 100);
  }

  double _calculateRHR() {
    return (Random().nextInt(41) + 60).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Calculations'),
      ),
      body: ListView(
          children: [
      ListTile(
      leading: Icon(Icons.accessibility),
      title: Text('BMI'),
      trailing: Text(_calculateBMI().toStringAsFixed(1)),
    ),
    ListTile(
    leading: Icon(Icons.straighten),
    title: Text('BSA'),
    trailing: Text(_calculateBSA().toStringAsFixed(2)),
    ),
    ListTile(
    leading: Icon(Icons.aspect_ratio),
    title: Text('WHR'),
    trailing: Text(_calculateWHR().toStringAsFixed(2)),
    ),
    ListTile(
    leading: Icon(Icons.directions_run),
    title: Text('BMR'),
    trailing: Text(_calculateBMR().toStringAsFixed(0)),
    ),
    ListTile(
    leading: Icon(Icons.accessibility_new),
    title: Text('IBW'),
    trailing: Text(_calculateIBW().toStringAsFixed(1)),
    ),
    ListTile(
    leading: Icon(Icons.fitness_center),
    title: Text('LBM'),
    trailing: Text(_calculateLBM().toStringAsFixed(1)),
    ),
    ListTile(
    leading: Icon(Icons.opacity),
    title: Text('TBW'),
    trailing: Text(_calculateTBW().toStringAsFixed(1)),
    ),
    ListTile(
    leading: Icon(Icons.accessibility_sharp),
    title: Text('BFP'),
    trailing: Text(_calculateBFP().toStringAsFixed(1)),
    ),
            ListTile(
              leading: Icon(Icons.accessibility_sharp),
              title: Text('BFP'),
              trailing: Text(_calculateBFP().toStringAsFixed(1)),
            ),
            ListTile(
              leading: Icon(Icons.height),
              title: Text('WHtR'),
              trailing: Text(_calculateWHtR().toStringAsFixed(2)),
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('RHR'),
              trailing: Text(_calculateRHR().toString()),
            ),
          ],
      ),
    );
  }
}
