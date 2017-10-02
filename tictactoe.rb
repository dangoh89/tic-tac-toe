board = ['1', '2', '3', '4', '5', '6', '7', '8', '9']

player1 = 'X'

player2 = 'O'



def create_board(board)

  puts board[0..2].join(' | ')

  puts '----------'

  puts board[3..5].join(' | ')

  puts '----------'

  puts board[6..8].join(' | ')

end



def win?(board, player)

  if (board[0] == player && board[1] == player && board[2] == player) ||

     (board[3] == player && board[4] == player && board[5] == player) ||

     (board[6] == player && board[7] == player && board[8] == player) ||

     (board[0] == player && board[3] == player && board[6] == player) ||

     (board[1] == player && board[4] == player && board[7] == player) ||

     (board[2] == player && board[5] == player && board[8] == player) ||

     (board[0] == player && board[4] == player && board[8] == player) ||

     (board[2] == player && board[4] == player && board[6] == player)

    create_board board

    puts "Player #{player} has won!"

    return true

  end

  false

end



def draw? board

  board.each do |e|

    return false if e != 'X' && e != 'O'

  end

  puts 'Draw!'

  true

end



def get_input(board, player)

  puts "Player #{player}, please enter your position [1-9]"

  input = gets.chomp.to_i

  if board[input - 1] == 'X' || board[input - 1] == 'O'

    puts "This position has been taken. Please select another position"

    get_input board, player

  elsif input < 1 || input > 9

    puts 'Invalid position. Please select another position'

    get_input board, player

  else

    board[input - 1] = player

    create_board board

  end

end



def ai_move(board, player)

  empty_positions = board.each_index.select { |i| board[i] != 'X' && board[i] != 'O' }

  board[empty_positions.sample] = player

  puts 'Computer is thinking...computer has moved.'

  create_board board

end



def versus_human (board, player1, player2)

  create_board board

  loop do

    get_input board, player1

    break if win?(board, player1) || draw?(board)

    get_input board, player2

    break if win?(board, player2) || draw?(board)

  end

end



def versus_AI (board, player1, player2)

  puts 'Enter 1 to go first, or 2 to go second.'

  user_selection = gets.chomp.to_i

  if user_selection == 1

    create_board board

    loop do

      get_input(board, player1)

      break if win?(board, player1) || draw?(board)

      ai_move(board, player2)

      break if win?(board, player2) || draw?(board)

    end

  elsif user_selection == 2

    loop do

      ai_move(board, player1)

      break if win?(board, player1) || draw?(board)

      get_input(board, player2)

      break if win?(board, player2) || draw?(board)

    end

  else

    puts 'Invalid selection. Please try again.'

    versus_AI(board, player1, player2)

  end

end



# Return the minimax score

# def get_score(board, ai, human)

#   if win?(board, ai)

#     return 10

#   elsif win?(board, human)

#     return -10

#   elsif draw?

#     return 0

#   else

#     return nil

#   end

# end

#

# # Calculate the best move using minimax algorithm

# def best_move(board, ai, human)

#   return get_score unless get_score(board, ai, human).nil?

#   scores = []

#   moves = []

#

#   empty_positions = board.each_index.select { |i| board[i] != 'X' && board[i] != 'O' }

#

#

# end



# versus_human board, player1, player2

versus_AI board, player1, player2
