#!/usr/bin/bash


# Colors
White="\033[1;37m"
Reset="\033[0m"
Red="\033[1;31m"

# Compile the pascal program
pascal_code="./*.pas"
_compile() {
    p_no=1
    for eachfile in $pascal_code
    do
        if (fpc "$eachfile" &> /dev/null) ; then
            _run
            p_no=$((p_no+1))
            _rm_compiled_files
        else
            echo -e "${Red}+ Failed to compile ${eachfile} !${Reset}"
        fi
    done
}

# Run the compiled programs
_run() {
    file_name=${eachfile/.pas/""}
    echo -e "${White}Program $p_no Output:${Reset} \n\n"
    "$file_name"
    echo -e "\n\n${White}_________________ FINISHED _________________${Reset} \n\n"
}

# Remove compiled files
_rm_compiled_files() {
    rm "$file_name"
    rm "$file_name.o"
}

# Main function
_main(){
    clear
    echo -e "\n ${White}Easy FPC Exec Manager 🌝${Reset} \n\n"
    echo -e "${White}--> Compiling Your Pascal Program(s)${Reset}"
    echo -e "${White}--> Soon you will see the output(s)${Reset} \n"
    _compile
    _rm_compiled_files &> /dev/null
}

_main