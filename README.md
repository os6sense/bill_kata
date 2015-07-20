# REQUIREMENTS

  ruby >= 2.1
  bower

# INSTALLATON 

  clone this repository

  run

    bower install
    bundle install

# RUNNING

  The simplist way to see the application is navigating to:

    http://librely.com:9292/v1/


  If installed locally running

    bundle exec rackup

  and then navigating to 

    http://localhost:9292/v1/

# ORIGINAL PROBLEM STATEMENT

To display a customer's bill

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

