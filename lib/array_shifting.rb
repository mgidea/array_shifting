require_relative 'array_shifting/swap'
require_relative 'array_shifting/shifting'
module ArrayShifting
  include ArrayShifting::Swap
  include ArrayShifting::Shifting
end

Array.send :include, ArrayShifting
