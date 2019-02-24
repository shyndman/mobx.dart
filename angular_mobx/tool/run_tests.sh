#!/bin/bash

pub get
pub run build_runner test --fail-on-severe -- -p chrome
