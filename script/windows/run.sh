#!/usr/bin/bash

pascal_code="./*.pas"


_compile() {
    for eachfile in $pascal_code
    do
        file_name=${eachfile//[.pas]/""}
        fpc "$eachfile"
        "./$file_name"
    done
}

_run() {
    printf "Output: \n\n"
    "./$file_name"
    printf "\n"
}

_rm_compiled_files() {
    r_fn=${eachfile/.pas/""}
    del /f "$r_fn" || rm "$r_fn"
    del /f "$r_fn.o" || rm "$r_fn.o"
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