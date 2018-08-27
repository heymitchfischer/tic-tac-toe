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
    sleep(1)
    puts "The Board:"
    puts "#{game[:board][0][0]} | #{game[:board][0][1]} | #{game[:board][0][2]}"
    puts "---------"
    puts "#{game[:board][1][0]} | #{game[:board][1][1]} | #{game[:board][1][2]}"
    puts "---------"
    puts "#{game[:board][2][0]} | #{game[:board][2][1]} | #{game[:board][2][2]}"

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
      puts "The game is over! #{game[:player]} has won."
      break
    elsif game[:player] == "X"
      game[:player] = "O"
    elsif game[:player] == "O"
      game[:player] = "X"
    end
  end

  if !game[:winner]
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
    sleep(1)
    puts "The Board:"
    puts "#{game[:board][0][0]} | #{game[:board][0][1]} | #{game[:board][0][2]}"
    puts "---------"
    puts "#{game[:board][1][0]} | #{game[:board][1][1]} | #{game[:board][1][2]}"
    puts "---------"
    puts "#{game[:board][2][0]} | #{game[:board][2][1]} | #{game[:board][2][2]}"

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
    puts "The game is over! It's a tie."
    `say The game is over! Its a tie.`
  end
end

# tic_tac_toe
tic_tac_toe_with_computron
