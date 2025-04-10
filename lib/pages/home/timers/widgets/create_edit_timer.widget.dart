import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateEditTimerWidget extends StatelessWidget {
  CreateEditTimerWidget({super.key});

  final TextEditingController totalRounds = TextEditingController();

  int _selectedFruit = 0;
  double _kItemExtent = 32.0;
  List<String> _fruitNames = <String>[
    'Apple',
    'Mango',
    'Banana',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: [
          Center(
            child: Text(
              'New',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),

          Divider(),

          SizedBox(height: 10),

          // Row(
          //   children: [
          //     Expanded(flex: 2, child: const Text('Number of rounds')),

          //     Expanded(
          //       flex: 1,
          //       child: TextField(
          //         controller: totalRounds,
          //         // autofocus: true,
          //         decoration: InputDecoration(
          //           contentPadding: EdgeInsets.all(5),
          //           border: OutlineInputBorder(),
          //           labelText: 'Number of rounds',
          //           hintText: 'Number of rounds',
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          /*
          TextField(
            // controller: totalRounds,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              border: OutlineInputBorder(),
              labelText: 'Number of rounds',
              hintText: 'Number of rounds',
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder:
                    (BuildContext context) => Container(
                      // height: 216,
                      padding: const EdgeInsets.only(top: 6.0),
                      // The Bottom margin is provided to align the popup above the system navigation bar.
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      // Provide a background color for the popup.
                      color: CupertinoColors.systemBackground.resolveFrom(
                        context,
                      ),
                      // Use a SafeArea widget to avoid system overlaps.
                      child: SafeArea(
                        // top: false,
                        child: CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          // This sets the initial item.
                          scrollController: FixedExtentScrollController(
                            initialItem: _selectedFruit,
                          ),
                          // This is called when selected item is changed.
                          onSelectedItemChanged: (int selectedItem) {
                            // setState(() {
                            //   _selectedFruit = selectedItem;
                            // });

                            // Navigator.pop(context);
                          },
                          children: List<Widget>.generate(_fruitNames.length, (
                            int index,
                          ) {
                            return Center(child: Text(_fruitNames[index]));
                          }),
                        ),
                      ),
                    ),
              );
            },
          ),
          */
          Row(
            children: [
              Expanded(child: const Text('Number Of Rounds')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('5')),
              ),
            ],
          ),

          SizedBox(height: 5),

          Row(
            children: [
              Expanded(child: const Text('Time To Get Ready')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('15s')),
              ),
            ],
          ),

          SizedBox(height: 5),

          Row(
            children: [
              Expanded(child: const Text('Round Time')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('03:00')),
              ),
            ],
          ),

          SizedBox(height: 5),

          Row(
            children: [
              Expanded(child: const Text('Round End Notice Time')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('10s')),
              ),
            ],
          ),

          SizedBox(height: 5),

          Row(
            children: [
              Expanded(child: const Text('Break Time')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('01:00')),
              ),
            ],
          ),

          SizedBox(height: 5),

          Row(
            children: [
              Expanded(child: const Text('Break End Notice Time')),

              SizedBox(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text('10s')),
              ),
            ],
          ),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.cancel_outlined,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    onPressed: () {
                      if (totalRounds.text.isNotEmpty) {
                        // metodoParaActualizarLaInfo();

                        totalRounds.text = '';
                      }
                    },
                    label: Text('Cancel'),
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton.icon(
                    icon: Icon(
                      Icons.save_outlined,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                    onPressed: () {
                      if (totalRounds.text.isNotEmpty) {
                        // metodoParaActualizarLaInfo();

                        totalRounds.text = '';
                      }
                    },
                    label: Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
