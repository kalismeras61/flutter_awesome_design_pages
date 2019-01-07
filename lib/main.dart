import 'package:flutter/material.dart';
import 'package:testapp/home_page.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue,
          fontFamily: "Roboto",
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
        ),
      ),
    );
