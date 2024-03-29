#!/bin/bash

while [[ $# -gt 0 ]]; do
    case "$1" in
        --date)
            echo $(date)
            exit 0
            ;;
        --logs)
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
        --help)
            echo "Usage: skryptG.sh [OPTIONS]"
            echo "Options:"
            echo "  --date      Display today's date"
            echo "  --logs [N]  Create N log files (default: 100)"
            echo "  --help      Display this help message"
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

