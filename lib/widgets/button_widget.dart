


import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{

  final String text;
  final VoidCallback onClicked;


  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
       style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        fixedSize: const Size(140, 50),
                        backgroundColor: Theme.of(context).colorScheme.surface,
                      ),
       child: Text(
        text,
        style: const TextStyle(
          fontSize:20 ,
          color: Colors.white
          ),
       )
       );
   
  }
}