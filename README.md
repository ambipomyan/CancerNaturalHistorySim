# CancerNaturalHistorySim
This a toy code for cancer natural history simulation

#### Assumptions
The assumptions are:
1. Starting age = 40
2. Cancer ~ binomial(0.1)
3. Survival ~ exp(lambda_sojourn)
4. Test ~ exp(lambda_onset)

Then, #2 and #3 can be used to discribe the cancer, and #4 can be used to describe the test ability.

#### Simulation Settings
The total volume is 100000, for lower variance of the computation of the sensitivities.
Besides, testing ages are 50, 60, and 70.
The test results for the patients are marked with 0, 1 and -1, for not detected, detected and passed_away.

#### Compile and Run
```
Rscript sim.r
```

#### Evaluation
![evaluation](https://github.com/ambipomyan/CancerNaturalHistorySim/blob/main/chart.png)

The horizontal axis is for combination of "goodness of the test and badness of the cancer": the lambda value is the 1/average_years for available to be detected and faital, respectively.
Good sensitivities can be observed when the test ability matches the power of cancer, i.e. lambda_onset >= lambda_sojourn, regardless of the ages.
