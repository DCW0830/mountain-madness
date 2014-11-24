# json.trails @trails do |json, trail|
#
#   json.(trail, :name)
# end
json.array!(@trails) do |trail|
 json.name trail.name
 json.length trail.activities.first['length']
end
