# Author: Pavel's scraper (modified by Jielu)
# Date: Website accessed on Mar 4, 2022
setwd("/Users/jieluyao/Documents/GitHub/cand_scraper")
library(tidyverse)
library(rvest)
library(httr)
library(xml2)

# Type "what is my user agent" to get user agent
ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/106.0.0.0 Safari/537.36"

st = read_csv("../data/s_and_t.csv")
# Exclude U.S. territories
k = st$fips_code > 56
st = st[!k, ]

# Example url for the state AL
# https://justfacts.votesmart.org/election/2022/C/AL/2022-congressional?stageId=G
url = "https://justfacts.votesmart.org/election/2022/C/zzz/2022-congressional?stageId=G"

# Step 1: Get html source code 
state_candidates = list()
for (state in st$usps_code) {
  q = sub("zzz", state, url)
  Sys.sleep( round(rnorm(1, 3, 1), digits=0) ) #rnorm(n, mean, var)
  s = GET(q, add_headers("User-agent"=ua, 'Accept'='text/html',
                         "Cache-control"='no-cache'))

  # status_code ==200 means the server successfully answered the http request
  # httr::content(as='text') retrieve the contents of request as a character vector
  if (status_code(s) != 200) {
    cat("Problem with", state, "\n")
    cat(httr::content(s, as="text"))
  } else {
    ## Test for pagination
    
    d = read_html(httr::content(s, as="text"))
    #Pavel2018scraper:page_links = xml_find_all(d, "//div[@class='pagination']/descendant::ul[@class='range']/li")
    page_str = xml_find_first(d, "//div[@class='col mb-2']") %>% html_nodes("h7") %>% html_text()
    page_no = substring(page_str,11) # extract page X from "Page 1 of X"
    if (identical(page_no, character(0))) {
      cat("Processed", state, "\n")
      state_candidates[[state]] = httr::content(s, as="text")
    } else {
      index = paste0(state,"_",1)
      state_candidates[[index]] = httr::content(s, as="text")
      cat("  getting page 1 for", state, "\n")
      for (k in 2:page_no) {
        cat("  getting page", k, "for ", state, "\n")
        q = paste0(sub("zzz", state, url), "&p=", k)
        s = GET(q, add_headers("User-agent"=ua, 'Accept'='text/html',
                               "Cache-control"='no-cache'))
        
        index = paste0(state, "_", k)
        state_candidates[[index]] = httr::content(s, as="text")
      }
    }
  }
}
names(state_candidates)
save("state_candidates", file="st_cand2022.RData")
  
# Step 2: Extract candidates' name and image url
r = lapply(state_candidates, function(x) {
  d = read_html(x)
  nd = xml_find_all(d, "//h3[contains(@id, 'U.S. ')]/parent::div//parent::div/child::*")
  
  node_tags = sapply(nd, xml_name)
  k = which(node_tags == "h3")
  
  tmp_df = data.frame()
  for (j in k) {
    race = xml_text(nd[[j]])
    p = j + 2
    while(p <= length(node_tags) && node_tags[p] == "div") {
      
      img_node = xml_find_first(nd[[p]], ".//img")
      img_url = xml_attr(img_node, "src")
      cand_name = xml_find_first(nd[[p]], ".//h4/a") %>% html_text()
      details_node = xml_find_first(nd[[p]], ".//div[@class='media-body ']")
      details = xml_text(details_node)
      
      tmp_df = rbind(tmp_df, data.frame(race = race,
                                        cand_name = cand_name,
                                        cand_img = img_url,
                                        cand_details = details,
                                        stringsAsFactors = F))
      p = p + 1
    }
  }
  return(tmp_df)
})

candidates = dplyr::bind_rows(r)
candidates = candidates %>% filter(!is.na(cand_name))

is_senate = grepl("U.S. Senate", candidates$race)
is_house = grepl("U.S. House", candidates$race)
candidates$race_code = ifelse(is_senate, "S", "H")

candidates$url = ifelse(is.na(candidates$cand_img), "", paste0("https:", candidates$cand_img))

write.csv(candidates,"vs_2022_face.csv", row.names = FALSE)
