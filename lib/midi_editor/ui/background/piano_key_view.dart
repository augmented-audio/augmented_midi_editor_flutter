//    Copyright 2024 Pedro Tacla Yamada
//
//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at
//
//        http://www.apache.org/licenses/LICENSE-2.0
//
//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

import 'package:flutter/material.dart';

class PianoKeyView extends StatelessWidget {
  final double height;
  final bool isSharp;

  const PianoKeyView({Key? key, required this.isSharp, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 8),
        width: 50,
        height: height,
        decoration: BoxDecoration(
          color: isSharp ? Colors.black : Colors.white,
        ),
        child: null);
  }
}
