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

      # expect(score(board)).to eq(10)
    end
  end


end



      # allow_any_instance_of(Kernel).to receive(:gets).and_return('XX', 'X')
      # allow(console).to receive(:invalid_input)
      # console.get_token
      # expect(console).to have_received(:invalid_input)