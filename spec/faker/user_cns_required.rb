class UserCnsRequired
  include ActiveModel::Model

  attr_accessor :cns

  validates :cns, presence: true, '::CnsBrazil::Cns': true
end
