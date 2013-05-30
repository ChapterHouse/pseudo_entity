require 'prime'

module PseudoEntity::Randoms

  class HugeEnumerable

    include Enumerable

    attr_accessor :max_array_size
    attr_accessor :rng

    def initialize(max_array_size = nil, rng = nil)
      @max_array_size = max_array_size
      @rng = method(:rand)
      @iterator = 1
      @start_of_sequence = 0
      @shuffle_head = 0
    end

    def [](x)
      _fetch(x)
    end

    def each(&block)
      remaining_or(max_array_size).times { |i| yield _fetch(i) }
    end

    def max_array_size
      @max_array_size ||= [collection_size, 10000].min
    end

    def next_array
      shift(max_array_size)
      to_a
    end

    def empty?
      @start_of_sequence == @end_of_sequence
    end

    def pop(n = nil)
      raise ArgumentError, 'negative array size' if n.to_i < 0
      unless empty?
        n ? (0...remaining_or(n.to_i)).map { pop1 }.reverse : pop1
      else
        n.nil ? nil : []
      end
    end

    def shift(n = nil)
      raise ArgumentError, 'negative array size' if n.to_i < 0
      unless empty?
        n ? (0...remaining_or(n.to_i)).map { shift1 } : shift1
      else
        n.nil ? nil : []
      end
    end

    def shuffle(rng=nil)
      self.dup.shuffle!(rng)
    end

    def shuffle!(rng=nil)
      # TODO: Change the prime to change the shuffle
      rng ||= self.rng
      @start_of_sequence = 0
      @end_of_sequence = nil
      @shuffle_head = rng.call(collection_size)
      #@index = nil
      @iterator = next_prime(( 2 * collection_size / (1 + Math.sqrt(5)) ).to_i)
      self
    end

    def size
      end_of_sequence - start_of_sequence
    end

    private

    attr_reader :shuffle_head
    attr_reader :index, :start_of_sequence, :end_of_sequence

    def collection_size
      raise NotImplementedError, "not implemented for #{self.class.name}"
    end

    def end_of_sequence
      @end_of_sequence ||= collection_size
    end

    def fetch(x)
      raise NotImplementedError, "not implemented for #{self.class.name}"
    end

    def iterator
      @iterator
    end

    def next_index
      self.index = (index + iterator) % collection_size
    end

    def previous_index
      self.index = (index - iterator) % collection_size
    end

    def next_prime(x)
      x = x + (x.even? ? 1 : 2)
      x += 2 until x.prime?
      x
    end

    def pop1
      result = _fetch(end_of_sequence - start_of_sequence - 1)
      @end_of_sequence -= 1
      result
    end

    def remaining_or(x)
      [x, size].min
    end

    def shuffle_index(regular_index)
      (shuffle_head + iterator * regular_index) % collection_size
    end

    def shift1
      result = _fetch(0)
      @start_of_sequence += 1
      result
    end

    def _fetch(i)
      i += start_of_sequence

      if i >= end_of_sequence || i < -size
        nil
      else
        fetch(shuffle_index(i))
      end
    end

  end

  class HugeCollection < HugeEnumerable

    def initialize(enumerable, max_array_size = nil, rng = nil)
      @enum = enumerable
      super(max_array_size, rng)
    end

    def collection_size
      enum_size
    end

    def fetch(x)
      enum[x]
    end

    private

    attr_accessor :enum

    def enum_size
      @enum_size ||= enum.size
    end

  end

  class HugeProduct < HugeEnumerable

    def initialize(enumerable_a, enumerable_b, max_array_size = nil, rng = nil)
      @enum_a = enumerable_a
      @enum_b = enumerable_b
      super(max_array_size, rng)
    end

    def fetch(x)
      [enum_a[x / enum_b_size], enum_b[x % enum_b_size]]
    end

    def collection_size
      enum_a_size * enum_b_size
    end

    private

    attr_accessor :enum_a, :enum_b

    def enum_a_size
      @enum_a_size ||= enum_a.size
    end

    def enum_b_size
      @enum_b_size ||= enum_b.size
    end

  end

  class HugePermutation2 < HugeCollection

    def initialize(enumerable, max_array_size = nil, rng = nil)
      super(enumerable, max_array_size, rng)
    end

    def fetch(x)
      first_index = x / (enum_size - 1)
      second_index = ((x % enum_size) + (x / enum_size + 1)) % enum_size
      [enum[first_index], enum[second_index]]
    end

    def collection_size
      enum_size * (enum_size - 1)
    end

  end

  class HugeCombination2 < HugeCollection

    def initialize(enumerable, max_array_size = nil, rng = nil)
      super(enumerable, max_array_size, rng)
    end

    def collection_size
      sum(enum_size - 1)
    end

    def fetch(x)
      cycle = 1
      while sum_from(enum_size - 1, enum_size - cycle) < x + 1
        cycle += 1
      end
      first_index = cycle - 1

      max_cycles = enum_size - 1
      used = (cycle - 1) == 0 ? 0 : sum_from(max_cycles, max_cycles - (cycle - 2))
      second_index = x - used + cycle

      [enum[first_index], enum[second_index]]
    end

    private

    def sum(x)
      x * (x + 1) / 2
    end

    def sum_from(b, a)
      a, b = [b, a] if a > b
      sum(b) - sum(a-1)
    end

  end

  def compare(a, b)
    a = a.to_a
    b = b.to_a
    puts a.inspect
    puts b.inspect
    puts (a == b).inspect
  end
end