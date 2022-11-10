# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CnsBrazil::Generator do
  describe '.block_number' do
    it 'expect legth be 11' do
      generator = described_class.new

      expect(generator.block.length).to eq(11)
    end
  end

  describe '.get' do
    it 'expect legth be 11 15 times' do
      generator = described_class.new

      15.times { expect(generator.call.length).to eq(15) }
    end
  end

  describe '.call' do
    it 'be valid 15 times' do
      15.times do
        generator = described_class.new
        validator = CnsBrazil::Cns.new(value: generator.call)

        expect(validator).to be_valid
      end
    end
  end
end
