# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CnsBrazil::CnsValidator do
  describe '#cns disallow blank' do
    context 'When value is nil' do
      specify do
        value = nil

        user_cns_required = UserCnsRequired.new
        user_cns_required.cns = value

        expect(user_cns_required).to_not be_valid
      end
    end

    context 'When value a empty string' do
      specify do
        value = ' '

        user_cns_required = UserCnsRequired.new
        user_cns_required.cns = value

        expect(user_cns_required).to_not be_valid
      end

      specify do
        value = ''

        user_cns_required = UserCnsRequired.new
        user_cns_required.cns = value

        expect(user_cns_required).to_not be_valid
      end
    end
  end

  describe '#cns allow blank' do
    context 'When value is nil' do
      specify do
        value = nil

        user = UserAllowBlank.new
        user.cns = value

        expect(user).to be_valid
      end
    end

    context 'When value a empty string' do
      specify do
        value = ' '

        user = UserAllowBlank.new
        user.cns = value

        expect(user).to be_valid
      end

      specify do
        value = ''

        user = UserAllowBlank.new
        user.cns = value

        expect(user).to be_valid
      end
    end

    context 'When value has length 14' do
      it 'record is not valid and adds error to attribute' do
        value = '12345678912314'
        user     = UserAllowBlank.new
        user.cns = value

        user.valid?

        expect(value.length).to eq(14)
        expect(user.errors[:cns]).not_to be_empty
      end

      it 'record is not valid and adds error to attribute' do
        value    = 12_345_678_912_314
        user     = UserAllowBlank.new
        user.cns = value

        user.valid?

        expect(value.to_s.length).to eq(14)
        expect(user.errors[:cns]).not_to be_empty
      end
    end

    context 'When value has length 16' do
      it 'record is not valid and adds error to attribute' do
        value = '1234567891234516'
        user = UserAllowBlank.new
        user.cns = value

        user.valid?

        expect(value.length).to eq(16)
        expect(user.errors[:cns]).not_to be_empty
      end

      it 'record is not valid and adds error to attribute' do
        value = 1_234_567_891_234_516
        user = UserAllowBlank.new
        user.cns = value

        user.valid?

        expect(value.to_s.length).to eq(16)
        expect(user.errors[:cns]).not_to be_empty
      end
    end

    context 'When value begin with 1' do
      context 'value has length 15' do
        specify do
          value = '166947669770008'

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        specify do
          value = 166_947_669_770_008

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '166 9476 6977 0008'

            user = UserAllowBlank.new
            user.cns = value

            expect(user).to be_valid
          end
        end
      end
    end

    context 'When value begin with 2' do
      context 'value has length 15' do
        specify do
          value = '222491445220008'

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        specify do
          value = 222_491_445_220_008

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '222 4914 4522 0008'

            user = UserAllowBlank.new
            user.cns = value

            expect(user).to be_valid
          end
        end
      end
    end

    context 'When value begin with 7' do
      context 'value has length 15' do
        specify do
          value = '736334785460000'

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        specify do
          value = 736_334_785_460_000

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '736 3347 8546 0000'

            user = UserAllowBlank.new
            user.cns = value

            expect(user).to be_valid
          end
        end
      end
    end

    context 'When value begin with 8' do
      context 'value has length 15' do
        specify do
          value = '807769250350009'

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        specify do
          value = 807_769_250_350_009

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '807 7692 5035 0009'

            user = UserAllowBlank.new
            user.cns = value

            expect(user).to be_valid
          end
        end
      end
    end

    context 'When value begin with 9' do
      context 'value has length 15' do
        specify do
          value = '954180214890002'

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        specify do
          value = 954_180_214_890_002

          user = UserAllowBlank.new
          user.cns = value

          expect(user).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '954 1802 1489 0002'

            user = UserAllowBlank.new
            user.cns = value

            expect(user).to be_valid
          end
        end
      end
    end
  end
end
