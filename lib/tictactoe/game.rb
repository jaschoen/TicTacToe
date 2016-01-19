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
    
    @human    = Human.new(@ui, player_token, opponent_token)
    @computer = Minmax.new(@ui, player_token, opponent_token)
  
    ui.print_board(board)

    # Set initial player and opponent based on user input
    first_to_act == "1" ? (player, opponent = human, computer) : (player, opponent = computer, human)

    while true
      # prompt move, move, print board
      ui.turn(player)
      player.move(board)
      ui.print_board(board)
      # If game is over, print result and exit
      ui.won(player) if board.winner
      ui.tie if board.tie?
      # if game isn't over, switch players
      player, opponent = opponent, player
    end
  end



end
