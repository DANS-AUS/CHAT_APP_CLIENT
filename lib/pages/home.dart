// Home page view.
import 'package:chat/components/switch.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SwitchModel extends ValueNotifier<bool> {
  SwitchModel() : super(true);

  List<Map<String, dynamic>> data = [];

  void onSwitchChange() {
    value = !value;
    notifyListeners();
  }

  void updateFilteredData() {
    data = value
        ? Home.fakeData.where((chat) => chat["receivers"].length < 2).toList()
        : Home.fakeData.where((chat) => chat["receivers"].length > 1).toList();
    notifyListeners();
  }
}

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key});

  static const List<Map<String, dynamic>> fakeData = [
    {
      'sender': 'Chravis Austin',
      'receivers': ["John"],
      'content': 'Hey what are you up to today??',
      'time': '2024-10-07 12:34:56'
    },
    {
      'sender': 'Jeoux Hamilton',
      'receivers': ["John"],
      'content': 'Are we working on that project tomorrow',
      'time': '2024-10-06 12:34:56'
    },
    {
      'sender': 'Alice Hart',
      'receivers': ["John"],
      'content': 'Hey there!',
      'time': '2023-11-23 12:34:56'
    },
    {
      'sender': 'Bob Smith',
      'receivers': ["Geese", "Panda", "Deer", "John"],
      'content': 'How are you doing today?',
      'time': '2023-12-01 15:20:30'
    },
    {
      'sender': 'Charlie David',
      'receivers': ["Geese", "Panda", "Deer", "John"],
      'content': 'See you later!',
      'time': '2023-12-10 18:15:00'
    },
    {
      'sender': 'David Doe',
      'receivers': ["Geese", "Panda", "Deer", "John"],
      'content': 'What\'s up?',
      'time': '2023-12-15 11:05:45'
    },
    {
      'sender': 'Emily Johnson',
      'receivers': ["John"],
      'content': 'I\'m good thanks!',
      'time': '2023-12-20 14:30:20'
    },
    {
      'sender': 'Frank Sinatra',
      'receivers': ["John"],
      'content': 'Let\'s meet up soon.',
      'time': '2023-12-25 17:10:10'
    },
    {
      'sender': 'Grace Kim',
      'receivers': ["John"],
      'content': 'Sounds great!',
      'time': '2024-01-01 10:00:00'
    },
    {
      'sender': 'Henry King',
      'receivers': ["John"],
      'content': 'I\'ll be there.',
      'time': '2024-01-05 13:55:55'
    },
    {
      'sender': 'Ivy Knowles',
      'receivers': ["John"],
      'content': 'Can\'t wait!',
      'time': '2024-01-10 16:40:40'
    },
    {
      'sender': 'Jack Beans',
      'receivers': ["John"],
      'content': 'See you soon.',
      'time': '2024-01-15 19:25:35'
    },
  ];

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SwitchModel switchModel = SwitchModel();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: switchModel,
        builder: (context, isChecked, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.group_add_outlined),
                    SizedBox(
                      height: 40,
                      width: 300,
                      child: SearchBar(
                        leading: Icon(Icons.search),
                      ),
                    ),
                    Icon(Icons.notifications_none_sharp)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SwitchWidget(
                      titleOne: 'DIRECT',
                      titleTwo: 'GROUP',
                      switchModel: switchModel),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  child: ListView.builder(
                    itemCount: switchModel.data.length,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        data: switchModel.data[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class ChatWidget extends StatelessWidget {
  final dynamic data;
  const ChatWidget({super.key, required this.data});

  String genSenderInitials() {
    final arr = data['sender'].split(' ');
    return '${arr[0][0].toUpperCase()}${arr[1][0].toUpperCase()}';
  }

  String getDate(String date) {
    var now = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var compareDate = DateFormat('yyyy-MM-dd').format(DateTime.parse(date));
    // If it was sent today
    if (now == compareDate) {
      return DateFormat('HH:mm a').format(DateTime.parse(date));
      // If it was sent yesterday
    } else if (DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 1))) ==
        compareDate) {
      return 'Yesterday';
    } else {
      return DateFormat('MM/dd/yyyy').format(DateTime.parse(date));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black26,
            child: Text(genSenderInitials()),
          ),
          Flexible(
            flex: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(data['sender']), Text(data['content'])],
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                getDate(data["time"]),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
