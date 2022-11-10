# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CnsBrazil::Cns do
  describe '.generate' do
    it 'be valid 15 times' do
      15.times do
        cns       = described_class.generate
        validator = described_class.new(value: cns)

        expect(validator).to be_valid
      end
    end
  end

  describe '.valid?' do
    context 'When value has length 14' do
      specify do
        value = '12345678912314'
        cns_obj = described_class.new(value: value)

        expect(value.length).to eq(14)
        expect(cns_obj).to_not be_valid
      end

      specify do
        value = 12_345_678_912_314
        cns_obj = described_class.new(value: value)

        expect(value.to_s.length).to eq(14)
        expect(cns_obj).to_not be_valid
      end
    end

    context 'When value has length 16' do
      specify do
        value = '1234567891234516'
        cns_obj = described_class.new(value: value)

        expect(value.length).to eq(16)
        expect(cns_obj).to_not be_valid
      end

      specify do
        value = 1_234_567_891_234_516
        cns_obj = described_class.new(value: value)

        expect(value.to_s.length).to eq(16)
        expect(cns_obj).to_not be_valid
      end
    end

    context 'When value begin with 1' do
      context 'value has length 15' do
        specify do
          value = '166947669770008'
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        specify do
          value = 166_947_669_770_008
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '166 9476 6977 0008'
            cns_obj = described_class.new(value: value)

            expect(cns_obj).to be_valid
          end
        end
      end
    end

    context 'When value begin with 2' do
      context 'value has length 15' do
        specify do
          value = '222491445220008'
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        specify do
          value = 222_491_445_220_008
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '222 4914 4522 0008'
            cns_obj = described_class.new(value: value)

            expect(cns_obj).to be_valid
          end
        end
      end
    end

    context 'When value begin with 7' do
      context 'value has length 15' do
        specify do
          value = '736334785460000'
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        specify do
          value = 736_334_785_460_000
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '736 3347 8546 0000'
            cns_obj = described_class.new(value: value)

            expect(cns_obj).to be_valid
          end
        end
      end
    end

    context 'When value begin with 8' do
      context 'value has length 15' do
        specify do
          value = '807769250350009'
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        specify do
          value = 807_769_250_350_009
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '807 7692 5035 0009'
            cns_obj = described_class.new(value: value)

            expect(cns_obj).to be_valid
          end
        end
      end
    end

    context 'When value begin with 9' do
      context 'value has length 15' do
        specify do
          value = '954180214890002'
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        specify do
          value = 954_180_214_890_002
          cns_obj = described_class.new(value: value)

          expect(cns_obj).to be_valid
        end

        context 'value have cns mask' do
          specify do
            value = '954 1802 1489 0002'
            cns_obj = described_class.new(value: value)

            expect(cns_obj).to be_valid
          end
        end
      end
    end
  end
end
