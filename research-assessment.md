# Research Project Assessment

**This assessment is for the final research project only.** Use the `assessment.md` file for all mini-projects.

## Instructions

Before submitting your research project draft for grading, confirm:

1.  The manuscript .qmd for your project is in the root directory and knits to .pdf without error.
2.  The knitted .pdf of your draft is in the root directory, with the same filename as the .qmd.
3.  This `research-assessment.md` file is in the root directory of your project repo.
4.  Dr. Dowling and your section TA are collaborators on your GitHub repo with permissions to pull/push.

To complete this assessment:

1.  Complete the basic information section and AI statement.
2.  Confirm all links are correct and accessible
3.  Check off all objectives you are attempting to demonstrate
    1.  To earn 30 points you must demonstrate each objective. However, you do not need to attempt all objectives with each draft if your goal is to build the project over time.
    2.  If the objective is demonstrated somewhere other than the .qmd, add a note in the grader comments section for where to find it (e.g., "see `data-cleaning.R` lines 20-30").
4.  Optionally, complete the reflection section, which may earn engagement points.

## Basic information

Name: Chenyi Dai

CNetID: cydai

Section: 2

Research project title: The Impact of Heat Stress on Reactive Aggression: Exploring the Roles of Impulsivity, Trait Aggression, and Internal State

Submission date: 03-17-2025

Submission number (1-4): 2

Project GitHub repository URL: <https://github.com/introtothesam/Heat-Stress-Study.git>

Filename of manuscript .qmd: manuscript.qmd

Filename of knitted .pdf: manuscript.pdf

## AI Statement

Describe whether and how you used AI/LLMs when completing this project:

I asked ChatGPT while constructing and validating my data simulation script. Specifically, I wanted to generate synthetic rc_rage data using beta distributions to approximate real-world response rates in an experimental task. The reference dataset is the previous study using rc_rage but without heat exposure. I asked ChatGPT for suggestions on different R functions and how best to parameterize the beta distribution.

Additionally, while building the logistic regression models for moderation, I asked ChatGPT for advice on how to structure a hierarchical or mixed-effects model that could capture temperature condition, personality traits, and their interactions. I initially wasn’t sure how to incorporate all variables (temperature, impulsivity, and aggression subscales) into a single model without either over-fitting or losing interpretability.

**I mistakenly misunderstood the AI policy for this class and used AI to polish the language in my reflections, which I now realize is not allowed. AI should not be used to revise or generate any text in this project.**

Optionally (for engagement points) reflect on your use of AI:

For this project, AI helped me which R functions might be most useful for tasks like data simulation and for understanding different modeling strategies. However, for new/ outside class packages, I found it was best to consult the package reference manual or vignettes first, then refine my usage by asking AI clarifying questions. This two-step process ensured the final code aligned with good statistical practice and minimized errors while still benefiting from AI’s speedy suggestions.

**I should construct my reflection in more detail using my own language, rather than relying on AI to improve clarity.**

## Overall requirements

Overall requirements for the research project are as follows:

1.  The project must be a research project. It must provide background on a research topic, ask at least one research question, use data to attempt to answer that question, report the results of the data analysis, and interpret the results in the context of the research question.
2.  The project must be contained in a github repository that follows git best practices and includes all necessary files to run the project from start to finish, including:
    1.  The .qmd file for the manuscript
    2.  All data files used in the project
    3.  All scripts used in the project
    4.  A README.md file & .gitignore file
3.  The project must be reproducible -- a reader should be able to clone the repo and run the .qmd from start to finish without error. The .qmd file should include:
    1.  A YAML header with all fields necessary for an APA manuscript
    2.  Setup source chunks that load libraries, read in data, set chunk options, set seed, etc.
    3.  Minimally, an IMRD structure (Introduction, Methods, Results, Discussion), though it may be more complex
    4.  Integration of markdown and code chunks throughout, following best practices for using code chunks
    5.  Figures and tables rendered in code chunks
    6.  Inline R code & references to render data-dependent text
    7.  At least 1 descriptive analysis and 1 hypothesis test, either in code chunks or sourced scripts
    8.  Frequent and informative code comments throughout
