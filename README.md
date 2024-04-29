# Wesleyan Media Project - Face_Url_Scraper_2022

Welcome! The main purpose of this repo is to create a comprehensive dataset of face images. This repo contains codes for collecting and organizing face images of political figures for the 2022 US election cycle. The scripts provided here are intended to help journalists, academic researchers, and others interested in the democratic process to understand how to scrape and organize various face images from various sources.

This repo is a part of the [Cross-platform Election Advertising Transparency Initiative (CREATIVE)](https://www.creativewmp.com/). CREATIVE has the goal of providing the public with analysis tools for more transparency of political ads across online platforms. In particular, CREATIVE provides cross-platform integration and standardization of political ads collected from Google and Facebook. CREATIVE is a joint project of the [Wesleyan Media Project (WMP)](https://mediaproject.wesleyan.edu/) and the [privacy-tech-lab](https://privacytechlab.org/) at [Wesleyan University](https://www.wesleyan.edu).

To analyze the different dimensions of political ad transparency we have developed an analysis pipeline. The scripts in this repo are part of the Data Collection Step in our pipeline.

![A picture of the repo pipeline with this repo highlighted](Creative_Pipelines.png)

## Table of Contents

- [1. Overview](#1-overview)
  - [Results](#results)
  - [copyrights of face images](#copyrights-of-face-images)
  - [Face categories](#face-categories)
- [2. Setup](#2-setup)
- [3. Thank You!](#5-thank-you)

## 1. Overview

This repo contains codes that collect and organize face images of political figures for the 2022 US election cycle.

The repo contains scripts that:

1. Scrape and organize face images from various online sources in a hierarchical manner. The primary sources are:

   - Ballotpedia
   - Wikipedia
   - Persons' facebook pages
   - Candidate campaign websites

   If a suitable face image cannot be found from these primary sources, then we attempt to scrape a face image from VoteSmart as a fallback option since face images from VoteSmart are often not ideal in size (low resolution) for face recognition purposes. The VoteSmart scraper is located in a seperated folder `/votesmart`

   The scraper collects the face images via different categories based on the political figures' roles, such as legislative (House and Senate candidates, sitting Senators), executive (presidents, cabinet members, governors), judicial (Supreme Court Justices), and other prominent persons. You can find more detailed description of face categories in [Face categories](#face-categories) section.

   The scrapers are named under their sources and categories, for example, a scraper that collects senators' face via Ballotpedia is called `01_ballotpedia_scaper_senate.ipynb`. The script that organizing(clean up) its scraping results is called `01_ballotpedia_scaper_senate_cleanup.ipynb`.The data produced by each script is stored in the `data` folder.

2. After collecting face images from these sources, a final face quality control and assemble stage is performed via `07_face_url_final_assemble.ipynb` and `08_face_url_final_selection.ipynb`. During this stage, a few additional face images may be manually used from other websites to ensure the best possible quality and consistency across the dataset. After the quality control, all the collected and organized face images urls would be combined into a single csv file: `result_face_url_2022.csv` through code `08_face_url_final_selection.ipynb`.


### Results

- Include 1650 unique wmpids (faces) for the 2022 face collection
- Among them, 94 wmpids do not have face images
- The face_collection_2022 folder thus includes 1556 face image files
- The face_collection_2022 folder can be found at: DeltaLab>github>face_url_scraper_2022

The final output contains the following fields:

- **wmpid**: unique id for each political figure
- **Full_name**: full name of the political figure
- **Face_url_2022**: the url of the face image
- **Face_category_2022**: the category of the political figure



### Copyrights of face images

- Ballotpedia: https://ballotpedia.org/Ballotpedia:Image_use_policy
  - GFDL licenses
  - "These images are available for reuse in non-commercial settings with attribution. Please use the following language when using any images that belong to Ballotpedia:This image comes from the website Ballotpedia.org. It is suitable for reuse under GFDL licensing."
- Wikipedia: https://en.wikipedia.org/wiki/Wikipedia:Image_use_policy
  - GFDL licenses
- Whitehouse: https://www.whitehouse.gov/copyright/
  - Creative Commons Attribution 3.0 License: https://creativecommons.org/licenses/by/3.0/us/
  - "Share — copy and redistribute the material in any medium or format"
- National Governors Association: N.A.
- Supreme Court: N.A.

### Face categories

#### Legislative

- Candidate source: wmpcand_012523_wmpid.csv
- Face url source: ballotpedia / wikipedia

1. House canddiate (1193)
2. Senate candidate (173)
3. Sitting US senators -117th (100)

#### Executive

1. Current president (1)

2. All former presidents (44)
   - face url source: https://www.whitehouse.gov/about-the-white-house/presidents/
3. Cabinet (25)
   - Face url source: https://www.whitehouse.gov/administration/cabinet/
4. Gubernatorial candidates (82)

   - Candidate source: Priors 2022.xlsx provided by ABC News

5. Sitting governor (14)
   - face url source: https://www.nga.org/governors/
6. Public health related leaders (6)
   - The Secretary of the Department of Health and Human Services
   - The Surgeon General
   - Director of the National Institute of Allergy and Infectious Diseases
   - Directors of CDC, FDA, NIH

#### Judicial

Judicial (16)

1. Supreme Court Justice (current)
2. Supreme Court Justice (former) - all who took judicial oath after 1980
   - face url source: https://www.supremecourt.gov/about/biographies.aspx

#### Other prominent persons

1. Other prominent politicians(3): Mike Pence, Hilary Clinton, Robert Mueller
2. International political leaders (23)
   - G20: https://en.wikipedia.org/wiki/G20
   - The secretary general of UN
   - Director of WHO - Tedros Adhanom
3. Political historical figures (1)

   - MLK

## 2. Setup

First, make sure you have the [datasets](https://github.com/Wesleyan-Media-Project/datasets) repo cloned.

Then, you need to install the following libraries in R:

    - tidyverse
    - rvest
    - httr
    - xml2

Next, install the following packages for Python:

    - pandas
    - numpy
    - bs4
    - urllib
    - re
    - fuzzywuzzy

After you have installed the required libraries, you can now run the code follow the order of the numbers in the file names (e.g. you can start with: 01_ballotpedia_scaper_senate_cleanup.ipynb, then 01_ballotpedia_scaper_senate.ipynb, then 02_ballotpedia_scaper_house_cleanup.ipynb ...
08_face_url_final_selection.ipynb)

Please be careful when re-runing this script as many face images are replaced with current office holder on relevant official websites.

## 3. Thank You

<p align="center"><strong>We would like to thank our financial supporters!</strong></p><br>

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
