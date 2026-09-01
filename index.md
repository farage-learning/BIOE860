---
layout: page
title: "BIOE 860 — Data Science I: Data Acquisition and Management"
---


**Spring 2027 · 3 credit hours · 16 weeks · Synchronous online with hands-on labs**

Division of Biostatistics,   
Department of Preventive Medicine  
The University of Tennessee Health Sciences

---
## Add/drop deadlines

The last date to add/drop a Spring term course without a grade designation is TBA. Please act accordingly.

---
## Time/Place

* Tuesdays: 10h00-12h00
* Fridays: 9h00-10h00

---

## Schedule

### Module 1 — The Data Landscape & Project Foundations

| Week | Topic | Materials | Due |
|:----:|:------|:----------|:----|
| 1 | **Introduction to Biomedical Data Science**<br><small>Data science lifecycle; FAIR data principles</small> | [Slides](slides/BIOE860_Week1_Data_Science_Lifecycle.pdf) | — |
| 2 | **Data Sources & Governance**<br><small>Public vs. private vs. restricted (CERNER, UTHSC EDW)<br>*Lab: navigating data dictionaries and access request forms*</small> | [Slides](slides/BIOE860_Week2_Data_Governance.pdf) | [HW 1](homework/hw01.pdf) |
| 3 | **Project Structure & Hygiene**<br><small>Raw vs. processed directories; version control (Git); file naming<br>*Lab: setting up a repository and local environment*</small> | [Slides](slides/BIOE860_Week3_Project_Structure_Git.pdf) | [HW 2](homework/hw02.pdf) |

### Module 2 — Acquisition, Tools, & Feasibility

| Week | Topic | Materials | Due |
|:----:|:------|:----------|:----|
| 4 | **Developing Research Questions**<br><small>FINER criteria; matching questions to data availability</small> | [Slides](slides/week04-finer.pdf) | [HW 3](homework/hw03.pdf) |
| 5 | **Database Formats & Storage**<br><small>CSV/TSV, JSON/NDJSON, HDF5, Feather, Excel</small> | [Slides](slides/week05-formats.pdf) | [HW 4](homework/hw04.pdf) |
| 6 | **Toolset I — Relational Databases & SQL**<br><small>SQL for data exploration<br>*Lab: querying a sample clinical database*</small> | [Slides](slides/week06-sql.pdf) | [HW 5](homework/hw05.pdf) |
| 7 | **Toolset II — Interoperability & APIs**<br><small>REST API concepts and usage<br>*Lab: fetching data programmatically in Python/R*</small> | [Slides](slides/week07-apis.pdf) | [HW 6](homework/hw06.pdf) |
| 8 | **Toolset III — Clinical Data Capture**<br><small>REDCap for data collection and management</small> | [Slides](slides/week08-redcap.pdf) | [HW 7](homework/hw07.pdf) |
| 9 | **Feasibility & Power Analysis**<br><small>Feasibility reports; assessing sample size sufficiency</small> | [Slides](slides/week09-feasibility.pdf) | [HW 8](homework/hw08.pdf) |

### Module 3 — Execution & Reporting

| Week | Topic | Materials | Due |
|:----:|:------|:----------|:----|
| 10 | **Reproducible Reporting**<br><small>Literate programming: RMarkdown and Jupyter</small> | [Slides](slides/week10-reproducible-reporting.pdf) | [HW 9](homework/hw09.pdf) |
| 11 | **Data Wrangling & EDA**<br><small>dplyr and tidyr; ranges, missing values, data quality</small> | [Slides](slides/week11-wrangling-eda.pdf) | [HW 10](homework/hw10.pdf) |
| 12 | **Scientific Writing I**<br><small>Manuscript structure: Introduction and Methods</small> | [Slides](slides/week12-writing-i.pdf) | — |
| 13 | **Scientific Writing II**<br><small>Presenting results (tables/figures); writing the Discussion</small> | [Slides](slides/week13-writing-ii.pdf) | — |
| 14 | **Oral Presentation Skills**<br><small>Translating technical findings into a compelling narrative</small> | [Slides](slides/week14-presentation-skills.pdf) | — |
| 15 | **Final Presentations**<br><small>Student oral presentations</small> | — | **Presentation** |
| 16 | **Project Submission** | — | **Manuscript + codebase** |



---
## Course director


