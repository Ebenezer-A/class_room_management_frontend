import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
            color: Color(0xFF6B4EFF), // Course text color
          ),
          subtitle1: TextStyle(
            fontSize: 16,
            fontFamily: 'Montserrat',
            color: Color(0xFF6B4EFF), // Dropdown label color
          ),
          button: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
          ),
        ),
      ),
      home: CourseDetail(),
    );
  }
}

class CourseDetail extends StatefulWidget {
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  String? _selectedCategory;
  String? _selectedDeliveryYear;
  String? _selectedDeliverySemester;

  bool _isDropdownValid() {
    return _selectedCategory != null &&
        _selectedDeliveryYear != null &&
        _selectedDeliverySemester != null;
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white, // Entire body background color
    body: Center(
      child: Card(
        color: Colors.white, // Wrap the entire body with a Card
        elevation: 5, // Add elevation for shadow effect
        margin: EdgeInsets.all(20), // Adjust margin as needed
        child: Padding(
          padding: const EdgeInsets.all(20.0), // Add padding inside the card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Course', // Text to be displayed
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Color(0xFF6B4EFF), // Set text color here
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                 
                ],
              ),
              SizedBox(height: 20.0),
              buildDropdown(
                label: 'Category',
                hint: 'Select Category',
                items: [
                  'Category 1',
                  'Category 2',
                  'Category 3',
                  'Category 4',
                  'Category 5'
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCategory = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              buildDropdown(
                label: 'Delivery Year',
                hint: 'Select Delivery Year',
                items: [
                  '1st year',
                  '2nd year',
                  '3rd year',
                  '4th year',
                  '5th year'
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDeliveryYear = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              buildDropdown(
                label: 'Delivery Semester',
                hint: 'Select Delivery Semester',
                items: ['1st semester', '2nd semester'],
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedDeliverySemester = newValue;
                  });
                },
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement Course Detail functionality
                    },
                    child: Text('Save'),
                  ),
                   ElevatedButton(
                    onPressed: _isDropdownValid()
                        ? () {
                            _showCourseInputDialog(context);
                          }
                        : null,
                    child: Text('Course Detail'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement cancel functionality
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}


  Widget buildDropdown(
      {required String label,
      required String hint,
      required List<String> items,
      required ValueChanged<String?> onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 20.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Color(0xFF6B4EFF), // Label text color
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600, // Label font family
                ),
          ),
        ),
        SizedBox(height: 8.0),
        Container(
          width: double.infinity,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Color(0xFF6B4EFF)), // Border color
            ),
            color: Colors.transparent, // Dropdown item background color
          ),
          child: DropdownButton<String>(
            style: TextStyle(
              color: Colors.black, // Dropdown items color
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600, // Dropdown items font family
            ),
            isExpanded: true,
            underline: Container(), // Remove the underline
            icon: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_drop_down), // Dropdown icon
            ),
            hint: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  hint,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0), // Hint color
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0.06,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            value: label == 'Category'
                ? _selectedCategory
                : label == 'Delivery Year'
                    ? _selectedDeliveryYear
                    : _selectedDeliverySemester,
            onChanged: onChanged,
            items: items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Container(
                  color: Colors.transparent, // Dropdown item background color
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: Colors.black, // Dropdown items color
                          fontFamily: 'Montserrat', // Dropdown items font family
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Future<void> _showCourseInputDialog(BuildContext context) async {
    String? courseCode;
    String? courseTitle;
    String? creditHour;
    String? lectureHour;
    String? labHour;
    String? tutorialHour;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter Course Details',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Color(0xFF6B4EFF), // Label text color
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  fontSize: 18, // Label font family
                ),
          ),
          content: SingleChildScrollView(
            child: Column(
              children: [
                _buildInputField(
                    label: 'Course code',
                    hint: 'Enter course code',
                    onChanged: (value) => courseCode = value),
                _buildInputField(
                    label: 'Course title',
                    hint: 'Enter course title',
                    onChanged: (value) => courseTitle = value),
                _buildInputField(
                    label: 'Credit Hour',
                    hint: 'Enter credit hour',
                    onChanged: (value) => creditHour = value),
                _buildInputField(
                    label: 'Lecture Hour',
                    hint: 'Enter lecture hour',
                    onChanged: (value) => lectureHour = value),
                _buildInputField(
                    label: 'Lab Hour',
                    hint: 'Enter lab hour',
                    onChanged: (value) => labHour = value),
                _buildInputField(
                    label: 'Tutorial Hour',
                    hint: 'Enter tutorial hour',
                    onChanged: (value) => tutorialHour = value),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Color(0xFF6B4EFF), // Label text color
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600, // Label font family
                ),
                
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (courseCode != null &&
                    courseTitle != null &&
                    creditHour != null &&
                    lectureHour != null &&
                    labHour != null &&
                    tutorialHour != null) {
                  // Implement save functionality
                  // Close the dialog
                  Navigator.of(context).pop();
                }
              },
              child: Text(
                'Save',
                 style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Color(0xFF6B4EFF), // Label text color
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600, // Label font family
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildInputField(
      {required String label,
      required String hint,
      required ValueChanged<String?> onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(),
          hintStyle: Theme.of(context).textTheme.subtitle1,
        ),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
