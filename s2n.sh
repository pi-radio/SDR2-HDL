#!/bin/bash

git clean -xdf
#sh -c "cd ../PiRadIP ; ./buildlib.py build"
./build.py create generate synthesize dtbo
