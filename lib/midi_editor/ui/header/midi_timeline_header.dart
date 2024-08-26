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

class MIDITimelineHeader extends StatelessWidget {
  const MIDITimelineHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bars = [0, 1, 2, 3];
    var barViews =
        bars.map((i) => Expanded(child: BarHeaderView(index: i))).toList();

    return SizedBox(
      width: double.infinity,
      child: Row(children: [
        const SizedBox(height: 20, width: 110),
        Expanded(
          child: Row(mainAxisSize: MainAxisSize.max, children: barViews),
        ),
      ]),
    );
  }
}

class BarHeaderView extends StatelessWidget {
  final int index;

  const BarHeaderView({
    Key? key,
    required this.index,
  }) : super(key: key);

  String get name => "${index + 1}.";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: index % 2 == 0
              ? const Color.fromRGBO(100, 100, 100, 1)
              : const Color.fromRGBO(70, 70, 70, 1)),
      child: Text(name),
    );
  }
}
