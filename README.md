
# INSTALLATON 

  clone this repository

  run

    bundle install

# RUNNING

  bundle exec rackup

# ORIGINAL PROBLEM STATEMENT

To display a customer's bill

## Requirements

* Must consume bill JSON from endpoint: 
```
http://safe-plains-5453.herokuapp.com/bill.json

* JSON must be consumed by a server acting as a proxy.
* Provide a README on how to run your app or, if you deploy it online, a URL to your app. 

# COMMENTS
I would suggest that a good user experience would require understanding who the
users are and what their needs are. It has been suggested [1] that there are
broadly three types of user who should be considered when designing a B2C
applicaition namely 'inspectors', 'scanners' and 'ignorers'.  

I mention this specifically because of the requirement for a "good user experience"
specified within this challenge. If one examines the UX requirements in
more than basic detail, the absence of dates and times on calls and purchases
would be likely to frustrate inspectors and increase the likelyhood of scanners
suspecting a mistake; this makes providing a good UX experience challenging 
if one accepts that these are correctly identified as user groups.

[1] http://www.uxmatters.com/mt/archives/2008/06/better-bills.php

I would also add to this group, information seekers, who use their bills as 
a way to find information about their service and would apprecite more detail
as well as linkage to explore their services.

