# Making Tic-Tac-Toe
# First, let's make a method and call it tic_tac_toe. 

        # def tic_tac_toe

        # end

# We need to create a variable to hold the gameboard - I'm going to use an array with arrays inside it to simulate 3 rows and 3 columns.

        # board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# We'll create a variable to hold the player whose turn it is. This will start assigned to the string of "X" and will then alternate between "X" and "O" throughout the game.

        # player = "X"

# We'll also create a variable called winner; this will be used to determine whether or not someone has won the game yet. It will start assigned to the boolean false and will become true when someone has won.

        # winner = false
        # puts "Play TIC-TAC-TOE!"

# Because these variables are all attributes of this specific game, I think I'll go ahead and make a game hash to put them all in. As I convert these variable names to keys, I'm also going to make them symbols.

        # game = {
        #         board: [[1, 2, 3],
        #                 [4, 5, 6],
        #                 [7, 8, 9]],
        #         player: "X",
        #         winner: false
        # }

# Now I want to show the gameboard in the terminal; we need to tell the terminal how to format it, or else it will just come out in a string of numbers.

        # puts "The Board:"
        # puts "#{game[:board][0][0]} | #{game[:board][0][1]} | #{game[:board][0][2]}"
        # puts "---------"
        # puts "#{game[:board][1][0]} | #{game[:board][1][1]} | #{game[:board][1][2]}"
        # puts "---------"
        # puts "#{game[:board][2][0]} | #{game[:board][2][1]} | #{game[:board][2][2]}"

# Let's run this by calling the method.

        # tic_tac_toe

# (RUN IT)

# I kind of want this to not come out all at once, so I'm going to use the ruby Sleep method. This tells the program to wait a second.

        # sleep(1)
        # puts "The Board:"
        # puts "#{game[:board][0][0]} | #{game[:board][0][1]} | #{game[:board][0][2]}"
        # puts "---------"
        # puts "#{game[:board][1][0]} | #{game[:board][1][1]} | #{game[:board][1][2]}"
        # puts "---------"
        # puts "#{game[:board][2][0]} | #{game[:board][2][1]} | #{game[:board][2][2]}"

# (RUN IT)

# Now I'm going to tell the player that it's their turn, ask them to select a space, and then add either an X or an O to the Board. I'm also going to convert the user input to an integer.

        # puts "It's #{game[:player]}'s turn. Pick a space on the Board by typing a number!"
        # user_choice = gets.chomp.to_i

# Before I add an X or an O to the Board, I should check and make sure that it hasn't been taken yet. I'll use a while statement to do this, because I want it to keep asking the user to select a new space if the space is already taken.

        # while !board.flatten.include?(user_choice)
        #   puts "That's not an available space. Pick a new space."
        #   user_choice = gets.chomp.to_i
        # end

# Once the player has satisfied this, I'm going to actually put the X or the O on the Board. First I need to know where the space the user has chosen is, so that I can replace the number with a letter. There are many different ways to go about this. I'm going to calculate first which row the number is in by dividing it by 3 and then rounding it up, before subtracting 1. This is pretty complicated, so I encourage you to work through it slowly to understand what it's doing.

        # row_index = (user_choice / 3.0).ceil - 1

# I then calculate the column index by checking the row.
        
        # col_index = board[row_index].index(user_choice)

# Finally, I will assign that space to either the X or O, whichever turn it currently is.

        # board[row_index][col_index] = player

# After this, I want to change the player variable so that it becomes the other player's turn.

        # if player == "X"
        #   player = "O"
        # elsif player == "O"
        #   player = "X"
        # end

# Now, because there are 9 turns, I want to use a times loop to go through this 9 times.

        #   9.times do
        #   end

# (RUN IT)

