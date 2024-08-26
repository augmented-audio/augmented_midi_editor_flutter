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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'midi_editor_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MIDIEditorViewModelToJson(
        _MIDIEditorViewModel instance) =>
    <String, dynamic>{
      'midiClipModel': instance.midiClipModel,
      'selectionOverlayViewModel': instance.selectionOverlayViewModel,
      'representedBars': instance.representedBars,
      'noteHeight': instance.noteHeight,
      'lastTapTime': instance.lastTapTime,
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MIDIEditorViewModel on _MIDIEditorViewModel, Store {
  final _$midiClipModelAtom = Atom(name: '_MIDIEditorViewModel.midiClipModel');

  @override
  MIDIClipModel get midiClipModel {
    _$midiClipModelAtom.reportRead();
    return super.midiClipModel;
  }

  @override
  set midiClipModel(MIDIClipModel value) {
    _$midiClipModelAtom.reportWrite(value, super.midiClipModel, () {
      super.midiClipModel = value;
    });
  }

  final _$selectionOverlayViewModelAtom =
      Atom(name: '_MIDIEditorViewModel.selectionOverlayViewModel');

  @override
  SelectionOverlayViewModel get selectionOverlayViewModel {
    _$selectionOverlayViewModelAtom.reportRead();
    return super.selectionOverlayViewModel;
  }

  @override
  set selectionOverlayViewModel(SelectionOverlayViewModel value) {
    _$selectionOverlayViewModelAtom
        .reportWrite(value, super.selectionOverlayViewModel, () {
      super.selectionOverlayViewModel = value;
    });
  }

  final _$representedBarsAtom =
      Atom(name: '_MIDIEditorViewModel.representedBars');

  @override
  double get representedBars {
    _$representedBarsAtom.reportRead();
    return super.representedBars;
  }

  @override
  set representedBars(double value) {
    _$representedBarsAtom.reportWrite(value, super.representedBars, () {
      super.representedBars = value;
    });
  }

  final _$noteHeightAtom = Atom(name: '_MIDIEditorViewModel.noteHeight');

  @override
  double get noteHeight {
    _$noteHeightAtom.reportRead();
    return super.noteHeight;
  }

  @override
  set noteHeight(double value) {
    _$noteHeightAtom.reportWrite(value, super.noteHeight, () {
      super.noteHeight = value;
    });
  }

  final _$lastTapTimeAtom = Atom(name: '_MIDIEditorViewModel.lastTapTime');

  @override
  int? get lastTapTime {
    _$lastTapTimeAtom.reportRead();
    return super.lastTapTime;
  }

  @override
  set lastTapTime(int? value) {
    _$lastTapTimeAtom.reportWrite(value, super.lastTapTime, () {
      super.lastTapTime = value;
    });
  }

  final _$_MIDIEditorViewModelActionController =
      ActionController(name: '_MIDIEditorViewModel');

  @override
  void setLastTapTime(int time) {
    final _$actionInfo = _$_MIDIEditorViewModelActionController.startAction(
        name: '_MIDIEditorViewModel.setLastTapTime');
    try {
      return super.setLastTapTime(time);
    } finally {
      _$_MIDIEditorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearLastTapTime() {
    final _$actionInfo = _$_MIDIEditorViewModelActionController.startAction(
        name: '_MIDIEditorViewModel.clearLastTapTime');
    try {
      return super.clearLastTapTime();
    } finally {
      _$_MIDIEditorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resizeNotesByDelta(double delta) {
    final _$actionInfo = _$_MIDIEditorViewModelActionController.startAction(
        name: '_MIDIEditorViewModel.resizeNotesByDelta');
    try {
      return super.resizeNotesByDelta(delta);
    } finally {
      _$_MIDIEditorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onNoteTimeDelta(MIDINoteModel noteModel, double dx) {
    final _$actionInfo = _$_MIDIEditorViewModelActionController.startAction(
        name: '_MIDIEditorViewModel.onNoteTimeDelta');
    try {
      return super.onNoteTimeDelta(noteModel, dx);
    } finally {
      _$_MIDIEditorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onPanEnd(
      {required double viewportWidth,
      required Map<String, double> rowPositions}) {
    final _$actionInfo = _$_MIDIEditorViewModelActionController.startAction(
        name: '_MIDIEditorViewModel.onPanEnd');
    try {
      return super
          .onPanEnd(viewportWidth: viewportWidth, rowPositions: rowPositions);
    } finally {
      _$_MIDIEditorViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
midiClipModel: ${midiClipModel},
selectionOverlayViewModel: ${selectionOverlayViewModel},
representedBars: ${representedBars},
noteHeight: ${noteHeight},
lastTapTime: ${lastTapTime}
    ''';
  }
}
