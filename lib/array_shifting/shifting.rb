module ArrayShifting
  module Shifting
    def to_front!(element)
      shifting!(0, element)
    end

    def to_front(element)
      shifting(0, element)
    end

    def to_back!(element)
      shifting!(-1, element)
    end

    def to_back(element)
      shifting(-1, element)
    end

    def shifting!(indexed, to_move)
      if moveable?(indexed, to_move)
        indexed = indexed < 0 ? index(self[indexed]) : indexed
        delete(to_move)
        if indexed == 0
          unshift(to_move)
        else
          size.downto(indexed) { |num| self[num] = (num == indexed) ? to_move : self[num - 1] }
        end
      end
      self
    end

    def shifting(indexed, to_move)
      self.dup.shifting!(indexed, to_move)
    end

    private
    def moveable?(to_index, element)
      my_size = self.size
      include?(element) && to_index.is_a?(Integer) && (-my_size...my_size).include?(to_index) && self[to_index] != element
    end
  end
end