# Great, so now we need to actually evaluate each turn whether or not someone has won. If so, we will reassign the key winner to the value true and end the game. There are 8 possible ways to win tic-tac-toe: taking up one of the three rows, one of the three columns, or one of the two diagonals. We will account for all 8.

        # winner = true if board[0][0] == board[0][1] && board[0][0] == board[0][2]
        # winner = true if board[1][0] == board[1][1] && board[1][0] == board[1][2]
        # winner = true if board[2][0] == board[2][1] && board[2][0] == board[2][2]
        # winner = true if board[0][0] == board[1][0] && board[0][0] == board[2][0]
        # winner = true if board[0][1] == board[1][1] && board[0][1] == board[2][1]
        # winner = true if board[0][2] == board[1][2] && board[0][2] == board[2][2]
        # winner = true if board[0][0] == board[1][1] && board[0][0] == board[2][2]
        # winner = true if board[0][2] == board[1][1] && board[0][2] == board[2][0]

# These are one-line if statements; they're useful if your conditional statements aren't going to be very complex. Now, I'm going to slightly alter our if statement at the end of every turn to acount for victory.


        # if game[:winner]
        #   puts "The game is over! #{game[:player]} has won."
        #   break
        # elsif game[:player] == "X"
        #   game[:player] = "O"
        # elsif game[:player] == "O"
        #   game[:player] = "X"
        # end

# Here, I use the keyword break; this will end the times loop, and therefore the game, if a player wins. Break can be useful if you want to end a times loop or an each loop early. It's important that I list the conditional statements in this order, as one of the elsif statements is guaranteed to be true, even if someone has technically won the game. Therefore, if I included the "if winner" statement at the end, we would never reach it. Also, it's important to note that I could also write the "if winner" statement as the following:

        # if winner == true

# However, this additional code is unneccessary, as winner is a boolean and therefore "if winner" will return either true or false. In fact, every value in Ruby except for false and a special value called nil evaluates to true. So we could also write this, and it would return true:

        # if 3

# Anyway, back to tic-tac-toe. If someone wins, I also want to show the gameboard again. I could rewrite all of this code, but it's not keeping my code very DRY as I have to repeat myself. So, I'll put this code into a method:

        # def show_board(board)
        #   sleep(1)
        #   puts "The Board:"
        #   puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
        #   puts "---------"
        #   puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
        #   puts "---------"
        #   puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
        # end

# Then, I'll update my code so that I call this method with the tic_tac_toe method.

# (UPDATE code with show_board method)

# Let's run this and make sure it works. 

# (RUN IT)

# Great, so we've almost got the core functionality of the game. We have made sure to account for either player winning, and if a player does win, the game will end early. However, we haven't accounted for what happens if all 9 turns play out and no player wins. Let's add this functionality. This will have to come after all 9 turns have completed. We'll check to see if there's a winner; if there's not, then we will put out a message that the game is over and the players are tied.

        # if !game[:winner]
        #   show_board(game[:board])
        #   puts "The game is over! It's a tie."
        # end

# Great. We should now have the core functionality of the game. If you want to take this a step further, consider altering the game so that you're playing against a computer player that will randomly select a space each turn. I've uploaded an example of this to my github, and it includes some additional code that causes the program to speak to the player while playing. Feel free to check it out!

def show_board(board)
  sleep(1)
  puts "The Board:"
  puts "#{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
  puts "---------"
  puts "#{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
  puts "---------"
  puts "#{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
end

## TWO HUMAN PLAYERS

def tic_tac_toe
  game = {
          board: [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]],
          player: "X",
          winner: nil
  }

  puts "Play TIC-TAC-TOE!"

  9.times do
    show_board(game[:board])

    puts "It's #{game[:player]}'s turn. Pick a space on the Board by typing a number!"
    user_choice = gets.chomp.to_i

    while !game[:board].flatten.include?(user_choice)
      puts "That's not an available space. Pick a new space."
      user_choice = gets.chomp.to_i
    end
    
    row_index = (user_choice / 3.0).ceil - 1
    col_index = game[:board][row_index].index(user_choice)
    game[:board][row_index][col_index] = game[:player]

    game[:winner] = true if game[:board][0][0] == game[:board][0][1] && game[:board][0][0] == game[:board][0][2]
    game[:winner] = true if game[:board][1][0] == game[:board][1][1] && game[:board][1][0] == game[:board][1][2]
    game[:winner] = true if game[:board][2][0] == game[:board][2][1] && game[:board][2][0] == game[:board][2][2]
    game[:winner] = true if game[:board][0][0] == game[:board][1][0] && game[:board][0][0] == game[:board][2][0]
    game[:winner] = true if game[:board][0][1] == game[:board][1][1] && game[:board][0][1] == game[:board][2][1]
    game[:winner] = true if game[:board][0][2] == game[:board][1][2] && game[:board][0][2] == game[:board][2][2]
    game[:winner] = true if game[:board][0][0] == game[:board][1][1] && game[:board][0][0] == game[:board][2][2]
    game[:winner] = true if game[:board][0][2] == game[:board][1][1] && game[:board][0][2] == game[:board][2][0]

    if game[:winner]
      show_board(game[:board])
      puts "The game is over! #{game[:player]} has won."
      break
    elsif game[:player] == "X"
      game[:player] = "O"
    elsif game[:player] == "O"
      game[:player] = "X"
    end
  end

  if !game[:winner]
    show_board(game[:board])
    puts "The game is over! It's a tie."
  end
