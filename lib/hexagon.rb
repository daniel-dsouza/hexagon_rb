require_relative 'coordinate/axial'
require_relative 'storage/simple_map'

a = Axial.new(0,0)
b = Axial.new(0,1)
s = SimpleMap.new
s[a] = 34
s[b] = 35
s[Axial.new(-1,0)] = 4
s[Axial.new(4,3)] = 23
puts s.neighbors(a)
puts s.neighbors_values(a)

