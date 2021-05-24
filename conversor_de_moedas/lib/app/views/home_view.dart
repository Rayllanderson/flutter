import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            children: [
              Image.asset('assets/images/logo.png', width: 150, height: 150),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 56,
                        child: DropdownButton(
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
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                  onPressed: () {},
                  child:
                      Text('CONVERTER', style: TextStyle(color: Colors.black)))
            ],
          ),
        ),
      ),
    );
  }
}
