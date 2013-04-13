#!/bin/bash
rm -r web/out
mkdir -p web/out/dart
cp web/dart/*.dart web/out/dart
dart --package-root=packages/ packages/web_ui/dwc.dart --out web/out web/index.html
