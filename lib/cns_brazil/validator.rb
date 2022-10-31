module CnsBrazil
  class CnsValidator
    def validate_each(record, attribute, value)
      cns = CnsBrazil::Cns.new(value: value)

      record.errors.add attribute, (options[:message] || 'não é valido') unless cns.valid?
    end
  end
end