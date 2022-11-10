# frozen_string_literal: true

require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def validate_cns(attr = :cns)
        ValidateCnsMatcher.new(attr)
      end

      class ValidateCnsMatcher < ValidationMatcher
        ALLOW_VALUES = [
          '166947669770008',
          222_491_445_220_008,
          '736 3347 8546 0000',
          '807769250350009',
          954_180_214_890_002
        ].freeze

        DISALLOW_VALUES = %w[12345678912314 1234567891234516].freeze

        def initialize(attribute)
          super(attribute)
          @options = {}
        end

        def description
          message = 'requires a valid CNS'

          message += ' included blank' if expects_to_allow_blank?

          message
        end

        def failure_message
          'does not require a valid CNS'
        end

        def matches?(subject)
          super(subject)

          ALLOW_VALUES.each { |value| allows_value_of(value) }
        end

        def does_not_match?(subject)
          super(subject)

          DISALLOW_VALUES.each { |value| disallows_value_of(value) }
        end
      end
    end
  end
end
