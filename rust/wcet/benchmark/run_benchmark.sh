#!/bin/bash

current_directory=$(realpath .)
results_directory="$current_directory/results"
mkdir -p "$results_directory"

echo "[Start] Benchmark tests"
for file in "$current_directory"/*; do
  filename=$(basename "$file")

  echo "[Next file]: $filename"

  if[[ "$filename" == "Makefile" ||
       "$filename" == "flow_facts.rs" ||
       "$filename" == "flow_facts_handle.rs" ||
       "$filename" == "run_benchmark.sh" ||
  ]];
  then continue
  fi

  result_file="$results_directory/${filename}.rs.txt"
  touch "$result_file"

  echo "[WCET analysis]: $filename"
  make wcet-analysis FILE="$filename" >> "$result_file" 2>&1
  echo "" >> "$result_file"

  echo "[Hardware simulation]: $filename"
  make run-hw-sim FILE="$filename" >> "$result_file" 2>&1
done

echo "[End] Benchmark tests"