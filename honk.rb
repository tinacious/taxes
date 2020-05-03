require 'csv'
require 'json'
require 'date'

# See README for instructions
CSV.open('outputs/honk.csv', 'w') do |csv|
  csv << ['Date', 'Description', 'Amount']

  JSON.parse(File.open('inputs/honk.json').read)
    .each do |hash|
      date = Date.strptime(hash['created_at'], '%Y-%m-%d')
      amount = (-1 * hash['total_paid'].to_f)

      csv << [date, 'Honk parking', amount]
    end
end
