import 'package:flutter/material.dart';

// * DTOs
import 'package:flutter_boxing_timer/shared/services/timer/dtos/timer.dto.dart';

// * Widgets
import 'widgets/create_edit_timer.widget.dart';

class TimersTab extends StatefulWidget {
  const TimersTab({super.key});

  @override
  State<TimersTab> createState() => _TimersTabState();
}

class _TimersTabState extends State<TimersTab> {
  final List<TimerDto> timers = [defaultTimerDto];

  void openCreateEditTimer() {
    // showModalBottomSheet
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            // padding: EdgeInsets.only(
            //   bottom: MediaQuery.of(context).viewInsets.bottom,
            // ),
            child: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * (3 / 4),
              // child: SingleChildScrollView(
              //   child: CreateEditTimerWidget(),
              // ),
              child: CreateEditTimerWidget(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return timers.isEmpty
        ? Center(child: Text('There are no timers yet!'))
        : Stack(
          children: [
            ListView.builder(
              itemCount: timers.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),

                  // Especifica que solamente se va a poder deslizar de derecha a izquierda
                  direction: DismissDirection.endToStart,

                  // Background cuando se desliza de izquierda a derecha
                  background: Container(
                    color: Color(0XFFfc2e36),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),

                  onDismissed: (direction) {
                    setState(() {
                      timers.removeAt(index);
                    });

                    // metodoParaActualizarLaInfo();
                  },

                  child: ListTile(
                    leading: Icon(Icons.sports_mma),
                    title: Text(timers[index].name),
                    subtitle: Text(
                      '5 rounds of 03:00, rest 15s\nTotal Time: 19:15',
                    ),
                    // isThreeLine: true,
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outlined),
                      tooltip: 'Delete Timer',
                      onPressed: () {},
                    ),

                    onTap: () {
                      openCreateEditTimer();
                    },
                  ),
                );
              },
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Ink(
                  decoration: ShapeDecoration(
                    color:
                        Theme.of(
                          context,
                        ).floatingActionButtonTheme.backgroundColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Theme.of(context).colorScheme.tertiary,
                    onPressed: () {
                      openCreateEditTimer();
                    },
                  ),
                ),
              ),
            ),
          ],
        );
  }
}
