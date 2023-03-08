require "./players"
require "./question"

class Game
  def initialize
    puts "Player one, enter name! "
    player1_name = $stdin.gets.chomp
    puts "Player two, enter name! "
    player2_name = $stdin.gets.chomp

    @player1 = Players.new(player1_name)
    @player2 = Players.new(player2_name)

    puts "Welcome to Two Player Math #{@player1.name} and #{@player2.name}!"

  end

  def scoreboard
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
    puts "--- NEW TURN ---"
  end

  def end_game
    if(@player1.dead)
      puts "#{@player2.name} wins by #{@player2.lives} lives!"
    else
      puts "#{@player1.name} wins by #{@player1.lives} lives!"
    end

    puts "--- GAME OVER ---"
    puts "See you soon!"
  end

  def switch(current_player)
   if(current_player == @player1)
      current_player = @player2
    else
       current_player = @player1
    end
    return current_player
  end

  def keep_gaming
    (@player1.dead || @player2.dead) == false
  end

  def start
    current_player = @player1
    while (keep_gaming)

      question = Questions.new
      question.ask(current_player)

      scoreboard

      current_player = switch(current_player)
    end

    end_game
  end
  
end