#!/usr/bin/env bats

@test "FASTX Toolkit 0.0.13" {
  v="$(fastq_quality_trimmer -h 2>&1 || true )"
  [[ "$v" =~ "FASTX Toolkit 0.0.13" ]]
}


@test "AWS CLI" {
  v="$(aws --version 2>&1)"
  [[ "$v" =~ "aws-cli" ]]
}


@test "Curl v7.47.0" {
  v="$(curl --version)"
  [[ "$v" =~ "7.47.0" ]]
}

@test "DIAMOND v0.9.10" {
  v="$(diamond --version)"
  [[ "$v" =~ "0.9.10" ]]
}

@test "Make sure the run script is in the PATH" {
  h="$(famli -h 2>&1)"

  [[ "$h" =~ "FAMLI" ]]
}
