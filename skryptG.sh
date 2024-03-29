#!/bin/bash

while [[ $# -gt 0 ]]; do
    case "$1" in
        --date|-d)
            echo $(date)
            exit 0
            ;;
        --logs|-l)
            if [[ "$2" =~ ^[0-9]+$ ]]; then
                count=$2
                shift
            else
                count=100
            fi
            for (( i=1; i<=$count; i++ )); do
                echo "Log $i, Created by skryptG.sh, $(date)" > log$i.txt
            done
            exit 0
            ;;
        --help|-h)
            echo "Usage: skryptG.sh [OPTIONS]"
            echo "Options:"
            echo "  --date, -d      Display today's date"
            echo "  --logs [N], -l  Create N log files (default: 100)"
            echo "  --help, -h      Display this help message"
	    echo "  --init          Clone the repository and add it to PATH"
            echo "  --error [N], -e Create N error files (default: 100)"
            exit 0
            ;;
        --init)
            git clone https://github.com/dominika7777/Lab4.git
            export PATH="$PATH:$(pwd)/Lab4"
            echo "Repository cloned successfully and added to PATH."
            exit 0
            ;;
        --error|-e)
            if [[ "$2" =~ ^[0-9]+$ ]]; then
                count=$2
                shift
            else
                count=100
            fi
            mkdir -p errorx
            for (( i=1; i<=$count; i++ )); do
                echo "Error $i, Created by skrypt.sh, $(date)" > errorx/error$i.txt
            done
            exit 0
            ;;
        *)
            echo "Unknown option: $1. Use --help for usage."
            exit 1
            ;;

    esac
    shift
done

echo "No options provided. Use --help for usage."
exit 1

