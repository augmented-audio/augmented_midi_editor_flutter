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

import '../../midi_editor_view_model.dart';
import '../../midi_model.dart';
import 'piano_key_view.dart';

class MIDINoteLane extends StatelessWidget {
  final double height;
  final Note note;
  final MIDIClipModel model;
  final MIDIEditorViewModel viewModel;

  final GestureDragStartCallback? onPanStart;
  final GestureDragCancelCallback? onPanCancel;
  final GestureDragEndCallback? onPanEnd;
  final GestureDragUpdateCallback? onPanUpdate;

  const MIDINoteLane(
      {Key? key,
      required this.height,
      required this.note,
      required this.viewModel,
      required this.model,
      this.onPanStart,
      this.onPanCancel,
      this.onPanEnd,
      this.onPanUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(80, 80, 80, 1.0)),
        ),
      ),
      width: double.infinity,
      child: Row(children: [
        buildSidebarRegion(context),
        buildEmptyContentRegion(context)
      ]),
    );
  }

  MouseRegion buildSidebarRegion(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.resizeUpDown,
      child: GestureDetector(
        onPanUpdate: onSidebarPanUpdate,
        child: Row(children: [
          SizedBox(
              width: 50,
              child: Text(note.getSymbol(),
                  style: DefaultTextStyle.of(context)
                      .style
                      .merge(TextStyle(fontSize: height / 1.5)))),
          PianoKeyView(isSharp: note.isSharp(), height: height),
        ]),
      ),
    );
  }

  Expanded buildEmptyContentRegion(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTapUp: (details) => onTapUpInner(context, details),
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanCancel: onPanCancel,
        onPanEnd: onPanEnd,
        child: Container(
          width: double.infinity,
          height: height,
          decoration: const BoxDecoration(
            // Without painting, there's no gesture detection above
            color: Colors.transparent,
          ),
          child: null,
        ),
      ),
    );
  }

  void onTapUpInner(BuildContext context, TapUpDetails details) {
    var now = DateTime.now().millisecond;

    model.unselectNotes();

    if (viewModel.lastTapTime != null && now - viewModel.lastTapTime! < 500) {
      var width = context.size!.width - 110;
      var x = details.localPosition.dx / width;
      model.addEvent(time: x, note: note);
      viewModel.clearLastTapTime();
    } else {
      viewModel.setLastTapTime(now);
    }
  }

  void onSidebarPanUpdate(DragUpdateDetails details) {
    var delta = details.delta.dy;
    viewModel.resizeNotesByDelta(delta);
  }
}
