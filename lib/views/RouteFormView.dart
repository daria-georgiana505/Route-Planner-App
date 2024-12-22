
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_non_native/views/AppBarLayoutWidget.dart';

class RouteFormView extends StatefulWidget {
  String startLocation;
  String endLocation;
  DateTime startDateTime;
  double distanceKm;
  bool notificationsEnabled;
  void Function(String, String, DateTime, double, bool) onSubmit;

  RouteFormView({
    super.key,
    required this.startLocation,
    required this.endLocation,
    required this.startDateTime,
    required this.distanceKm,
    required this.notificationsEnabled,
    required this.onSubmit
  });

  @override
  State<RouteFormView> createState() => _RouteFormViewState();
}

class _RouteFormViewState extends State<RouteFormView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(widget.startLocation, widget.endLocation, widget.startDateTime, widget.distanceKm, widget.notificationsEnabled);
      // Navigator.pop(context);
    }
  }

  String? _validateStringInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {

    return AppBarLayoutWidget(
      title: 'Route Planner',
      body: Material(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Start Location',
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      filled: true,
                      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialValue: widget.startLocation,
                    validator: (value) {
                      return _validateStringInput(value);
                    },
                    onSaved: (value) {
                      if (value != null && value.isNotEmpty) {
                        widget.startLocation = value;
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'End Location',
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      filled: true,
                      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialValue: widget.endLocation,
                    validator: (value) {
                      return _validateStringInput(value);
                    },
                    onSaved: (value) {
                      if (value != null && value.isNotEmpty) {
                        widget.endLocation = value;
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    initialValue: widget.startDateTime.toString(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event, color: Theme.of(context).primaryColor),
                    dateLabelText: 'Date',
                    timeLabelText: 'Time',
                    decoration: InputDecoration(
                      labelText: 'Start Date & Time',
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      filled: true,
                      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date and time';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value != null && value.isNotEmpty) {
                        widget.startDateTime = DateTime.parse(value);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    decoration: InputDecoration(
                      labelText: 'Distance (Km)',
                      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      filled: true,
                      fillColor: Theme.of(context).inputDecorationTheme.fillColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    initialValue: widget.distanceKm.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please input a distance';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      if (value != null && value.isNotEmpty) {
                        widget.distanceKm = double.parse(value);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  CheckboxListTile(
                    title: Text(
                      'Enable Notifications',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    value: widget.notificationsEnabled,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.notificationsEnabled = value ?? false;
                      });
                    },
                    activeColor: Theme.of(context).primaryColor,
                    checkColor: Theme.of(context).scaffoldBackgroundColor,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
