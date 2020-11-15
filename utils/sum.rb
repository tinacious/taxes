# NOTE: there's a method Array#sum as of Ruby 2.4+
# so this is useless
def sum(values)
  values.inject(0, :+)
end
