class UserAllowBlank
  include ActiveModel::Model

  attr_accessor :cns, :name

  validates :cns, allow_blank: true, '::CnsBrazil::Cns': true
end
