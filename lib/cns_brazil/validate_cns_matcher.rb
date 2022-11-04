# frozen_string_literal: true

require 'shoulda-matchers'

module Shoulda
  module Matchers
    module ActiveModel
      def validate_cns(attr = :cns)
        ValidateCnsMatcher.new(attr)
      end

      class ValidateCnsMatcher < ValidationMatcher
        def description
          'requires a valid CNS'
        end

        def failure_message
          'does not require a valid CNS'
        end

        def matches?(subject)
          super(subject)

          (
            disallows_value_of('12345678912314') &&
            disallows_value_of('1234567891234516')
          ) &&
          (
            allows_value_of('') &&
            allows_value_of(nil) &&
            allows_value_of('166947669770008') &&
            allows_value_of(222491445220008) &&
            allows_value_of('736 3347 8546 0000') &&
            allows_value_of('807769250350009') &&
            allows_value_of(954180214890002)
          )
        end
      end
    end
  end
end
