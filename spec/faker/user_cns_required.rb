# frozen_string_literal: true

class UserCnsRequired
  include ActiveModel::Model

  attr_accessor :cns

  validates :cns, '::CnsBrazil::Cns': true
end
