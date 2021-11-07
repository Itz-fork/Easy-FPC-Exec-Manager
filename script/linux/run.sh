#!/usr/bin/bash


# Compile the pascal program
pascal_code="./*.pas"
_compile() {
    p_no=1
    for eachfile in $pascal_code
    do
        fpc "$eachfile" &> /dev/null
        _run
        p_no=$((p_no+1))
        _rm_compiled_files
    done
}

# Run the compiled programs
_run() {
    file_name=${eachfile/.pas/""}
    echo -e "Program $p_no Output: \n\n"
    "$file_name"
    echo -e "\n\n_________________ FINISHED _________________ \n\n"
}

# Remove compiled files
_rm_compiled_files() {
    rm "$file_name"
    rm "$file_name.o"
}

# Main function
_main(){
    clear
    printf "\n Copyright (c) 2021 Itz-fork \n\n"
    echo "----> Compiling Your Pascal Program(s)"
    echo "----> Soon you will see the output(s)"
    _compile
    _rm_compiled_files &> /dev/null
}
_main
