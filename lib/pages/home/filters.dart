import 'package:flutter/material.dart';

import 'package:langx_flutter/assets/svg/battery_svg.dart';
import 'package:langx_flutter/assets/svg/word_svg.dart';
import 'package:langx_flutter/assets/svg/country_svg.dart';
import 'package:langx_flutter/assets/svg/sex_svg.dart';
import 'package:langx_flutter/assets/svg/switch_svg.dart';

class FiltersPage extends StatefulWidget {
  const FiltersPage({super.key});

  @override
  FiltersPageState createState() => FiltersPageState();
}

typedef BoolCallback = void Function(bool? value);

class FiltersPageState extends State<FiltersPage> {
  bool matchMyGender = false;
  bool _motherEnglish = false;
  bool _motherChinese = false;
  bool _studyEnglish = false;
  bool _studyChinese = false;

  RangeValues rangeValues = const RangeValues(18, 60);
  String rangeLable = 'No Filter';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Filters'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          _buildFilterSection(
            title: 'Mother Language',
            options: [
              _buildOptionRow(
                  'English',
                  const BatterySvg(widht: 25, height: 25),
                  _motherEnglish, (bool? value) {
                setState(() {
                  _motherEnglish = value ?? false;
                });
              }),
              _buildOptionRow(
                  'Chinese (Simplified)',
                  const WordSvg(widht: 25, height: 25),
                  _motherChinese, (bool? value) {
                setState(() {
                  _motherChinese = value ?? false;
                });
              }),
            ],
          ),
          _buildFilterSection(
            title: 'Study Language',
            options: [
              _buildOptionRow(
                  'English',
                  const BatterySvg(widht: 25, height: 25),
                  _studyEnglish, (bool? value) {
                setState(() {
                  _studyEnglish = value ?? false;
                });
              }),
              _buildOptionRow(
                  'Chinese (Simplified)',
                  const WordSvg(widht: 25, height: 25),
                  _studyChinese, (bool? value) {
                setState(() {
                  _studyChinese = value ?? false;
                });
              }),
            ],
          ),
          _buildFilterSection(
            title: 'Country',
            options: [
              _buildOptionRow2(
                  'No Filter', const CountrySvg(widht: 25, height: 25)),
            ],
          ),
          _buildFilterSection(
            title: 'Gender',
            options: [
              _buildOptionRow2(
                  'No Filter', const SexSvg(widht: 25, height: 25)),
              _buildOptionRow2(
                  'Match My Gender', const SwitchSvg(widht: 25, height: 25)),
            ],
          ),
          _buildFilterSection(
            title: 'Age',
            options: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                ),
                child: ListTile(
                  leading:
                      Icon(Icons.calendar_today, color: Colors.yellow[700]),
                  title: Text(rangeLable),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: RangeSlider(
                  activeColor: Colors.yellow[700],
                  values: rangeValues,
                  min: 0,
                  max: 100,
                  divisions: 100,
                  labels: RangeLabels(
                    rangeValues.start.round().toString(),
                    rangeValues.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      rangeValues = values;

                      rangeLable =
                          "between ${rangeValues.start.round().toString()} and ${rangeValues.end.round().toString()} ";
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {},
              child: const Text(
                'APPLY',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection({
    required String title,
    required List<Widget> options,
    bool hasArrow = false,
  }) {
    return Card(
      elevation: 8.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(title),
              trailing: hasArrow ? const Icon(Icons.arrow_forward_ios) : null,
            ),
            Column(children: options),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionRow(String text, StatelessWidget icon, bool selection,
      BoolCallback onChange) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(text),
        trailing: Checkbox(
            activeColor: Colors.yellow[700],
            checkColor: Colors.black,
            value: selection,
            onChanged: onChange),
      ),
    );
  }

  Widget _buildOptionRow2(String text, StatelessWidget icon) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: icon,
        title: Text(text),
        trailing: IconButton(
          iconSize: 30,
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            debugPrint("Print");
          },
          color: Colors.grey,
        ),
      ),
    );
  }
}