end

## PLAY AGAINST COMPUTRON

def tic_tac_toe_with_computron
  game = {
          board: [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9]],
          player: "X",
          winner: nil
  }

  puts ""
  puts "Play TIC-TAC-TOE with Computron!"
  `say Play Tic-Tac-Toe with Compyutron!`

  9.times do
    show_board(game[:board])

    if game[:player] == "X"
      puts ""
      puts "It's your turn. Pick a space on the Board by typing a number!"
      `say Its your turn. Pick a space on the Board by typing a number!`

      user_choice = gets.chomp.to_i

      while !game[:board].flatten.include?(user_choice)
        puts "That's not an available space, you fool. Pick a new space."
        `say Thats not an available space you fool. Pick a new space.`
        user_choice = gets.chomp.to_i
      end

      row_index = (user_choice / 3.0).ceil - 1
      col_index = game[:board][row_index].index(user_choice)
      game[:board][row_index][col_index] = game[:player]
    else
      sleep(1)
      puts ""
      puts "Computron will now select a space."
      `say Compyutron will now select a space.`
      puts "Computron is thinking..."
      `say Compyutron is thinking.`
      sleep(1)

      space_options = game[:board].flatten
      space_options.delete("X")
      space_options.delete("O")
      computron_choice = space_options.sample
      row_index = (computron_choice / 3.0).ceil - 1
      col_index = game[:board][row_index].index(computron_choice)
      game[:board][row_index][col_index] = game[:player]
    end

    game[:winner] = game[:player] if game[:board][0][0] == game[:board][0][1] && game[:board][0][0] == game[:board][0][2]
    game[:winner] = game[:player] if game[:board][1][0] == game[:board][1][1] && game[:board][1][0] == game[:board][1][2]
    game[:winner] = game[:player] if game[:board][2][0] == game[:board][2][1] && game[:board][2][0] == game[:board][2][2]
    game[:winner] = game[:player] if game[:board][0][0] == game[:board][1][0] && game[:board][0][0] == game[:board][2][0]
    game[:winner] = game[:player] if game[:board][0][1] == game[:board][1][1] && game[:board][0][1] == game[:board][2][1]
    game[:winner] = game[:player] if game[:board][0][2] == game[:board][1][2] && game[:board][0][2] == game[:board][2][2]
    game[:winner] = game[:player] if game[:board][0][0] == game[:board][1][1] && game[:board][0][0] == game[:board][2][2]
    game[:winner] = game[:player] if game[:board][0][2] == game[:board][1][1] && game[:board][0][2] == game[:board][2][0]

    if game[:winner]
      show_board(game[:board])

      if game[:winner] == "O"
        puts "The game is over! You have lost. Computron wins all."
        `say The game is over! You have lost. Compyutron wins all.`
      elsif game[:winner] == "X"
        puts "The game is over! You have won. Computron has been vanquished."
        `say The game is over! You have won. Compyutron has been vanquished.`
      end

      break
    elsif game[:player] == "X"
      game[:player] = "O"
    elsif game[:player] == "O"
      game[:player] = "X"
    end
  end

  if !game[:winner]
    show_board(game[:board])
    puts "The game is over! It's a tie."
    `say The game is over! Its a tie.`
  end
end

# tic_tac_toe
tic_tac_toe_with_computron
