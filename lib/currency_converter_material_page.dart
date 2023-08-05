import 'package:flutter/material.dart';

class CurrencyConverterMaterialPage extends StatefulWidget {
  const CurrencyConverterMaterialPage({super.key});
  @override
  State<CurrencyConverterMaterialPage> createState() => _CurrencyConverterMaterialPage();
}

class _CurrencyConverterMaterialPage extends State<CurrencyConverterMaterialPage>{

  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert(){
    setState(() {
      result = double.parse(textEditingController.text)*101;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2.0,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignInside,
      ),
      // borderRadius: BorderRadius.all(Radius.circular(80)),
      borderRadius: BorderRadius.circular(100),
    );
    return Scaffold(
        backgroundColor: Colors.blueGrey,

        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0,
          title: const Text("Currentcy Converter"),
          centerTitle: false,
        ),


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Text(
                'BDT ${result != 0 ? result.toStringAsFixed(2) : 0}',
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20,),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  decoration: InputDecoration(
                    hintText: "Please enter any amount in BDT: ",
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(155, 173, 157, 157)),
                    prefixIcon: const Icon(
                      Icons.monetization_on_outlined,
                    ),
                    prefixIconColor: const Color.fromARGB(155, 173, 157, 157),
                    filled: true,
                    fillColor: Colors.white,
                    // focusedBorder: InputBorder.none,
                    focusedBorder: border,
                    enabledBorder: border,
                  ),
                  // keyboardType: TextInputType.number,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20,),
                child: ElevatedButton(onPressed: () {
                  convert;
                  // if(kDebugMode){
                    // print('button is clicked');
                  // }
                },
                // style: ButtonStyle(
                //   elevation: const MaterialStatePropertyAll(15),
                //   backgroundColor: const MaterialStatePropertyAll(Colors.black),
                //   foregroundColor: const MaterialStatePropertyAll(Colors.white),
                //   // textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.white)),
                //   minimumSize: const MaterialStatePropertyAll(Size(double.infinity, 50),),
                //   shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(20),
                //   )),
              
                // ), 
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),

                ),
                // child: const Text("Convert"),
                child: const Icon(Icons.money),
                ),
              ),
            ],
          ),
        ));

  }

}

