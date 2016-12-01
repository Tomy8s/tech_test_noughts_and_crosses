require 'spec_helper'

describe Game do
  describe '#board' do
    it 'is a 3 by 3 two-dimensional array' do
      expect(subject.board).to eq [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    end
  end

  describe '#play' do
    it 'takes two manadtory arguments' do
      expect(subject).to respond_to(:play).with(2).arguments
    end
  end
end