module ArrayShifting
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

  def swap!(to_index, value, with_index = false)
    indexing = with_index ? to_index : index(to_index)
    if swappable?(to_index, value)
      self[index(value)] = self[indexing]
      self[indexing] = value
    end
    self
  end

  def swap(to_index, value, with_index = false)
    self.dup.swap!(to_index, value)
  end

  def swappable?(to_index, value, with_index = false)
    my_size = self.size
    return false unless include?(value)
    if with_index && to_index.is_a?(Integer) && (-my_size...my_size).include?(to_index)
      return self[to_index] != value
    else
      return include?(to_index)
    end
  end

  def shifting!(indexed, to_move)
    if moveable?(indexed, to_move)
      indexed = indexed < 0 ? index(self[indexed]) : indexed
      delete(to_move)
      if indexed == 0
        unshift(to_move)
      else
        size.downto(indexed) do |num|
          value = num == indexed ? to_move : self[num - 1]
          self[num] = value
        end
      end
    end
    self
  end

  def shifting(indexed, to_move)
    self.dup.shifting!(indexed, to_move)
  end

  def moveable?(to_index, element)
    my_size = self.size
    include?(element) && to_index.is_a?(Integer) && (-my_size...my_size).include?(to_index) && self[to_index] != element
  end
end
