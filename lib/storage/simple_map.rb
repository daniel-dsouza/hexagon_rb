require_relative '../coordinate/coordinate'

class SimpleMap < Hash
    def neighbors(key)
        key.neighbors.select { |x| self[x] != nil }
    end

    def neighbors_values(key)
        self.select { |k, v| key.neighbors.include?(k) }
    end
end