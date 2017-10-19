require_relative '../coordinate/coordinate'

class SimpleHash < Hash
    def neighbors(key)
        key.neighbors.select { |x| self[x] != nil }
    end

    def neighbors_values(key)
        self.select { |k, v| key.neighbors.include?(k) }
    end
end