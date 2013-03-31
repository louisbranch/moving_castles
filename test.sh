#!/bin/bash
FILES=test/*_test.dart
for f in $FILES
do
  dart --checked $f
done
