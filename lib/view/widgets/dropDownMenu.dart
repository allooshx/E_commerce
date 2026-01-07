
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dropdownmenu extends StatefulWidget {
  const Dropdownmenu({super.key, required this.onChanged, required this.items, required this.hint});

  final void Function(String? value) onChanged;
  final List<String> items;

  final String hint;

  @override
  State<Dropdownmenu> createState() => _DropdownmenuState();
}
String Gordita = "Gordita";

class _DropdownmenuState extends State<Dropdownmenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      elevation: 16,


      isExpanded: true,
      borderRadius: BorderRadius.circular(10),
      icon: Icon(CupertinoIcons.chevron_down),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
      hint: Text(widget.hint),
      iconSize: 20,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Gordita",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      items: widget.items.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(value: value, child: Text(value));
      }).toList(),
      onChanged: widget.onChanged,
    );
    //   DropdownButton<String>(
    //   // menuWidth: double.infinity,
    //
    //   iconSize: 20,
    //   padding: EdgeInsets.symmetric(horizontal: 10),
    //   borderRadius: BorderRadius.circular(10),
    //   value: null,
    //   hint: Text("Size"),
    //   icon: Padding(
    //     padding: const EdgeInsets.only(left: 60.0),
    //     child: Icon(CupertinoIcons.chevron_down),
    //   ),
    //
    //   style: TextStyle(
    //     color: Colors.black,
    //     fontFamily: "Gordita",
    //     fontSize: 16,
    //   ),
    //   underline: Container(color: Colors.transparent),
    //   onChanged: (String? newValue) {
    //     setState(() {
    //       dropDownValue = newValue!;
    //     });
    //   },
    //
    //   items: <String>["S", "M", "L", "XL", "XXL"]
    //       .map<DropdownMenuItem<String>>((String value) {
    //         return DropdownMenuItem<String>(value: value, child: Text(value));
    //       })
    //       .toList(),
    // );
  }
}
