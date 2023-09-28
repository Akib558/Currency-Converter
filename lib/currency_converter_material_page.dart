import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
import 'dart:convert';
import 'dart:ui';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() =>
      _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage
    extends State<CurrencyConverterMaterialPage> {
  late Map<String, dynamic> currencyNames;
  Map<String, dynamic> currencyConversion = {};
  // late Future<Map<String, dynamic>> currencyConversion;
  late Future<Map<String, dynamic>> currencyList;
  late Future<Map<String, dynamic>> conversionList;

  Future<Map<String, dynamic>> getCurrencyNames() async {
    final res = await http.get(Uri.parse(
        'https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies.json'));
    final data = jsonDecode(res.body);
    return data;
  }

  Future<Map<String, dynamic>> getConverSionRates(
      String conversionCurrency) async {
    final res = await http.get(Uri.parse(
        "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/${conversionCurrency}.json"));
    final data = jsonDecode(res.body);

    return data;
  }

  List<String> currencyNamesList = [];
  List currencyActualNamesList = [];
  List currencyConversionList = [];

  void demoFunc() async {
    currencyNames = await getCurrencyNames();
    for (var key in currencyNames.keys) {
      currencyNamesList.add(key);
    }
    print(currencyNamesList);
  }

  void currencyNamesandConversion(String currencyName) async {
    // conversionList = cuurencyConver
    for (var key in currencyNames.keys) {
      currencyNamesList.add(key);
      currencyActualNamesList.add(currencyNames[key]);
    }
    currencyConversion = await getConverSionRates(currencyName);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currencyList = getCurrencyNames();
    demoFunc();
  }

  // Define variables to store input and dropdown values
  String inputValue = '';
  String dropdownValue1 = "00";
  String dropdownValue2 = '00';
  String res = "No Value";
  bool tt = false;

  @override
  Widget build(BuildContext context) {
    // currencyList = getCurrencyNames();
    // demoFunc();
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Currency Converter')),
        ),
        body: FutureBuilder(
            future: currencyList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 0, 0, 0),
                  strokeWidth: 10,
                ));
              }
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Input field
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          inputValue = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Amount',
                      ),
                    ),
                    SizedBox(height: 20.0),

                    // First Dropdown menu
                    // DropdownButton<String>(
                    //   value: dropdownValue1,
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownValue1 = newValue!;
                    //     });
                    //   },
                    //   items: currencyNamesList
                    //       .map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "From",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Stack(children: [
                              Card(
                                elevation: 5,
                                child: DropdownButton<String>(
                                  value: dropdownValue1,
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      setState(() {
                                        dropdownValue1 = newValue;
                                      });
                                    }
                                  },
                                  items: currencyNamesList.map((String item) {
                                    return DropdownMenuItem<String>(
                                      value: item,
                                      child: Container(
                                        // width: double.infinity,
                                        child: Container(
                                            width: 150,
                                            child: Center(
                                              child: Text(
                                                item,
                                              ),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ]),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "TO",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            // Second Dropdown menu
                            Stack(children: [
                              Card(
                                elevation: 5,
                                child: DropdownButton<String>(
                                  // style: TextStyle(),
                                  value: dropdownValue2,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownValue2 = newValue!;
                                    });
                                  },
                                  items: currencyNamesList
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                          width: 150,
                                          child: Center(
                                            child: Text(
                                              value,
                                            ),
                                          )),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ]),
                          ],
                        )
                      ],
                    ),
                    !tt
                        ? Text(
                            res,
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          )
                        : Text(
                            "$inputValue $dropdownValue1 = " +
                                res +
                                " $dropdownValue2",
                            style: TextStyle(
                              fontSize: 26,
                            ),
                          ),

                    // Button
                    ElevatedButton(
                      onPressed: () async {
                        // Handle button press here
                        // print('Input Value: $inputValue');
                        // print('Dropdown 1 Value: $dropdownValue1');
                        // print('Dropdown 2 Value: $dropdownValue2');
                        // conversionList = getConverSionRates(dropdownValue1);
                        // currencyNamesandConversion(dropdownValue1);
                        double val = double.parse(inputValue);

                        Future<Map<String, dynamic>> demoo =
                            getConverSionRates(dropdownValue1);

                        FutureBuilder(
                            future: demoo,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  strokeWidth: 10,
                                ));
                              }
                              return Container();
                            });
                        Map<String, dynamic> demo = await demoo;
                        print(demo);
                        res = (((val * demo[dropdownValue1][dropdownValue2]
                                            as double) *
                                        100)
                                    .toInt() /
                                100)
                            .toString();
                        tt = true;
                        setState(() {});
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              );
            }));
  }
}
