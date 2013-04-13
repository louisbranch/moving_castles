#!/bin/bash
rm -r web/out
mkdir web/out
cp -rf web/dart web/out/dart
dart --package-root=packages/ packages/web_ui/dwc.dart --out web/out web/index.html
