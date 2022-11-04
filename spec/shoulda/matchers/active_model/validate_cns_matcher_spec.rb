# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Shoulda::Matchers::ActiveModel::ValidateCnsMatcher do
  subject { User.new }

  it { is_expected.to validate_cns(:cns) }
  it { is_expected.to validate_cns }
  it { is_expected.not_to validate_cns(:name) }
end
