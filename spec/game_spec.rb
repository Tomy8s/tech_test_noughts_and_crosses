require 'spec_helper'

describe Game do
  describe '#board' do
    it 'is a 3 by 3 two-dimensional array' do
      expect(subject.board).to eq [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    end
  end

  describe '#check_args' do
    it 'takes two manadtory arguments' do
      expect(subject).to respond_to(:check_args).with(2).arguments
    end

    it 'raises an error if x is below 0' do
      expect{ subject.check_args(-1, 1) }.to raise_error ArgumentError
    end

    it 'raises an error if y is below 0' do
      expect{ subject.check_args(1, -1) }.to raise_error ArgumentError
    end

    it 'raises an error if x is above 2' do
      expect{ subject.check_args(4, 1) }.to raise_error ArgumentError
    end

    it 'raises an error if y is above 2' do
      expect{ subject.check_args(1, 4) }.to raise_error ArgumentError
    end
  end

  describe '#x_to_play?' do
    it 'defaults to true' do
      expect(subject.x_to_play).to be true
    end 
  end
end