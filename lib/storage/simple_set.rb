require 'set'

require_relative '../coordinate/coordinate'

class SimpleSet < Set
    def neighbors(key)
        key.neighbors.select { |x| self.include?(x) }
    end
end
