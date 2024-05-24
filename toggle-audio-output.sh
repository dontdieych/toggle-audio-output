#!/usr/bin/env bash

function lines__8_v0 {
    local text=$1
    __AMBER_ARRAY_0=();
    local result=("${__AMBER_ARRAY_0[@]}");
            IFS=$'
' read -rd '' -a result <<<"$text"
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
:
fi;
    __AMBER_FUN_lines8_v0=("${result[@]}");
    return 0
};
function trim__10_v0 {
    local text=$1
    __AMBER_VAL_0=$(echo "${text}" | xargs);
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then
:
fi;
    __AMBER_FUN_trim10_v0="${__AMBER_VAL_0}";
    return 0
}

    __AMBER_VAL_1=$(pactl list sinks short | cut -f 2);
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then

exit $__AMBER_STATUS
fi;
    lines__8_v0 "${__AMBER_VAL_1}";
    __AMBER_FUN_lines8_v0__3=("${__AMBER_FUN_lines8_v0[@]}");
    sinks=("${__AMBER_FUN_lines8_v0__3[@]}");
    __AMBER_VAL_2=$(pactl info|grep "^Default Sink:" | cut -d : -f 2);
    __AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then

exit $__AMBER_STATUS
fi;
    trim__10_v0 "${__AMBER_VAL_2}";
    __AMBER_FUN_trim10_v0__4=${__AMBER_FUN_trim10_v0};
    current=${__AMBER_FUN_trim10_v0__4};
    for s in "${sinks[@]}"
do
        echo "${s}";
        echo ""
done;
    echo "${current}";
    if [ $([ "_${current}" != "_${sinks[0]}" ]; echo $?) != 0 ]; then
        pactl set-default-sink ${sinks[1]}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then

exit $__AMBER_STATUS
fi
else
        pactl set-default-sink ${sinks[0]}
__AMBER_STATUS=$?;
if [ $__AMBER_STATUS != 0 ]; then

exit $__AMBER_STATUS
fi
fi