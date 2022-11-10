# frozen_string_literal: true

class UserAllowBlank
  include ActiveModel::Model

  attr_accessor :cns, :name

  validates :cns, '::CnsBrazil::Cns': true, allow_blank: true
end
