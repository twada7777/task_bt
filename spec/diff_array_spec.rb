require 'spec_helper'

RSpec.describe '#diff' do
  let(:base_array) { (1..1000).to_a.shuffle }
  let(:leftover_array) { base_array.dup }
  let(:diff_array) { DiffArray.new }

  context '正常系' do
    it "標準1" do
      index = 7
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '標準2' do
      index = 489
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '標準3' do
      index = 853
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '境界下限' do
      index = 0
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '境界下限の隣' do
      index = 1
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '境界上限' do
      index = base_array.size - 1
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end

    it '境界上限の隣' do
      index = base_array.size - 2
      leftover_array.delete_at(index)
      expect(diff_array.send(:diff, base_array, leftover_array)).to eq base_array[index]
    end
  end
end