# Parallel Global Sum Assignment

## What the Code Does
The code computes the sum of an array using four methods: Standard Double, Pairwise, Kahan, and Knuth summation. It initializes an array with high values first, then low (Leblanc problem), calculates the sum, compares it with the accurate sum, and measures runtime.

## Changes Made
- Implemented Pairwise, Kahan, and Knuth summation to reduce floating-point errors.
- Added runtime measurement for each method.

## Observations
- Standard sum accumulates small errors as array size grows.
- Pairwise, Kahan, and Knuth methods give accurate sums with minimal error.
- Kahan and Knuth are slightly slower due to error compensation.

## Why Some Methods Are Better
Floating-point addition is not associative. Pairwise, Kahan, and Knuth reduce rounding errors by reordering or compensating additions.

## Effect on Parallelization
In parallel sum, partial sums are combined in different orders. Without compensation, errors can accumulate differently. Using Pairwise or Kahan/Knuth ensures more accurate results.

## Google Sheet Link 
https://docs.google.com/spreadsheets/d/19tfxADWfj8z7OMaMYs4gbnalHgK0yXXTkjbhxwirMuQ/edit?usp=sharing

## Screenshot
<img width="867" height="834" alt="Screenshot from 2025-10-30 15-52-29" src="https://github.com/user-attachments/assets/0975bb50-57ea-475f-afda-76e1f1c5103e" />