4.  The .qmd file should knit/render to an APA7 formatted manuscript with one click and no errors. The knitted manuscript should include:
    1.  A title page with title, author, and institutional affiliation
    2.  An abstract (this may be minimal, but should exist)
    3.  Narrative text comprising a complete research report
    4.  APA7 references, both in-text citations and a References page
    5.  Publication-ready figures (2+) and tables (1+)
    6.  Results of all analyses presented in-text (and where appropriate, in tables), with no raw R output; where possible, all text should be data-dependent and rendered with inline R code
    7.  Quarto generated references to all figures and tables
    8.  Statistical analyses and figures interpreted in narrative text
5.  The .qmd should render a .pdf identical to the .pdf you submit for grading

## Assessment

The final project must demonstrate each of 30 the course learning objectives, each worth 1 point.

Below each learning objective is a list of general expectations for meeting that objective. You should aim to meet all expectations to earn a point for meeting the objective, but these are not rigid requirements. For example, writing a complex and creative function that uses multiple arguments and returns a complex output could meet the "parse and define functions and arguments" objective, even if it is only used in one context.

Refer to the website for general tips on meeting these objectives and an FAQ.

### GitHub and R Studio

1.  Create and maintain a repo with sensible organization and naming conventions

    1.  All folder and file names are informative

    2.  Uses relative paths correctly

    3.  Does not have duplicate/redundant elements

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

2.  Maintain an informative and up-to-date README.md

    1.  Includes description of repo purpose, data use, research questions, etc.

    2.  Outlines the repo structure with file tree or similar

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

3.  integrate a GitHub repo with an R studio project, including .gitignore file

    1.  All scripts run and all notebooks render if the repo is cloned to another location

    2.  .gitingore comprehensively excludes unnecessary, private, and very large files and are commented appropriately

        -   [x] Objective attempt
        -   [ ] Objective met
        -   Grader comments: .gitignore should not ignore any files required to render the project. In this case, the `apaquarto` package is ignored, which is probably the most important thing required to render the project!

4.  effectively use version control

    1.  Used frequent, informative commit messages

    2.  Relies on document revisions rather than manually created new versions

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

### R programming

5.  Find, install, require, and load R packages

    1.  No errors occur when running scripts in a new environment

        1.  If packages other than the "class packages" listed on the resources page are used, code to install/require them is included *and commented out*
        2.  When a reader opts-in to installing packages by uncommenting the code, it runs without errors

    2.  Uses more than one function to install/load/require packages (including those used in commented code)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: See `data_simulation.R` line 3-4
            -   great use of source scripts

6.  Use arithmetic, comparison, and logical operators

    1.  Uses all three types of operators

    2.  Uses multiple operators in data transformation pipelines and/or inline R code

        -   [x] Objective attempt
        -   [x] Objective met
            -   Grader comments: See `data_simulation.R` and `data_transformation.R`

7.  Parse and define functions and arguments

    1.  Defines at least one function with at least one argument in code chunks or sourced scripts

    2.  User-defined function(s) run(s) without error and produces expected output in at least 2 contexts

    3.  Functions are well-documented with comments

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: See `data_simulation.R` line 153-169, `data_transformation.R` line 77-81, line 117-119

8.  Parse and write conditional statements and/or loops

    1.  Uses conditional in multiple contexts, including dplyr pipelines

    2.  Uses multiple types of conditional/loop functions (e.g., `if_else()`, `case_when()`, `for`, `while`)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: See `data_simulation.R` line 159-176 and `data_transformation.R`

9.  Use `readr` functions to read in and write out data

    1.  Reads in data from at least one source in code chunk or sourced script

    2.  Writes out intermediate and/or final datasets in code chunks or sourced scripts

    3.  Uses only relative paths that run without error when repo is cloned

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

10. Use `dplyr` and `tidyr` functions to transform data (merge)

    1.  Uses at least 3 unique `dplyr` functions

    2.  Uses at least 1 `tidyr` function in a data transformation pipeline

    3.  Combines `dplyr` and `tidyr` functions in a data transformation pipeline

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: See `data_transformation.R` `dplyer`: `mutate()`, `rename()`, `left_join()`...; `tidyr`: `pivot_wider()`

