module ArrayShifting
  module Swap
    def swap!(to_index, value, with_index = false)
      if swappable?(to_index, value, with_index)
        indexing = with_index ? to_index : index(to_index)
        self[index(value)] = self[indexing]
        self[indexing] = value
      end
      self
    end

    def swap(to_index, value, with_index = false)
      self.dup.swap!(to_index, value, with_index)
    end

    private
    def swappable?(to_index, value, with_index = false)
      return false unless include?(value)
      my_size = self.size
      if with_index && to_index.is_a?(Integer) && (-my_size...my_size).include?(to_index)
        return self[to_index] != value
      else
        return include?(to_index)
      end
    end
  end
end
