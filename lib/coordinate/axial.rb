require_relative 'coordinate'

class Axial < Coordinate
    attr_reader :q
    attr_reader :r
    
    def initialize(q, r)
        @q = q
        @r = r 
    end

    @@directions = [Axial.new(1, 0), Axial.new(1, -1), Axial.new(0, -1), Axial.new(-1, 0), Axial.new(-1, 1), Axial.new(0, 1)]

    def neighbors
        @@directions.map{ |x| x+self }
    end

    def Axial.directions
        @@directions
    end

    def distance(other)
        [(@q-other.q).abs, (r-other.r).abs, (other.q+other.r-@q-@r).abs].max
    end

    def linear_interpolation(other)
        dist = distance(other)

        (0..dist).map do |i|
            Axial.new(
                (@q + (other.q - @q) * i.to_f / dist).round,
                (@r + (other.r - @r) * i.to_f / dist).round,
            )
        end
    end

    def +(other)
        Axial.new(@q + other.q, @r + other.r)
    end

    def -(other)
        Axial.new(@q - other.q, @r - other.r)
    end

    def ==(other)
        self.class === other and @q == other.q and @r == other.r
    end

    alias eql? ==

    def hash
        @q*31 + @r*37 # lol, primes
    end

    def to_s
        "(#{q}, #{r})"
    end
end