require 'uri'
FULL_URI = URI('http://safe-plains-5453.herokuapp.com/bill.json')
HOST_RE = /herokuapp.com/
VALID_BILL = File.open('spec/sample_data/valid_bill_1.txt').read()
