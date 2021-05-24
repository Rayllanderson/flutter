import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  const CurrencyBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return               Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            height: 56,
            child: DropdownButton(
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              isExpanded: true,
              items: [
                DropdownMenuItem(child: Text('Real')),
                DropdownMenuItem(child: Text('Dólar'))
              ],
              onChanged: (value) {},
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)
                )
            ),
          ),
        ),
      ],
    );
  }
}
