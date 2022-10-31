class User
  include ActiveModel::Model

  attr_accessor :cns

  validates :cns, 'CnsBrazil::Cns': true
end
