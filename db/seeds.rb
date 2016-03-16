# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#target_hash = Hash.new

@X = 50
@Y = 10
@Z = 1000
@max_price = 1000000

def attr_list_function(number) 
  attr_list_array = []
  for i in 0..(@Y-1)
    attr_list_array.push((number+65).chr + i.to_s)
  end
  return attr_list_array
end
def target_list_function
  target_list_array = []

  for i in 0..(@X-1)
    target_hash = {target: "attr_" + (i+65).chr, attr_list: attr_list_function(i)}
    target_list_array.push(target_hash)
  end

  return target_list_array
end

for i in 1..@Z
  Campaign.create(campaign_name: "campaign#{i}", price: "#{rand(0..@max_price)}", target_list: target_list_function)
end