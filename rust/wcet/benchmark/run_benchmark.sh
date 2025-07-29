#!/bin/bash

current_directory=$(realpath .)
results_directory="$current_directory/results"
mkdir -p "$results_directory"

echo "[Start]: Benchmark tests"
for file in "$current_directory"/*; do
  filename=$(basename "$file")

  if [ -d "$file" ]; then
    echo "[Ignored]: $filename (directory)"
    contine
  fi

  if [[ "$filename" == "Makefile" ||
         "$filename" == "flow_facts.rs" ||
         "$filename" == "flow_facts_handle.rs" ||
         "$filename" == "flow_facts_handle" ||
         "$filename" == "run_benchmark.sh"
    ]]; then
    echo "[Ignored]: $filename"
    continue
  fi

  echo "[Next file]: $filename"

  result_file="$results_directory/${filename}.res.txt"
  touch "$result_file"

  echo "[WCET analysis]: $filename"
  make wcet-analysis FILE="$filename" >> "$result_file" 2>&1
  echo "" >> "$result_file"

  echo "[Hardware simulation]: $filename"
  make run-hw-sim FILE="$filename" >> "$result_file" 2>&1
done

echo "[End]: Benchmark tests"