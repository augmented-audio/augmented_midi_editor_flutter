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

part 'model.g.dart';

class SelectionOverlayViewModel extends _SelectionOverlayViewModel
    with _$SelectionOverlayViewModel {
  Map<String, dynamic> toJson() => _$SelectionOverlayViewModelToJson(this);
}

@JsonSerializable(createFactory: false)
abstract class _SelectionOverlayViewModel with Store {
  @JsonKey(toJson: pointToJson, fromJson: pointFromJson)
  @observable
  Point<double>? startingPoint;

  @JsonKey(toJson: pointToJson, fromJson: pointFromJson)
  @observable
  Point<double>? currentPoint;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @computed
  bool get isDragging => startingPoint != null && currentPoint != null;

  @JsonKey(includeFromJson: false, includeToJson: false)
  @computed
  Rectangle<double>? get boundingBox {
    if (!isDragging) {
      return null;
    }

    double left = Math.min(startingPoint!.x, currentPoint!.x);
    double top = Math.min(startingPoint!.y, currentPoint!.y);
    double width = (startingPoint!.x - currentPoint!.x).abs();
    double height = (startingPoint!.y - currentPoint!.y).abs();

    Rectangle<double> result = Rectangle<double>(left, top, width, height);
    return result;
  }

  @action
  void onPanStart(Offset offset) {
    startingPoint = Point(offset.dx, offset.dy);
  }

  @action
  void onPanUpdate(Offset offset) {
    currentPoint = Point(offset.dx, offset.dy);
  }

  @action
  void onPanCancel() {
    startingPoint = null;
    currentPoint = null;
  }
}

Map<String, dynamic>? pointToJson(Point<double>? point) {
  if (point == null) {
    return null;
  }

  Map<String, double> result = {};
  result["x"] = point.x;
  result["y"] = point.y;
  return result;
}

Point<double>? pointFromJson(Map<String, dynamic>? json) {
  if (json == null) {
    return null;
  }

  var result = Point<double>(json["x"], json["y"]);
  return result;
}
