require_relative '../storage/simple_set'

# require_relative '../coordinate/axial'

def reachable(storage, start, movement)
    visited = SimpleSet.new
    fringe = SimpleSet.new [start]

    (0..movement-1).each do
        fringe.clone.each do |u|
            visited.merge( storage.neighbors(u).select { |x| fringe.add?(x) } )
        end
    end

    visited
end

# s = SimpleSet.new
# s.add(Axial.new(0, 0))
# s.add(Axial.new(0, 1))
# s.add(Axial.new(0, 2))
# s.add(Axial.new(0, 3))
# s.add(Axial.new(0, 4))
# s.add(Axial.new(-1,0))
# s.add(Axial.new(53,45))

# reachable(s, Axial.new(0,0), 3).each { |x| puts x }