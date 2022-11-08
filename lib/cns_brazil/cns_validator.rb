module CnsBrazil
  class CnsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return true if options[:allow_blank] && value.blank?

      cns = CnsBrazil::Cns.new(value: value)

      record.errors.add(attribute, (options[:message] || "is not an cns")) unless cns.valid?
    end
  end
end