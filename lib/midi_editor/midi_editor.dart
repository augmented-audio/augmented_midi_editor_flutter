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

import 'midi_editor_view_model.dart';
import 'ui/background/midi_timeline_background.dart';
import 'ui/editor_content.dart';
import 'ui/header/midi_timeline_header.dart';

class MIDIEditorView extends StatelessWidget {
  final MIDIEditorViewModel model;

  const MIDIEditorView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(context)
          .style
          .merge(const TextStyle(color: Colors.black)),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(120, 120, 120, 1)),
        child: Column(
          children: [
            const MIDITimelineHeader(),
            Expanded(
              child: Stack(
                children: [
                  const RepaintBoundary(child: MIDITimelineBackground()),
                  SingleChildScrollView(
                    controller: ScrollController(),
                    child: MIDIEditorContentView(
                        viewModel: model, model: model.midiClipModel),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
