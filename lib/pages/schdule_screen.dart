import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SchduleScreen extends StatefulWidget {
  const SchduleScreen({super.key});

  @override
  State<SchduleScreen> createState() => _SchduleScreenState();
}

class _SchduleScreenState extends State<SchduleScreen> {
  // Variables to hold selected day and focused day
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  // Example events (you can load events from an API or local source)
  final Map<DateTime, List<String>> _events = {
    DateTime.utc(2024, 10, 15): ['Meeting at 10 AM', 'Lunch with CEO'],
    DateTime.utc(2024, 10, 16): ['Project deadline', 'Client call'],
    DateTime.utc(2024, 10, 17): ['Conference', 'Team outing'],
  };

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // Calendar view
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            eventLoader: _getEventsForDay,
            calendarStyle: CalendarStyle(
              // Customize the calendar styling
              todayDecoration: BoxDecoration(
                color: Colors.deepPurple,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              titleTextStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          // Display events for the selected day
          Expanded(
            child: _selectedDay != null && _getEventsForDay(_selectedDay!).isNotEmpty
                ? ListView.builder(
              itemCount: _getEventsForDay(_selectedDay!).length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.event),
                  title: Text(_getEventsForDay(_selectedDay!)[index]),
                );
              },
            )
                : Center(
              child: Text(
                'No events on this day!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
