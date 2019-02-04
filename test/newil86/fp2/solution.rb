module Newil86
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for index in 0..(length - 1)
          yield(self[index])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map
        arr = MyArray.new
        my_each { |elem| arr << yield(elem) }
        arr
      end

      # Написать свою функцию my_compact
      def my_compact
        ary = MyArray.new
        my_each { |elem| ary << elem unless elem.nil? }
        ary
      end

      # Написать свою функцию my_reduce
      def my_reduce(sum = nil)
        arr_copy = MyArray.new(self)
        sum = sum.nil? ? arr_copy.shift : sum
        arr_copy.my_each { |i| sum = yield(i, sum) }
        sum
      end
    end
  end
end
