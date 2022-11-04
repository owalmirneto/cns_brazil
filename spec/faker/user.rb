class User
  include ActiveModel::Model

  attr_accessor :cns, :name

  validates :cns, '::CnsBrazil::Cns': true
end
