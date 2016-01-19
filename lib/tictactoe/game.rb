require_relative 'board'
require_relative 'console'
require_relative 'human'
require_relative 'minmax'



class Game
  attr_accessor :board, :human, :computer, :ui, :player_token, :opponent_token

  def initialize
    @board = Board.new
    @ui    = Console.new
  end

#======================Needs Specs=============================
  def start_game
    ui.welcome
    first_to_act   = ui.who_goes_first
    player_token   = ui.player_token
    opponent_token = ui.computer_token
    
    @human    = Human.new("X", @ui, player_token, opponent_token)
    @computer = Minmax.new("O", @ui, player_token, opponent_token)
  
    ui.print_board(board)
    if first_to_act == 1
      player, opponent = human, computer 
    else
      player, opponent = computer, human
    end

    while true

      ui.turn(player)
      player.move(board)
      ui.print_board(board)

      ui.won(player) if board.winner
      ui.tie if board.tie?

      player, opponent = opponent, player

    # game_running
    end
  end



end
