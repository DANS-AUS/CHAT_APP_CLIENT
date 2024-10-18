import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class Message extends StatelessWidget {
  const Message({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode inputNode = FocusNode();
// to open keyboard call this function;
void openKeyboard(){
FocusScope.of(context).requestFocus(inputNode);
}

    return Material(
      type: MaterialType.transparency,
      child: 
         SafeArea(
          child: Column(
            children: [
              SizedBox(
                  height: 100,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios)),
                  )),
              const Column(
                children: [
                  BubbleSpecialThree(
                    text: 'Added iMessage shape bubbles',
                    color: Colors.teal,
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: 'Please try and give some feedback on it!',
                    color: Colors.teal,
                    tail: true,
                    textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  BubbleSpecialThree(
                    text: 'Sure',
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    isSender: false,
                  ),
                  BubbleSpecialThree(
                    text: "I tried. It's awesome!!!",
                    color: Color(0xFFE8E8EE),
                    tail: false,
                    isSender: false,
                  ),
                  BubbleSpecialThree(
                    text: "Thanks",
                    color: Color(0xFFE8E8EE),
                    tail: true,
                    isSender: false,
                  )
                ],
              ),
           TextField(
                  onTap: () => openKeyboard(),
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                    hintText: 'Enter a search term',
                  ),
                ),
            ],
          ),
      ),
    );
  }
}
