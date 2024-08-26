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
import 'package:flutter_mobx/flutter_mobx.dart';

import 'model.dart';

class SelectionOverlayView extends StatelessWidget {
  final SelectionOverlayViewModel model;

  const SelectionOverlayView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (!model.isDragging) {
          return Container(child: null);
        }

        var boundingBox = model.boundingBox!;
        return Positioned(
            top: boundingBox.top,
            left: boundingBox.left,
            child: Container(
                width: boundingBox.width,
                height: boundingBox.height,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue.withOpacity(0.8)),
                    color: Colors.blue.withOpacity(0.1)),
                child: null));
      },
    );
  }
}
