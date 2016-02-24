require 'spec_helper'

describe Minmax do 
  let(:board)          { Board.new(3) }
  let(:ui)             { Console.new }
  let(:player_token)   { 'X' }
  let(:opponent_token) { 'O' }
  let(:rules)          { Rules.new }
  let(:computer)         { Minmax.new(@ui, player_token, opponent_token, rules) }

  describe '#move(board)' do 
    it 'places piece on board' do 
      board.spaces = ['X', 'X',  2, 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      final_board  = ['X', 'X', 'X', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      allow(computer).to receive(:minmax).and_return(2)
      computer.instance_variable_set(:@best_choice, 2)
      computer.instance_variable_set(:@player_token, 'X')

      computer.move(board)
      expect(board.spaces).to eq(final_board)
    end
  end

  describe '#game_over?(board)' do 
    it 'returns true if there is a winner' do 
      board.spaces = ['X', 'X', 'X', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.game_over?(board)).to be_truthy
    end
    it 'returns true if there is a tie' do 
      board.spaces = ['X', 'O', 'X', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.game_over?(board)).to be_truthy
    end
    it 'returns false if game should continue' do 
      board.spaces = ['X', nil, nil, 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.game_over?(board)).to be_falsy
    end
  end

  describe '#switch(piece)' do 
    it 'returns the opposite token' do 
      piece = 'X'
      expect(computer.switch(piece)).to eq('O')
    end
  end

  describe '#score(board)' do 
    it 'returns 10 on player winning move' do 
      board.spaces = ['X', 'X', 'O', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.score(board)).to eq(10)
    end
    it 'returns -10 on comouter winning move' do 
      board.spaces = ['X', 'X', 'X', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.score(board)).to eq(-10)
    end
    it 'returns 0 on tie board' do 
      board.spaces = ['X', 'O', 'X', 
                      'O', 'O', 'X',
                      'O', 'X', 'O']
      expect(computer.score(board)).to eq(0)
    end
  end

  describe '#best_move(piece, scores)' do 
    it 'returns max score for player_token' do 
      piece = 'O'
      @player_token = 'X'
      scores = {1=>10, 2=>-10, 3=>10, 4=>10, 6=>10}
      expect(computer.best_move(piece, scores)).to eq([1, 10])
    end
    it 'returns min score for opponent_token' do 
      piece = 'X'
      @player_token = 'X'
      scores = {1=>10, 2=>-10, 3=>10, 4=>10, 6=>10}
      expect(computer.best_move(piece, scores)).to eq([2, -10])
    end
  end


end
