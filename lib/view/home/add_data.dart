import 'package:flutter/material.dart';

class AddDataView extends StatefulWidget {
  const AddDataView({Key? key}) : super(key: key);

  @override
  State<AddDataView> createState() => _AddDataViewState();
}

class _AddDataViewState extends State<AddDataView> {
  late TextEditingController _numberController;
  late DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController();
    _selectedDateTime = DateTime.now();
  }

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 221, 173, 186),
        title: Text('Ăn uống'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: _selectedDateTime,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            _selectedDateTime = selectedDate;
                          });
                        }
                      });
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  Text(
                    'Ngày: ${_selectedDateTime.day}/${_selectedDateTime.month}/${_selectedDateTime.year}',
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
                      ).then((selectedTime) {
                        if (selectedTime != null) {
                          setState(() {
                            _selectedDateTime = DateTime(
                              _selectedDateTime.year,
                              _selectedDateTime.month,
                              _selectedDateTime.day,
                              selectedTime.hour,
                              selectedTime.minute,
                            );
                          });
                        }
                      });
                    },
                    icon: Icon(Icons.access_time),
                  ),
                  Text(
                    'Thời gian: ${_selectedDateTime.hour}:${_selectedDateTime.minute}',
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 150),
          Expanded(
            child: TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
