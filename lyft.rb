require 'csv'
require 'date'

# See README for instructions

CSV.open('outputs/lyft.csv', 'w') do |csv|
  contents = File.open('inputs/lyft.csv').read

  csv << ['Date', 'Description', 'Amount']

  CSV.parse(contents, { headers: true }) do |date, _, _, total, _|
    output_date = date[1].split(' ')[0]
    output_amount = total[1].gsub('$', '').to_f * -1

    csv << [output_date, 'Lyft', output_amount]
  end
end
