import 'package:flutter/material.dart';
import 'package:nour_app/generated/l10n.dart';
import 'package:nour_app/widgets/localization_icon.dart';

class HopeBox extends StatefulWidget {
  const HopeBox({Key? key}) : super(key: key);

  @override
  State<HopeBox> createState() => _HopeBoxState();
}

class _HopeBoxState extends State<HopeBox> {
  final String _selecteditem ='Upload Images';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LocalizationIcon(),
      body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                  ],
                   begin: Alignment.bottomLeft,
                 end: Alignment.topRight,
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  Container(
                  child: Text(S.of(context).hope_box)),
              )
      ),  
    );
    
  }
}
