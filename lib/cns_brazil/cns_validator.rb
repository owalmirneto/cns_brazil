module CnsBrazil
  class CnsValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return true if value.blank?

      cns = CnsBrazil::Cns.new(value: value)

      record.errors.add attribute, (options[:message] || 'não é valido') unless cns.valid?
    end
  end
end