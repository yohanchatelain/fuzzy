#!/bin/bash

gcc test_blas.c -o test_blas -lblas -llapack

for i in {1..10}; do
    ./test_blas >test_blas.$i.txt
done

for i in {1..10}; do
    for j in {1..10}; do
        if diff test_blas.$i.txt test_blas.$j.txt; then
            echo "[PASS] test_blas.$i.txt and test_blas.$j.txt are different"
            exit 0
        fi
    done
done

echo "[FAIL] No difference found in the output of the BLAS test"
exit 1