**Gregory Farage, Ph.D.**   
Assistant Professor   
Doctors Office Building, Suite 320,   
66 N. Pauline St, Memphis, TN 38163   
(901) 448-2430     
gfarage@uthsc.edu   

*Office hours: TBD*

**Prerequisites:** BIOE 807, or consent of instructor.

📄 **[Full syllabus (PDF)](syllabus.pdf)**

> **Submissions go on Blackboard, not here.** This site is for distributing slides, assignment
> prompts, and datasets. All deliverables are submitted through Blackboard by the posted deadline.
> For questions, use the Blackboard discussion forum so everyone benefits — email only for
> confidential matters.

---

## About this course

This course establishes the foundational skills for the data science lifecycle in biomedical
research. You will learn to navigate the data landscape — from open public repositories to
restricted clinical warehouses — with an emphasis on data governance, rigorous project
management, and the FAIR principles (Findable, Accessible, Interoperable, Reusable). Through
hands-on practice, you will apply the FINER criteria to formulate research questions and
implement reproducible workflows for acquisition, analysis, and scientific reporting.

### Learning objectives

By the end of the course you will be able to:

1. Identify and classify biomedical data sources (public, private/proprietary, restricted) and
   navigate the authorization and data acquisition process.
2. Implement rigorous data management processes for reproducible workflows and apply FAIR
   data principles.
3. Apply the FINER criteria (Feasible, Interesting, Novel, Ethical, Relevant) to formulate
   research questions, hypotheses, and data acquisition strategies.
4. Design and generate reproducible technical reports that integrate code, analysis, and
   narrative to communicate scientific findings.


---

## Datasets

Datasets used in labs live in [`data/`](data/). Each has a short description and, where
applicable, a link to its original source and license.

| Dataset | Used in | Description |
|:--------|:-------:|:------------|
| *TBD* | Week 6 | Sample clinical database for SQL lab |

> ⚠️ **No restricted data is distributed through this site.** Anything sourced from CERNER, the
> UTHSC EDW, or another controlled source requires your own approved access, and must never be
> committed to a public repository.

---

## Final project

The final project is worth **40%** of your grade and has two components.

**Paper & code (30 pts)** — a complete scientific report plus a reproducible codebase
(RMarkdown or Jupyter) that adheres to the project structure standards from Week 3.

| Criterion | Points |
|:----------|:------:|
| Codebase is fully reproducible and error-free; narrative coherently integrated | 8 |
| Correct directory hierarchy, Git usage, and file naming conventions | 4 |
| Clear research question (FINER), appropriate methods, logical discussion | 8 |
| High-quality and interpretable visualizations and tables | 5 |
| Clarity, grammar, flow, citations, and formatting | 5 |

**Presentation (10 pts)** — an oral presentation of your results in Week 15.

| Criterion | Points |
|:----------|:------:|
| Clarity of research question and motivation | 2 |
| Description of data sources and methods | 2 |
| Quality and accuracy of results (tables, figures, interpretation) | 3 |
| Organization, clarity, and pacing | 2 |
| Response to questions and discussion | 1 |

---

## Grading

| Weight | Component | Detail |
|:------:|:----------|:-------|
| 40% | Final project | 30% paper & code, 10% presentation |
| 40% | Homework | 10 assignments, 4 points each |
| 20% | Participation | 16 pts attendance (1/session) + 4 pts engagement |

**Scale:** A 91–100 · A− 81–90 · B 71–80 · B− 61–70 · C 55–60 · C− 51–54 · D 45–50 · D− 41–44 · F &lt; 40

---

## Policies

**Attendance.** Be on time and bring a laptop.

**Late work.** One 48-hour grace period for a single deliverable during the semester. Otherwise
−10% per 24 hours, unless pre-approved.

**Honor code.** Students are expected to follow the UTHSC Honor Code.

**Collaboration.** Cooperation is permitted and should be cited — e.g. *"Jane Doe helped me debug
the code for producing the scatterplot."*

**Generative AI.** Follow UTHSC policy on Acceptable Use of Generative AI. Use is permitted
provided that (a) you cite it, and (b) you write the prompts in your own words. **Copying any
class material into a generative AI application violates class policy.**

**Disability accommodation.** Any student wishing to self-disclose a disability requiring
accommodation must register and officially request accommodation through the Disability
Coordinator in Student Academic Support Services. All such conversations are confidential.

---

<small>Course materials © Gregory Farage. Last updated: see the
<a href="../../commits/main">commit history</a>.</small>
