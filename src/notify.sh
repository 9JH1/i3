#!/bin/bash
#set-paused
#is-paused
if [ $(dunstctl is-paused) = "true" ];then
    echo -n "off";
else
    echo -n "on";
fi
