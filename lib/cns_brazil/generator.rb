module CnsBrazil
  class Generator
    def call
      result = generate

      while result.to_s.length != 15
        result = generate
      end

      result
    end

    def block
      first_number.to_s + block_number + block_number;
    end

    private

    # first number should be 1,2,7,8 or 9
    def first_number
      range_value = []
      range_value << rand(1..2)
      range_value << rand(7..9)

      range_value.sample
    end

    def block_number
      '0' + rand(11111..99999).to_s.chop
    end

    def generate
      cns               = block
      rest              = sum_result(cns) % 11
      verificator_digit = rest.zero? ? 0 : 11 - rest

      if verificator_digit === 10
        sum_result = sum_result(cns)
        sum_result += 2

        resto             = sum_result % 11;
        verificator_digit = 11 - resto;
        cns               += "001" + verificator_digit.to_s;
      else
        cns += "000" + verificator_digit.to_s;
      end
    end

    def sum_result(cns)
      cns_to_array = cns.chars.map(&:to_i)

      cns_to_array.each_with_index.reduce(0) do |sum, (element, index)|
        sum += element * (15 - index)
        sum
      end
    end
  end
end