# Heat Stress Study

The current version of this repository is for the final research project in **PSYC 30550 (Winter 2025): From Data to Manuscript in R**.

## Abstruct

This project investigates the effects of heat stress on reactive aggression and the role of cognitive and emotional mediators. The study follows a within-subjects, three-section experimental design, measuring physiological responses, cognitive control, working memory, and aggression under controlled temperature conditions.

## Research Questions

1.  How does heat stress influence reactive aggression?
2.  What role do cognitive and affective mediators play?
3.  How do individual differences (e.g., impulsivity, aggression, emotional awareness, heat sensitivity) moderate these effects?

## Hypotheses

-   **Affect-Based Pathway:** Heat stress increases negative affect (e.g., anger), leading to higher costly retaliation rates.
-   **Cognitive Pathway:** Heat stress impairs cognitive control, increasing aggression.
-   **Trait Moderation:** Individuals high in trait impulsivity and aggression will show greater aggression under heat stress.
-   **Emotional Awareness:** Low emotional awareness (clarity and attention) will be linked to greater aggression under heat stress.
-   **Heat Sensitivity:** Individuals with higher sensitivity to heat discomfort will exhibit greater aggression under heat stress.

## Study Summary

### Experimental Design

This study conducted in a controlled sauna chamber. Participants complete tasks measuring:

-   **Cognitive Function:** Working memory (Backward Digit Span), cognitive control (Stop Signal Task)
-   **Aggression:** RC-RAGE (Retaliate or Carry-on: Reactive AGgression Experiment)
-   **Physiological Monitoring:** Heart rate, skin temperature, core body temperature
-   **Affective Self-Report:**
    -   Novaco Anger Scale (NOVACO) (Jones, Thomas-Peter, & Trout, 1999)
    -   Positive and Negative Affect Schedule (PANAS) (Watson, Clark, & Tellegen, 1988)

### Experimental Conditions

-   **Control:** Room Temperature
-   **Moderate Heat Exposure:** 97°F
-   **Severe Heat Exposure:** 113°F

## Repository Structure

To generate the repository structure, run the following command in the terminal:

``` bash
tree 
```

This will output the directory tree structure:

```         
.
├── Heat-Stress-Study.Rproj
├── README.md
├── data
│   └── simulated
├── images
├── localonly
├── research-assessment.md
└── source
```

## Data Simulation

Since full data collection is ongoing, I simulate a dataset using `simstudy` to mimic expected experimental results. The simulated dataset includes:

-   **Demographics:** ID, age, gender, experimental condition (Control/Mid/Hot)
-   **Cognitive & Behavioral Measures:** Stop Signal, RC-RAGE task retaliation rate
-   **Affective Self-Report:** NOVACO, PANAS (Negative/Positive)
-   **Personality Traits (Prescreening):**
    -   BIS-11 Impulsivity Questionnaire
    -   BPAQ Aggression Questionnaire
    -   Clarity and Attention to Emotions Scale
    -   Temperature Perceptions scale

### Running the Simulation

To generate the dataset, run:

``` r
source("source/data_simulation.R")
```

## Contact

Author: Chenyi Dai

For questions, reach out to: [cydai\@uchicago.edu](mailto:cydai@uchicago.edu){.email}
