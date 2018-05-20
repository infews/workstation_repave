#!/bin/bash

source assets/.bash_colors

CLR_YELLOW=33
CLR_YELLOWB=43

function clr_yellow           { clr_layer $CLR_YELLOW "$@"; }
function clr_yellowb          { clr_layer $CLR_YELLOWB "$@"; }
