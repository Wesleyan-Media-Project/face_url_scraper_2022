## The 2022 face collection for face recogntion

### Methods

#### Sources
- Here are the online venues where we search for face images.  
    - Ballotpedia 
    - Wikipedia
    - Persons' facebook pages
    - Candidate campaign websites
    - Votesmart
- We only use a scraped face from Votesmart (size-wise not ideal for face recognition)when we could not find face images in any of the other listed venues. 
- At the final face quality control stage, we also use a few face images from other websites.


#### Steps
1. Scrape face urls according to the following face categories and obtain 1681 rows in [result_face_url_2022_raw.csv](https://github.com/Wesleyan-Media-Project/face_url_scraper_2022/blob/main/result_face_url_2022.csv) with duplicated wmpids that have different urls. For example, Joe Biden is scraped twice both as G20 leader and U.S. president.
2. Go through the downloaded faces to make sure they are not:
    - cropped
    - occluded
    - non-frontal
3. Select largest face image for each unique wmpid
4. Download face images using the urls 

#### Results
- Include 1650 unique wmpids (faces) for the 2022 face collection
- Among them, 94 wmpids do not have face images
- The face_collection_2022 folder thus includes 1556 face image files
- The face_collection_2022 folder can be found at: Delta Lab>github>face_url_scraper_2022

-------------------------------------------

### Face categories

##### Legislative
- Candidate source: wmpcand_012523_wmpid.csv
- Face url source: ballotpedia / wikipedia

1. House canddiate (1193)
2. Senate candidate (173) 
3. Sitting US senators -117th (100)

##### Executive
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

-------------------------------------------

### Copyrights
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


