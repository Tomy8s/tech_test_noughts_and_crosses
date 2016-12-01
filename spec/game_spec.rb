require 'spec_helper'

describe Game do
  describe '#board' do
    it 'is a 3 by 3 two-dimensional array' do
      expect(subject.board).to eq [[nil, nil, nil],[nil, nil, nil],[nil, nil, nil]]
    end
  end

  describe '#play' do
    it 'takes two manadtory arguments' do
      expect(subject).to respond_to(:check_args).with(2).arguments
    end

    it 'raises an error if x is below 0' do
      expect{ subject.play(-1, 1) }.to raise_error ArgumentError
    end

    it 'inserts a symbol into the board at the given coordinates' do
      subject.play(2,1)
      expect(subject.board[2][1]).to be :x
    end

    context 'if player attempts to play a taken cell' do
      it 'raises an error' do
        subject.play(2,1)
        expect{ subject.play(2,1) }.to raise_error ArgumentError
      end
        
      it 'does not allow overwriting of cell' do
        subject.play(2,1)
        begin
          subject.play(2,1)
        rescue
        end
        expect(subject.board[2][1]).to be :x
      end

      it 'allows a player to retake their go, instead of overwriting' do
        subject.play(2,1)
        begin
          subject.play(2,1)
        rescue
        end
        subject.play(2,2)
        expect(subject.board[2][2]).to be :o
      end
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

  describe '#current_player' do
    it 'inits as :x' do
      expect(subject.current_player).to be :x
    end 
  end

  describe '#change_turns' do
    it 'changes @current_player from :x to :o' do
      subject.change_turns
      expect(subject.current_player).to be :o
    end

    it 'changes @current_player from :o to :x' do
      2.times{ subject.change_turns }
      expect(subject.current_player).to be :x
    end
  end

  describe '#result' do
    it 'returns "not finished" from the outset' do
      expect(subject.result).to eq "not finished"
    end
  end
end