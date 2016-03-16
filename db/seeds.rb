# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#target_hash = Hash.new

def attr_list_function(number) 
  attr_list_array = []
  for i in 0..4
    attr_list_array.push((number+65).chr + i.to_s)
  end
  return attr_list_array
end
def target_list_function
  target_list_array = []

  for i in 0..2
    target_hash = {target: "attr_" + (i+65).chr, attr_list: attr_list_function(i)}
    target_list_array.push(target_hash)
  end

  return target_list_array
end

for i in 1..10
  Campaign.create(campaign_name: "campaign#{i}", price: "#{rand(10..20)}", target_list: target_list_function)
end