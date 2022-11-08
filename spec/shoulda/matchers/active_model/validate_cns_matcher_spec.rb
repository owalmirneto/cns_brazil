# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Shoulda::Matchers::ActiveModel::ValidateCnsMatcher do
  context 'Allow blank' do
    subject { UserAllowBlank.new }

    specify { is_expected.to validate_cns(:cns).allow_blank }
    specify { is_expected.to validate_cns.allow_blank }
    specify { is_expected.not_to validate_cns(:name) }
  end

  context 'Not allow blank' do
    subject { UserCnsRequired.new }

    specify { is_expected.to validate_cns(:cns) }
    specify { is_expected.to validate_cns }
  end
end
