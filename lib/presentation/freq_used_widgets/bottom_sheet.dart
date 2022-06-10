import 'package:testing_project/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowBottomSheet extends StatefulWidget {
  const ShowBottomSheet({Key? key}) : super(key: key);

  @override

  State<ShowBottomSheet> createState() => _ShowBottomSheetState();
}

class _ShowBottomSheetState extends State<ShowBottomSheet> {

  @override

  Widget build(BuildContext context) {

    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.amber,

                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,

                    children: <Widget>[

                     // const Text('this is a BottomSheet'),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.grey,
                          primary: primaryColor,
                          shape: const StadiumBorder(),
                        ),
                        child: const Text(
                            'save',
                          style: TextStyle(
                            color: primaryColor,

                          ),

                        ),
                        onPressed: () => Navigator.pop(context),
                       // onFocusChange: ,
                      )

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}