#!/bin/bash

for f in $(find . -name '*_test.dart')
do
  dart --checked $f
done
