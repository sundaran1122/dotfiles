#!/bin/bash
xdotool getwindowfocus getwindowname | tr "\n" "\0"
