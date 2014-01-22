require 'json'

rates = File.read "rates.txt"
rates = rates.split("\n")
rates.each do |rate|
  string = rate.split(/\s*(\$\d*\.\d{2})\s*(\w* \w* \D{1} \d*)\s*(\d*\D{1}\d* \D{1} \d*\D{1}\d*)\s*(\d*\.\d{2})/).reject {|s| s.empty?}
  feature = string[1]
  date_range = string[2]
  price = string.last
  rate = {feature: feature, date_range: date_range, price: price}
  puts rate.to_json
end