11. Use `stringr` functions to work with string variables

    1.  Uses ate least 2 unique `stringr` functions

    2.  Uses `stringr` functions in a data transformation pipeline

        -   [x] Objective attempt
        -   [ ] Objective met
        -   Grader comments: See `data_transformation.R` `rename()`, `str_detect()`
            -   only 1 stringr function used (rename is not stringr)

12. Use `forcats` functions to work with factor variables

    1.  Uses ate least 2 unique `forcats` functions or one function in 2 unique contexts (with different purposes)
    2.  Uses `forcats` functions in a data transformation pipeline

    -   NOTE: Though they are base R functions, `factor()` and `levels()` can be used to meet this objective as long as they are used in a way that demonstrates the same skills as `forcats` functions, which should involve including optional arguments

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: `factor()` `fct_rev()` `fct_relevel()`

### Data visualization with ggplot2

13. Produce 1- and 2-variable plots with `geom_*` layers

    1.  Creates at least 2 figures with different `geom_*` layers (e.g., a scatter plot and a bar plot)

    2.  At least one plot is multi-variable

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

14. Use dynamic aesthetics to group data

    1.  Uses at least 2 unique data-mapped `aes()` arguments (e.g., color, shape, size) to group data in a plot in one or multiple plots

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

15. Use facets to create parallel plots

    1.  EITHER:
    2.  Uses both `facet_wrap()` and `facet_grid()` in two different plots *or*
    3.  Uses facets with at least one plot using at least two optional arguments (e.g., modifying the number of rows and columns, using free vs fixed scales, etc.)
    4.  Combines facets with other dynamic grouping aesthetics
    5.  If data only includes 1 sensible grouping variable, it may be used for both the faceting and groupin aes.

    -   [x] Objective attempt
    -   [x] Objective met
    -   Grader comments:

