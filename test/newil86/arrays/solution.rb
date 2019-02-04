module Newil86
  module Arrays
    include Enumerable
    class << self
      def replace(array)
        max_val = array.max
        array.map { |elem| elem > 0 ? max_val : elem }
      end

      def search(array, find)
        first = 0
        last = array.length - 1
        while first <= last
          middle_elem = (last - first) / 2 + first
          if find < array[middle_elem]
            last = middle_elem - 1
          elsif find > array[middle_elem]
            first = middle_elem + 1
          else
            return middle_elem
          end
        end
        -1
      end
    end
  end
end
