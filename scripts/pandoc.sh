#!/bin/bash

pandoc -s "$1" -o "$2" --variable mainfont="NanumGothic" --pdf-engine=xelatex -V geometry:a4paper,margin=2cm 