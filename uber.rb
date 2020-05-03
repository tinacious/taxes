require 'csv'
require 'json'
require 'date'

# See README for instructions
CSV.open('outputs/uber.csv', 'w') do |csv|
  csv << ['Date', 'Description', 'Amount']

  JSON.parse(File.open('inputs/uber.json').read)
    .each do |hash|
      date = Date.strptime(hash['requestTime'], '%Y-%m-%d')
      amount = (-1 * hash['clientFare'])

      csv << [date, 'Uber', amount]
    end
end
