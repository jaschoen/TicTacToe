require_relative 'board'
require_relative 'console'
require_relative 'human'
require_relative 'minmax'
require_relative 'rules'

class Game
  attr_accessor :board, :human, :computer, :ui, :player_token, :opponent_token, :rules

  def initialize
    @ui    = Console.new
    @rules = Rules.new
    @board = Board.new(Rules.size)
  end

#======================Needs Specs=============================
  def start_game
    ui.welcome
    ui.prompt_who_goes_first
    first_to_act   = ui.get_who_goes_first
    ui.prompt_player_token
    player_token   = ui.get_token
    ui.prompt_computer_token
    opponent_token = ui.get_token
    
    @human    = Human.new(@ui, player_token, opponent_token)
    @computer = Minmax.new(@ui, player_token, opponent_token, rules)
  
    ui.print_board(board)

    first_to_act == "1" ? (player, opponent = human, computer) : (player, opponent = computer, human)
    
    while true
      ui.turn(player)
      player.move(board)
      ui.print_board(board)
      ui.won(player) if rules.winner(board)
      ui.tie if rules.tie?(board)
      player, opponent = opponent, player
    end
  end



end
