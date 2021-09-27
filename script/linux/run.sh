#!/usr/bin/bash

pascal_code="./*.pas"


_compile() {
    for eachfile in $pascal_code
    do
        fpc "$eachfile"
    done
}

_run() {
    file_name=${eachfile/.pas/""}
    printf "Output: \n\n"
    "./$file_name"
    printf "\n"
}

_rm_compiled_files() {
    rm "$file_name"
    rm "$file_name.o"
}

_main(){
    printf "\n Copyright (c) 2021 Itz-fork \n\n"
    echo "----> Compiling Your Pascal Program(s)"
    _compile &> /dev/null
    echo "----> Running Your Pascal Program(s)"
    _run
    _rm_compiled_files &> /dev/null
}
_main
