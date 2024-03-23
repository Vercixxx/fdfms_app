import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// Scheduler
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../scripts/get_shifts.dart';

// NavBar
import '../pages/menu.dart';

class Scheduler extends StatefulWidget {
  @override
  _SchedulerState createState() => _SchedulerState();
}

class _SchedulerState extends State<Scheduler> {
  List<DateTime>? _displayedDates;
  List<Map<String, dynamic>> _driverSchedules = [];

  late MeetingDataSource _events;

  @override
  void initState() {
    super.initState();
    _events = MeetingDataSource(_driverSchedules);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'Scheduler',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: SfCalendar(
          view: CalendarView.month,
          monthViewSettings: const MonthViewSettings(
            showAgenda: true,
            navigationDirection: MonthNavigationDirection.horizontal,
            dayFormat: 'EEE',
            agendaViewHeight: 350,
            agendaItemHeight: 70,
            monthCellStyle: MonthCellStyle(
              textStyle: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
          onViewChanged: (ViewChangedDetails details) {
            List<DateTime> _dates = details.visibleDates;
            _displayedDates = [_dates.first, _dates.last];

            fetchDriverShifts(_displayedDates!).then((value) {
              setState(() {
                _driverSchedules = value.cast<Map<String, dynamic>>();
                _events = MeetingDataSource(_driverSchedules);
              });
            });
          },
          dataSource: _events,
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Map<String, dynamic>> source) {
    appointments = source.map((item) {
      final DateTime start = DateTime.parse(item['time']['start']);
      final DateTime end = DateTime.parse(item['time']['end']);
      return Appointment(
        startTime: start,
        endTime: end,
        subject: item['restaurant_name'],
        color: Colors.teal.shade800, // replace with actual color mapping
      );
    }).toList();
  }
}
