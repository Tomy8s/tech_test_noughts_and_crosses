require 'spec_helper'

describe Game do
  describe '#board' do
    it 'is a 3 by 3 two-dimensional array' do
      expect(subject.board).to eq [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    end
  end
end