16. Create publication-quality plots using `theme` and `labs` layers

    1.  Plots have informative titles, axis labels, and legends

    2.  Fonts are stylized professionally and legibly (e.g., adjusted size/angle/justification)

    3.  Variables and labels display in plain English (e.g., "Age (years)" not "child_age_yrs"

    4.  Uses at least 1 static aesthetic (e.g., color, shape, size) that improves visual clarity without mapping to data

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

### Data analysis

17. Perform simple descriptive analyses with multiple data types

    1.  Calculates summary/descriptive statistics for at least 1 numeric variable (e.g., mean, standard deviation)
    2.  Calculates summary/descriptive statistics for at least 1 non-numeric variable (e.g., frequencies, proportions)
    3.  Presents results in narrative text, table, or plot

    -   NOTE: This objective may be met with only numeric or non-numeric summaries if they are sufficiently complex (at Dr. Dowling's discretion)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

18. Perform simple hypothesis testing analyses for multiple data types

    1.  Performs at least 1 hypothesis test for numeric data (e.g., t-tests, linear regression)
    2.  Performs at least 1 hypothesis test for factor data (e.g., chi-square, ANOVA)
    3.  Presents results in narrative text, table, or plot

    -   NOTE: This objective may be met with only numeric or factor data analyses if they are sufficiently complex (at Dr. Dowling's discretion)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

19. Present and interpret statistics in manuscript narrative

    1.  Presents and interprets results of analyses in narrative text, like the results section of a journal article, including all information appropriate for a given analysis (e.g., effect size, p-value, confidence interval -- dependent on analysis type and results)

    2.  Discriminates between statistically signficiant and non-signficant statistics, where applicable

    3.  Discriminates between informative and non-informative statistics and presents only the former in narrative text

    4.  Uses dynamic inline R code to render data-dependent text

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

### BibTeX

20. Render APA7 in-text citations with BibTeX syntax for multiple citation forms

    1.  Cites at least 3 sources in-text

    2.  Uses at least 2 citation forms (e.g., (Author, Year), Author (Year), etc.)

    3.  May use `cite_r()` to cite R and R packages

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

21. Render an APA7 references page from a .bib file

    1.  Includes all sources cited in-text

    2.  Formats references in APA7 style

    3.  Presents accurate, complete, and error-free references

    4.  May include R and R package citations with `cite_r()`

    5.  May include references not cited in-text

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:
            -   "References" should be heading 1 (centered)

### Notebooks and code chunks

22. Create and effectively use code chunks following best practices

    1.  Uses informative names/labels

    2.  Includes frequent, informative comments

    3.  Follows the "1-chunk-1-thing" rule

    4.  Chunks are distributed throughout the manuscript, sensibly placed near the text they support

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

23. Use code chunks to set up a quarto document

    1.  Sources at least 1 .R script and/or reads in necessary data

    2.  Loads packages in at least 1 code chunk

    3.  Sets preferences/options in at least 1 code chunk

    4.  Organizes setup chunks sensibly

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: good use of sourced scripts in place of very long code chunks

24. Render publication-quality tables, figures, and images from code chunks

    1.  Produces at least 1 table or image with a caption
    2.  Produces at least 1 figure/plot with a markdown caption (title) and note
    3.  Captions are informative, complete, and render correctly
    4.  All tables and figures are referenced in the narrative text (e.g., Figure 1)
    5.  References render without error and link to the correct table/figure in pdf/html output

    -   NOTE: Ideally your table(s) should be produced in APA7 style, but this is not a strict requirement. At a minimum, they should render as formatted tables (not raw output), have readable and correctly formatted text (e.g., column headers should be capitalized and in plain english, not literal variable names), and the table must be dynamically referenced in the text.

        -   [x] Objective attempt
        -   [ ] Objective met
        -   Grader comments:
            -   Duplicates titles (only use fig-cap, not the ggplot title lab)
            -   Tables contain text not in plain English / apa expected form (e.g., temperature_condition, Std_Error should be SE, z_value and p_value should be *z*-value and *p*-value)

25. Execute descriptive and inferential analyses in code chunks

    1.  At least 1 code chunk executes a descriptive analysis (e.g., `summary()`, `table()`)

    2.  At least 1 code chunk executes a hypothesis test (e.g., `t.test()`, `chisq.test()`)

    3.  Results are presented in narrative text, table, or plot

    4.  Results are not displayed as raw R output

    5.  Chunks are organized sensibly and appear near the text they support

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

### R Markdown and Quarto

26. Create and maintain a quarto document YAML header

    1.  Includes all necessary metadata, output options, and formatting options necessary to render an APA styled document (or other specified style if appropriate for the project)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments: missing floatsintext

27. Use quarto R Markdown to compose an academic manuscript

    1.  Uses at least 2 unique text styles (e.g., bold, italics, code)
    2.  Uses at least 2 unique header levels
    3.  Includes at least 1 list
    4.  Includes at least 1 footnote

    -   NOTE: This is going to be one of the most flexible objectives to demonstrate. You need to demonstrate a range of markdown skills and use them to make a readable, informative manuscript. Hitting the four points above should do that, but you can use your judgment about what kind of markdown features will best serve your project. No matter what, you should use markdown to follow APA7 guidelines.

        -   [x] Objective attempt
        -   [ ] Objective met
        -   Grader comments:
            -   1 text style used
            -   1 markdown element (list)
            -   incorrect heading levels for APA

28. Use inline R variables to replace static text

    1.  Replaces static text with inline R references in at least 3 unique numeric contexts

    2.  Replaces static text with inline R references in at least 1 character context

    3.  Ideally, uses inline R references for *all* data-dependent text

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

29. Run inline R functions to render dynamic data-dependent text

    1.  Uses inline R functions to render at least 3 unique data-dependent text outputs (e.g., performs rounding, calculates means, subtracts one list length from another, etc. -- inline rather than in a code chunk)

        -   [x] Objective attempt
        -   [x] Objective met
        -   Grader comments:

30. Use `knitr` and quarto to produce an APA7 formatted 1-click PDF manuscript

    1.  Produces a PDF output that is formatted in APA7 style

    2.  PDF includes all necessary elements (e.g., title page, abstract, body, references)

    3.  PDF renders without error and includes all text, tables, and figures

    4.  No additional steps are needed (e.g., finding data, determining necessary packages to install and load, running unsourced scripts, correcting aboslute paths)

        -   [x] Objective attempt
        -   [ ] Objective met
        -   Grader comments:
            -   See comment below about apaquarto -- this is only affecting 2 points (this one and #3) since I don't want to penalize you for literally everything that involves rendering
            -   Incorrect heading levels
            -   "Introduction" should not exist; title then text
            -   Figures not displayed in text (floatsintext:true)

## Reflection (Optional)

Optionally (for engagement points) write a brief reflection about your work on this project. You can use this space to answer the following questions, but feel free to ignore these questions and write about whatever you think is most important.

-   What was the most challenging aspect of this project?

One of the biggest hurdles was dealing with ongoing data collection. Initially, I had planned on using real participant data, but the timeline required me to simulate a dataset for this final project. Ensuring that the simulated data captured the complexity of real-world behavioral outcomes was both technically and conceptually challenging. I spent a substantial amount of time exploring how to parameterize the data in `simstudy` so that it would plausibly reflect real behaviors from a heat-stress aggression paradigm.

**The most challenging part of this project was simulating an entire dataset since data collection is still ongoing. I intentionally simulated a raw dataset with several separate experimental or survey responses to mimic real data collection. This step also allowed me to prepare a data transformation script that I can later apply directly to my real data.** **The hardest part was generating the RC-RAGE task raw data. From a previous study that developed this game and shared its raw data publicly, I found that retaliation rates were highly skewed. Most people still choose advantageous retaliation, meaning this category is skewed toward 1, while modestly and strongly costly retaliation show moderate skew and a higher proportion of zero responses. To mimic this trend, I decided to use a beta distribution, but setting the parameters for moderate skew was really difficult. I spent a lot of time experimenting with different values and asked an LLM for advice. When incorporating temperature as a stimulus, I simulated higher modestly and strongly costly retaliation rates under hot conditions based on my hypothesis. I didn’t want the simulated dataset to be completely random. I wanted it to reflect the main effect I was testing in my manuscript so that I could report some meaningful results. I devoted a lot of time to generate the RC-RAGE simulation, referring to the previous RC-RAGE raw dataset and analyzing the distribution of the key variables. I also explored the `simstudy` package for dataset simulation. It’s a really straightforward package designed for generating study datasets. It allows direct definition of variable distributions, specification of relationships between covariates and outcomes, and simulation of data based on these specifications. Additionally, I found a package called `SimSST,` which is specifically designed for simulating Stop Signal Task (SST) data. However, I didn’t include SST in my current project because I have no prior experience working with SST reaction time or raw data, and I decided to focus this report on the moderation effect of personality traits instead.**

-   What was the most rewarding aspect of this project?

Despite the challenges, it was extremely gratifying to see the entire analytical pipeline: loading libraries, simulating data, running transformations, analyzing data, fitting hierarchical logistic regression models, and rendering a polished PDF in APA format. Generating that final PDF felt especially satisfying, and I know this approach will be invaluable for future scientific writing. Another highlight was setting up a seamless link between the citr addin and my Zotero library; this made citing references effortless and kept everything well-organized. Even though I’m currently using a simulated dataset, I’ve structured my analysis pipeline in a way that will plug in real data as soon as it becomes available. Specifically, I created a “raw” dataset format that mirrors our ongoing data collection, ensuring `data_transformation.R` can process actual participant data with minimal changes. This forward-thinking strategy should save time and maintain reproducibility when transitioning from simulated to real-world data.

**The most rewarding aspect of this project was going through the entire data analysis pipeline, including exploring different packages, simulating and transforming data, fitting logistic regression models, and rendering the final document in APA format. The two most valuable parts of this process for me were practicing logistic mixed-effects regression and learning how to properly render an APA-formatted document. For the logistic mixed-effects regression, I referred to the analysis from the previous RC-RAGE paper, which only introduced retaliation rates and self-report measures in their model. The original paper included an R function for this analysis, but at first, I was confusing about it because the function looked long and complex, and I didn’t fully understand it. However, after working with the logistic mixed effect hands on in this project, I now have a solid understanding of how to handle logistic mixed effects regression and even built a hierarchical logistic regression model by gradually adding predictors: introduce BIS&BPAQ as predictors - BIS&BPQA total scores as moderators - BIS subscales as moderators - BPAQ subscales as moderator.** **My goal was to estimate the best fitting model that accurately captures the relationship between these variables. Since the current dataset is simulated (and the self-report measures are mostly randomized), I didn’t get significant results, but I plan to follow this hierarchical modeling approach in my future analysis with real data. This experience really helped me rethink the relationships I’m interested in. At first, I wasn’t confident about computing logistic models, but I realized that there’s no single correct answer for moderation analyses since we are still exploring the relationship. Building this step-by-step modeling strategy was incredibly rewarding.**

**For the PDF rendering, I initially used the manuscript mode `apaquarto-pdf: defalt` in apaquarto, but I also discovered that there’s a journal mode. This solved a question I had about how academic papers are formatted from report format into published journal articles. Also, clicking the final render button to generate the APA styled PDF was the most satisfying step. For the bibliography, I linked Zotero to the citr addin, which made referencing much more efficient. And I didn’t have to manually copy and paste each citation. I had already been using Zotero for storing the articles, but now I know how to use it much more effectively for future projects. Lastly, simulating separate raw data files helped me mimic my real data collection process, so the data transformation pipeline I built can be directly applied to my future analysis when I collect real data.**

-   What would you do differently if you were to start over?

I will restart this project with my actual dataset in the coming months, replacing the simulated data with real participant data. When analyzing the real dataset, I plan to incorporate **bootstrapping** when computing the logistic mixed-effects model to improve the robustness of my estimates. Additionally, I expect to observe some meaningful effects in the moderation or mediation analyses, which were not fully interpretable with the simulated data. Having the real dataset will allow me to refine the statistical models further and validate whether the hypothesized relationships hold under empirical conditions.

**I will restart this project with my actual dataset soon. Since I won’t have a large sample size (my current simulation has 50 participants, but in reality, I will likely have 20 or fewer), I plan to incorporate bootstrapping into my logistic mixed-effects models to improve robustness. I will use bootstrapped mean estimates, 95% confidence intervals, and 1,000 bootstrapped samples following the approach from the original RC-RAGE study. Additionally, I expect to see more meaningful effects in the moderation and mediation analyses by following the hierarchical logistic regression modeling steps I’ve developed in this project. In my future analysis, I will also focus on validating these models using statistical validation techniques like bootstrapping to ensure reliability.**

-   What did you learn from this project that you will carry forward to future projects?

Using Quarto and APAQuarto allowed me to generate a fully formatted, publication-ready APA7 manuscript with a single click. I now feel confident in structuring future scientific writing projects using Quarto, ensuring reproducibility and professional formatting without manual intervention. I gained hands-on experience in structuring, organizing, and processing a full dataset from start to finish. This included simulating data that mimicked real-world collection methods, transforming raw variables into analyzable formats, and systematically handling missing values and inconsistencies. These skills will translate directly to working with real experimental data in the future. This project solidified my ability to conduct data analysis methodically, starting from descriptive statistics, progressing to inferential analyses (e.g., ANOVA, logistic mixed-effects models), and culminating in a well-structured research report. Writing the manuscript while integrating analysis in a structured, step-by-step fashion is a workflow I will continue to follow in future projects. Effectively using GitHub for version control was also crucial for keeping my project organized.

**The most practical skill I gained from this project is APAQuarto. I used to write academic reports in Google Docs, but now I know a much better way to generate publishable APA manuscripts or journal articles. The data simulation process was also really rewarding. While in a real scenario, I might encounter challenges like handling missing values, the data wrangling steps I practiced (both in my final project data transformation and mini-projects) have given me confidence in working with raw data in future projects. I also gained a lot of hands-on experience in data analysis, particularly ANOVA and logistic mixed-effects models. Through this process, I not only learned how to build regression functions but also developed a hierarchical analysis plan, which will be incredibly useful for my future research.**

**I also learned how to use GitHub effectively to manage an entire project. The mistake I made with the apaQuarto extension file by accidentally adding it to the .gitignore made me reflect on the importance of being more familiar with the packages I include. Moving forward, I will be more mindful of how others might interact with my repository. Considering the perspective of someone cloning my repo, I now understand that I need to prioritize reproducibility and ensure that everything necessary for running the project is properly included.**

-   What are you most proud of in this project?

I’m particularly proud of how the final manuscript turned out, especially the seamless integration of multiple tables and figures within Quarto. I used a variety of markdown features, including cross-referencing, footnotes, chunk options, to make the final PDF look professional and academically polished. In addition, I adopted some sophisticated statistical approaches, particularly hierarchical logistic regressions with moderation, which I think goes beyond a standard class project and showcases how powerful R can be for advanced modeling.

**As I mentioned, the most satisfying step was rendering the manuscript into a PDF document. I was proud of the final output, especially the hyperlinks that were included. However, after reflecting on the feedback, I realize that there’s still a lot of work to be done, and I need to put in more effort to refine it. I should have worked harder to mimic a real published APA article, ensuring that figures and tables appear in the text instead of just relying on hyperlinks. I also recognize that I need to refer to APA formatting guidelines more carefully, rather than relying on my previous experience with academic writing. This project, while it gave me a lot of valuable learning experience, is not yet at the level I hoped for. There are many details I overlooked, and I regret not catching them earlier. However, I will carry these lessons forward and make sure to apply them in my future research. Every mistake I made here is something I will remember and improve upon in my next projects.**

Alternatively/additionally in mind some of the suggested ways to earn engagement points, and expand on this (or other aspects of your project) in your reflection:

-   Creating many figures and tables, or particularly complex or creative ones

I created several tables to display descriptive statistics, ANOVA results, and regression summaries, along with multiple plots (bar plots with facets, scatterplots) that illustrate the hypothetical effects of heat stress on aggression. This allowed me to demonstrate a range of visualization and reporting skills.

**I created five tables to display descriptive statistics, one-way ANOVA, and logistic mixed effect model summaries. I also creadted two figures including a facet wrap bar plot and a facet grid scatterplot.**

-   Impressively thoughtful and thorough narrative writing in your literature review or discussion section

I devoted significant effort to the Introduction and Discussion sections, ensuring that the literature review on heat stress and aggression was comprehensive while also linking it to a novel behavioral measure—the RC-RAGE task. Summarizing previous research while integrating theoretical frameworks like the Temperature-Aggression Hypothesis and the General Aggression Model was both intellectually stimulating and crucial for setting up the study’s rationale. In the Results section, I applied best practices for scientific reporting by using inline R functions to dynamically update statistical outputs within the text. This approach ensured that all reported values—means, standard deviations, p-values, confidence intervals, and effect sizes—were automatically linked to the data, reducing the risk of manual errors and enhancing reproducibility. Additionally, I focused on interpreting statistical findings in a clear and meaningful way, contextualizing ANOVA results, logistic mixed-effects models, and potential moderation effects to make the data-driven insights more accessible.

**I used a lot of text to illustrate the RC-RAGE task, which is the primary behavioral task measuring reactive aggression in this study. This is a key variable needed more illustrations because it doesn’t directly measure aggression but instead captures it through retaliation rates at different stages (the later participants choose to retaliate, the higher the cost, and the more aggressive their behavior is). I also mentioned the theoretical framework, including the Temperature-Aggression Hypothesis and the General Aggression Model. These frameworks helped me formulate my main effect hypothesis that people will behave more aggressively under hot conditions. In the Results section, I used a lot of inline R functions and manually ensured that all displayed outputs matched the corresponding table results. This not only helped maintain accuracy but also served as a validation method for checking my results. For the logistic models (moderation analyses), I explained the hierarchical modeling approach and presented the nonsignificant results using inline R code instead of tables. I also explained reasons for why these tables weren’t included and outlined my future analysis plan to further investigate these effects.**

-   Employing sophisticated statistical techniques in your analysis

This project incorporated advanced statistical modeling techniques beyond standard hypothesis testing. In addition to one-way ANOVAs, I implemented hierarchical logistic mixed-effects models to account for repeated measures within participants. These models allowed me to investigate whether trait aggression and impulsivity moderated the relationship between heat stress and retaliation rates, providing a more nuanced understanding of individual differences in aggressive behavior. This project strengthened my ability to select appropriate statistical techniques for complex research questions, a skill that will be invaluable in future studies.

**One non standard statistical technique I used was building hierarchical logistic mixed-effects models to capture as much of the underlying moderation effect as possible between self-reported measures and the main effect of hot temperature on aggression. This approach allowed me to take a more detailed look at whether BIS or BPAQ moderates the main effect, and if so, which specific subscales of BIS and BPAQ contribute to this moderation.**

-   Making excellent use of markdown features to create a polished final product

I also made excellent use of Quarto markdown features to create a polished, publication-ready manuscript, leveraging cross-referencing for figures and tables, inline R code for dynamic statistical updates, and formatted tables using `kableExtra` and `apaTables`. These elements ensured seamless automation between data analysis and reporting.

**I used a single markdown file to integrate all source scripts, analysis code chunks, and report text, and finally generating a publishable manuscript. This use of markdown file ensures reproducibility. The main features I utilized in the markdown file include dynamic inline R functions, hyperlinked outputs and references, and different levels of APA headings. All statistical analyses were conducted within this markdown file, and I used `ggplot2`for visualizations and `kableExtra` for displaying tables to ensure that the figures and tables were well-structured and publication-ready.**

-   Having a maximally reproducible and dynamic manuscript

The manuscript was designed to be maximally reproducible, with sourcing scripts for data simulation and transformation, relative file paths for portability, automated citation management through Zotero, and inline R functions to eliminate errors in manual reporting. This reproducibility means that once real data is available, I can integrate it directly into the pipeline, automatically updating all analyses, tables, and interpretations.

**I used the citr add in linked to my Zotero library, inline R functions, and sourced my data simulation and transformation scripts within a single markdown file. One major reflection from this process is the importance of including extension files for packages to ensure reproducibility and prevent issues when others clone and run the project.**

-   Fully committing to best practices for version control and GitHub integration/organization

I maintain my repo frequent, well-documented commits, use a `.gitignore` file to manage sensitive or unnecessary files, structure the repository with clearly organized directories, and write a detailed README to ensure accessibility.

**I maintained my git repository with frequent and informative commits throughout the project. Before writing any scripts or the manuscript, I first constructed the README file to establish a clear overall structure for my project. At the end, I revised the README to reflect the final project structure, ensuring it accurately documented the workflow.**.

## Grading

All final projects are graded by Dr. Dowling. You will see your grade on Canvas separated into two categories: objective points and engagement points.

-   **Objective points:** 25/30
-   **Engagement points:** 0/10 -- see note below
-   **Total points:** 25/40

**Comments:**

Chenyi, you have clearly put a lot of effort into this project and have demonstrated a strong understanding of the course material. I recognize a lot of real strengths here. Yur analyses are sophisticated, your sourced scripts are very effective, and you've fully committed to dynamic text and inline r code. That said, there are two major issues that are affecting your grade.

The first issue is that **apaquarto** is not installed in this repo because you have included in your .gitignore. I have installed it on my local machine to render your project. I can tell that you have it installed and it does render as expected once I install it locally, so I am not docking you points for every time this would lead to failure to demonstrate objectives. Please remember that if you use this workflow in the future, you should prioritize repo organization and reproducibility.

A bigger concern is your use of AI for text. Although you are welcome to use AI for generating code, the course policy explicitly prohibits use of LLMs or other AI to generate any text, including text for your reflections. It is evident that you have used AI for generating text in your reflection. Much of the text is rewording of my own language from the assignment and assessment document. The text also says that you did things you did not actually do, like **creating markdown footnotes and creating tables with apaTables.**

I will not accuse you of using AI to generate text of the manuscript itself, but I caution you that if you have done so you need to rewrite the narrative text if you intend to take this project further, like submitting it to a journal or as a thesis. You should know that LLMs have a very distinct style that is recognizable to people who have read a lot of text generated by them. I do not have strong evidence to suggest you have done this, but I want to make it very clear to you that just because I am choosing not to further analyze your manuscript's text for AI use does not mean no one else will.

I have given you a 0 for engagement due to violation of the AI policy. However, I do recognize that you have worked very hard on this project and want to give you the benefit of the doubt. I would like to believe that this was an error in judgment or misunderstanding of the policy. I am willing to give you the opportunity to rewrite and resubmit this reflection without the use of AI. You should also update your AI statement to explain in full how you used AI originally and how you have corrected this for the resubmission.

If you do so, I will award you up to 5 points for engagement. If you choose to do this, make the changes directly in this document, commit and push to github, then email me to let me know. I will review and update your grade accordingly. The deadline for submitting grades to the registrar is March 18th, so I need to receive your resubmission by that morning at the latest. If I haven't gotten anything from you by the time I submit grades for all students, I will submit your grade as is.
