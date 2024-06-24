# CREATIVE --- Face_Url_Scraper_2022

Welcome! This repo contains scripts for collecting and organizing face images of political figures for the 2022 US election cycle. The scripts can be used to create a comprehensive dataset of face images.

This repo is a part of the [Cross-platform Election Advertising Transparency Initiative (CREATIVE)](https://www.creativewmp.com/). CREATIVE has the goal of providing the public with analysis tools for more transparency of political ads across online platforms. In particular, CREATIVE provides cross-platform integration and standardization of political ads collected from Google and Facebook. CREATIVE is a joint project of the [Wesleyan Media Project (WMP)](https://mediaproject.wesleyan.edu/) and the [privacy-tech-lab](https://privacytechlab.org/) at [Wesleyan University](https://www.wesleyan.edu).

To analyze the different dimensions of political ad transparency we have developed an analysis pipeline. The scripts in this repo are part of the Data Collection step in our pipeline.

![A picture of the repo pipeline with this repo highlighted](Creative_Pipelines.png)

## Table of Contents

- [1. Video Tutorial](#1-video-tutorial)
- [2. Overview](#2-overview)
  - [Results](#results)
  - [Face Categories](#face-categories)
  - [Copyrights of Face Images](#copyrights-of-face-images)
- [3. Setup](#3-setup)
- [4. Thank You!](#4-thank-you)

## 1. Video Tutorial

<video src="https://github.com/Wesleyan-Media-Project/face_url_scraper_2022/assets/104949958/98071fdd-26e8-4d19-bf18-a8239fc8c01b" alt="If you are unable to see the video above (e.g., you are getting the error 'No video with supported format and MIME type found'), try a different browser. We tested the video to work on Google Chrome.">
</video>

If you are unable to see the video above (e.g., you are getting the error "No video with supported format and MIME type found"), try a different browser. We tested the video to work on Google Chrome.

Or, you can also try to watch this tutorial through [YouTube](https://youtu.be/RhwtWDbMQdI).

## 2. Overview

This repo contains scripts for collecting and organizing face images of political figures for the 2022 US election cycle. It also contains a dataset ready for your use.

1. The repo contains scripts that scrape and organize face images from various online sources in a hierarchical manner. The primary sources are:

   - Ballotpedia
   - Wikipedia
   - Persons' facebook pages
   - Candidate campaign websites

   If a suitable face image cannot be found from these primary sources, then we attempt to scrape a face image from VoteSmart as a fallback option since face images from VoteSmart are often not ideal in size (low resolution) for face recognition purposes. The VoteSmart scraper is located in a separate folder `/votesmart`.

   The scraper collects the face images via different categories based on the political figures' roles, such as legislative (House and Senate candidates, sitting Senators), executive (presidents, cabinet members, governors), judicial (Supreme Court Justices), and other prominent persons. You can find more detailed description of face categories in the [Face categories](#face-categories) section.

   The scrapers are named per their sources and categories. For example, a scraper that collects senators' face images via Ballotpedia is called `01_ballotpedia_scaper_senate.ipynb`. The script that is organizing (i.e., cleaning up) senators' scraped results from Ballotpedia is called `01_ballotpedia_scaper_senate_cleanup.ipynb`. The data produced by each script is stored in the `data` folder.

2. After collecting face images from a source a final face image quality control and assemble stage is performed via `07_face_url_final_assemble.ipynb` and `08_face_url_final_selection.ipynb`. During this stage, a few additional face images may be manually used from other websites to ensure the best possible quality and consistency across the dataset. After the quality control all the collected and organized face images urls are combined into a single csv file: `result_face_url_2022.csv` via the `08_face_url_final_selection.ipynb` script.

### Results

Here is a summary of the final face image collection dataset:

- [1,650 unique wmpids](https://github.com/Wesleyan-Media-Project/face_url_scraper_2022/blob/main/result_face_url_2022.csv) (face image ids) for the 2022 face collection
- Among them, 94 wmpids do not have face images

The final output contains the following fields:

- **wmpid**: unique id for each political figure
- **full_name**: full name of the political figure
- **face_url_2022**: the url of the face image
- **face_category_2022**: the category of the political figure

An example of a line in the final output is shown below:
| wmpid | full_name | face_url_2022 | face_category_2022 |
| --------- | --------- | ------------------------------------------------------------------------ | ------------------------------------------------------------------- |
| WMPID1000 | Josh Gottheimer | <https://s3.amazonaws.com/ballotpedia-api4/files/thumbs/200/300/Josh_Gottheimer.jpg> | House |

### Face Categories

The face images are collected from various sources and are categorized into the following categories:

#### Legislative

- Candidate source: [wmpcand_012523_wmpid.csv](https://github.com/Wesleyan-Media-Project/datasets/blob/main/candidates/wmpcand_012523_wmpid.csv)

  This file contains the wmpid of the candidates in the 2022 election cycle. This is the source file that we use to collect the face images of the candidates in script `01_ballotpedia_scaper_senate_cleanup.ipynb` and `02_ballotpedia_scaper_house_cleanup.ipynb`.

- Face url source: Ballotpedia / Wikipedia

1. House candidate (1193)
2. Senate candidate (173)
3. Sitting US senators -117th (100)

#### Executive

1. Current president (1)

2. All former presidents (44)
   - face url source: <https://www.whitehouse.gov/about-the-white-house/presidents/>
3. Cabinet (25)
   - face url source: <https://www.whitehouse.gov/administration/cabinet/>
4. Gubernatorial candidates (82)
   - Candidate source: Priors 2022.xlsx provided by ABC News
5. Sitting governor (14)
   - face url source: <https://www.nga.org/governors/>
6. Public health related leaders (6)
   - The Secretary of the Department of Health and Human Services
   - The Surgeon General
   - Director of the National Institute of Allergy and Infectious Diseases
   - Directors of CDC, FDA, NIH

#### Judicial

Judicial (16)

1. Supreme Court Justice (current)
2. Supreme Court Justice (former) - all who took judicial oath after 1980
   - face url source: <https://www.supremecourt.gov/about/biographies.aspx>

#### Other Prominent Persons

1. Other prominent politicians(3): Mike Pence, Hilary Clinton, Robert Mueller
2. International political leaders (23)
   - G20: <https://en.wikipedia.org/wiki/G20>
   - The secretary general of UN
   - Director of WHO - Tedros Adhanom
3. Political historical figures (1)
   - MLK

### Copyrights of Face Images

The face images are collected from various sources, and the copyrights of the face images are as follows:

- Ballotpedia: <https://ballotpedia.org/Ballotpedia:Image_use_policy>
  - GFDL licenses
  - "These images are available for reuse in non-commercial settings with attribution. Please use the following language when using any images that belong to Ballotpedia:This image comes from the website Ballotpedia.org. It is suitable for reuse under GFDL licensing."
- Wikipedia: <https://en.wikipedia.org/wiki/Wikipedia:Image_use_policy>
  - GFDL licenses
- Whitehouse: <https://www.whitehouse.gov/copyright/>
  - Creative Commons Attribution 3.0 License: <https://creativecommons.org/licenses/by/3.0/us/>
  - "Share — copy and redistribute the material in any medium or format"
- National Governors Association: N.A.
- Supreme Court: N.A.

## 3. Setup

1. To run the code that replicate the face image collection, you should first clone this repository to your local machine.

   ```bash
   https://github.com/Wesleyan-Media-Project/face_url_scraper_2022.git
   ```

   In addition, you need also clone the [datasets](https://github.com/Wesleyan-Media-Project/datasets) repository to your local machine since some scripts in this repo require candidates information files like [wmpcand_012523_wmpid.csv](https://github.com/Wesleyan-Media-Project/datasets/blob/main/candidates/wmpcand_012523_wmpid.csv) form the datasets repo:

   ```bash
   https://github.com/Wesleyan-Media-Project/datasets.git
   ```

2. The scripts in this repo are in [Python](https://www.python.org/) and [R](https://www.r-project.org/). Make sure you have both installed and set up before continuing. To install and set up Python you can follow the [Beginner's Guide to Python](https://wiki.python.org/moin/BeginnersGuide). To install and set up R you can follow the [CRAN website](https://cran.r-project.org/). We also recommend using R Studio as an interface of R. Here is the [R Studio website](https://posit.co/download/rstudio-desktop/). The Python Scripts in this repo uses Jupyter Notebook as an interface. It is an interactive environment for Python development. You can install Jupyter Notebook by following the [Jupyter Notebook website](https://jupyter.org/install).

3. After you have installed the above software, you need to install the required libraries for both Python and R. First, you need to install the following libraries in R for the code [votesmart_scraper_2022.R](https://github.com/Wesleyan-Media-Project/face_url_scraper_2022/tree/main/votesmart):

   - tidyverse
   - rvest
   - httr
   - xml2

   To install them, first open your terminal and type `R` to open R console. Then, type the following commands:

   ```R
   install.packages("tidyverse")
   install.packages("rvest")
   install.packages("httr")
   install.packages("xml2")
   ```

   Next, install the required dependencies for the Python scripts. You can install them by running the following command in your terminal:

   ```bash
   pip install pandas numpy beautifulsoup4 fuzzywuzzy
   ```

4. After you have installed the required libraries, you can now run the code follow the order of the numbers in the file names (e.g., you can start with: `01_ballotpedia_scaper_senate_cleanup.ipynb`, then `01_ballotpedia_scaper_senate.ipynb`, then `02_ballotpedia_scaper_house_cleanup.ipynb` ... `08_face_url_final_selection.ipynb`).

   To run the above IPython Notebook code ending with `.ipynb`, you can open the Jupyter Notebook interface by type the following in your terminal:

   ```bash
   jupyter notebook
   ```

   After you open the Jupyter Notebook interface, you can navigate to the folder where you have cloned the repo and open the script you want to run.

   Then, click on the first code cell to select it.
   Run each cell sequentially by clicking the Run button or pressing Shift + Enter.

5. To run the R script [votesmart_scraper_2022.R](https://github.com/Wesleyan-Media-Project/face_url_scraper_2022/tree/main/votesmart), you can type the following command in your terminal:

   ```bash
   Rscript votesmart/votesmart_scraper_2022.R
   ```

**Note**: When re-running this script, face images will be replaced with current office holders on relevant official websites.

## 4. Thank You

<p align="center"><strong>We would like to thank our supporters!</strong></p><br>

<p align="center">This material is based upon work supported by the National Science Foundation under Grant Numbers 2235006, 2235007, and 2235008.</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://www.nsf.gov/awardsearch/showAward?AWD_ID=2235006">
    <img class="img-fluid" src="nsf.png" height="150px" alt="National Science Foundation Logo">
  </a>
</p>

<p align="center">The Cross-Platform Election Advertising Transparency Initiative (CREATIVE) is a joint infrastructure project of the Wesleyan Media Project and privacy-tech-lab at Wesleyan University in Connecticut.

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://www.creativewmp.com/">
    <img class="img-fluid" src="CREATIVE_logo.png"  width="220px" alt="CREATIVE Logo">
  </a>
</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://mediaproject.wesleyan.edu/">
    <img src="wmp-logo.png" width="218px" height="100px" alt="Wesleyan Media Project logo">
  </a>
</p>

<p align="center" style="display: flex; justify-content: center; align-items: center;">
  <a href="https://privacytechlab.org/" style="margin-right: 20px;">
    <img src="./plt_logo.png" width="200px" alt="privacy-tech-lab logo">
  </a>
</p>
