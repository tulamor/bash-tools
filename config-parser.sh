#!/usr/bin/env bash
# $@author Michael Klier chi$@chimeric.de

function readconf() {
    match=0
    while read line; do
        # skip comments
        [[ ${line:0:1} == "#" ]] && continue
        # skip empty lines
        [[ -z "$line" ]] && continue
        # still no match? lets check again
        if [ $match == 0 ]; then
            # do we have an opening tag ?
            if [[ ${line:$((${#line}-1))} == "{" ]]; then
                # strip "{"
                group=${line:0:$((${#line}-1))}
                # strip whitespace
                group=${group// /}
                # do we have a match ?
                if [[ "$group" == "$1" ]]; then
                    match=1
                    continue
                fi
                continue
            fi
        # found closing tag after config was read - exit loop
        elif [[ ${line:0} == "}" && $match == 1 ]]; then
            break
        # got a config line eval it
        else
            eval $line
        fi
    done < "$CONFIG" # Redirect into function's stdin.
}

CONFIG="./SAMPLE_CONFIG.file"

readconf "default"

echo $DATE_PREFIX
echo $DAR_OPTS
echo $DAR_NOCOMPR