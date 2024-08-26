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

import 'dart:math';

import 'package:graphx/graphx.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'midi_model.dart';
import 'ui/selection_overlay/model.dart';

part 'midi_editor_view_model.g.dart';

class MIDIEditorViewModel extends _MIDIEditorViewModel
    with _$MIDIEditorViewModel {
  MIDIEditorViewModel({MIDIClipModel? midiClipModel}) {
    this.midiClipModel = midiClipModel ?? MIDIClipModel();
  }

  Map<String, dynamic> toJson() => _$MIDIEditorViewModelToJson(this);
}

@JsonSerializable(createFactory: false)
abstract class _MIDIEditorViewModel with Store {
  @observable
  MIDIClipModel midiClipModel = MIDIClipModel();

  @observable
  SelectionOverlayViewModel selectionOverlayViewModel =
      SelectionOverlayViewModel();

  @observable
  double representedBars = 4.0;

  @observable
  double noteHeight = 20.0;

  @observable
  int? lastTapTime;

  @action
  void setLastTapTime(int time) {
    lastTapTime = time;
  }

  @action
  void clearLastTapTime() {
    lastTapTime = null;
  }

  @action
  void resizeNotesByDelta(double delta) {
    var smallerDelta = delta * 0.1;
    noteHeight = Math.min(30, Math.max(noteHeight + smallerDelta, 5));
  }

  @action
  void onNoteTimeDelta(MIDINoteModel noteModel, double dx) {
    var barsShown = 4;
    var grid = 8;
    var step = 1 / (barsShown * grid);

    var newTime = noteModel.time + dx;

    // snap to grid
    var gridTime = (newTime / step).floorToDouble() * step;
    if ((newTime - gridTime).abs() < step / 20) {
      newTime = gridTime;
    }

    noteModel.setTime(newTime);
  }

  @action
  void onPanEnd(
      {required double viewportWidth,
      required Map<String, double> rowPositions}) {
    var boundingBox = selectionOverlayViewModel.boundingBox;
    selectionOverlayViewModel.onPanCancel();

    if (boundingBox != null) {
      midiClipModel.selectedNotes.clear(); // TODO handle shift-click

      var fixedBox = Rectangle(boundingBox.left - 110, boundingBox.top,
          boundingBox.width, boundingBox.height);

      // TODO - Don't iterate over all MIDI notes as this list can be massive
      for (var note in midiClipModel.midiNotes) {
        var noteX = note.time * viewportWidth;
        var noteWidth = note.duration * viewportWidth;
        var noteY = rowPositions[note.note.getSymbol()]!;
        var noteRectangle = Rectangle(noteX, noteY, noteWidth, noteHeight);

        if (fixedBox.intersects(noteRectangle)) {
          midiClipModel.selectedNotes.add(note);
        }
      }

      clearLastTapTime();
    }
  }
}
