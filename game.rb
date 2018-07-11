require_relative "./board"
require_relative "./player"
require_relative "./computer"
require "colorize"

 
class Game
  def initialize
    #display welcome message and call game_setup method
    system "clear"

    puts "=".colorize(:white) * 60
    puts "WELCOME TO LARA'S TIC TAC TOE GAME!".center(60).colorize(:color => :light_blue, :background => :white)
    puts "=".colorize(:white) * 60
  end

  def game_setup
    puts "\n\nPlease choose the number of players:\n \n (0) Computer vs. Computer\n (1) Human vs. Computer\n (2) Human vs. Human\n".colorize(:white)
    
    @game_play = gets.chomp

    if @game_play == "0"
      system "clear"
      
      puts "\n\n\nYou've chosen to watch a game between two computers!!\n".colorize(:blue)
      sleep 1
      
      valid_input = false
      until valid_input == true 
        print "Please choose a marker symbol for Optimus Prime. ".colorize(:white)
        optimus_marker_symbol = gets.chomp
          if optimus_marker_symbol.length == 1
            if optimus_marker_symbol.include? " " 
              puts "\nOops! Your marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3 
              system "clear"
            else 
              valid_input = true
              puts "\nGreat Choice!".colorize(:white)
              sleep 3
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3 
            system "clear"
          end
      end
      
      valid_input = false
        until valid_input == true 
        print "\n\nNow please choose a marker symbol for DJ Roomba. ".colorize(:white)
        dj_marker_symbol = gets.chomp
          if dj_marker_symbol.length == 1
            if !dj_marker_symbol.include? " "
              if dj_marker_symbol != optimus_marker_symbol
                puts "\nExcellent Choice!".colorize(:white)
                valid_input = true
                sleep 1
              else
                puts "\nOops! That marker has already been chosen for Optimus Prime! Please choose again.\n".colorize(:red)
                sleep 3
                system "clear"
              end
            else
              puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3
              system "clear"
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3
            system "clear"
          end
        end

      @computer = Computer.new("Optimus Prime", optimus_marker_symbol.to_sym)
      @player_1 = Computer.new("DJ Roomba", dj_marker_symbol.to_sym)
      
      puts "\nEnjoy watching the game between #{@computer.name}(#{@computer.marker}) and their opponent, #{@player_1.name}(#{@player_1.marker})!".colorize(:white)
      @current_player = @player_1
      sleep 4

    elsif @game_play == "1"
      system "clear"
      
      puts "\n\n\nYou've chosen to play against the Erwin Computer!\n".colorize(:blue)

      valid_input = false
      until valid_input == true 
        print "Player 1, please enter your name.  ".colorize(:white)
        player_1_name = gets.chomp
          if player_1_name.length > 1
            if player_1_name.include? " " 
              puts "\nOops! Your name cannot contain any spaces. Try again! \n".colorize(:red)
            else 
              valid_input = true
              sleep 1
            end
          else
            puts "\nOops! Your name must be more than one character. Try again! \n".colorize(:red)
          end
      end
      
      system "clear"

      valid_input = false
      until valid_input == true 
        print "\n\n\n#{player_1_name}, enter your desired marker symbol.  ".colorize(:white)
        player_1_marker_symbol = gets.chomp
          if player_1_marker_symbol.length == 1
            if player_1_marker_symbol.include? " " 
              puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 2 
              system "clear"
            else 
              valid_input = true
              puts "\nGreat Choice!".colorize(:white)
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 2
            system "clear"
          end
      end

      valid_input = false
      until valid_input == true 
        print "\n#{player_1_name}, please choose the marker symbol for Erwin the Computer.  ".colorize(:white)
        computer_marker_symbol = gets.chomp
          if computer_marker_symbol.length == 1
            if !computer_marker_symbol.include? " "
              if computer_marker_symbol != player_1_marker_symbol
                puts "\nExcellent Choice!".colorize(:white)
                valid_input = true
              else
                puts "\nOops! That marker has already been chosen for #{player_1_name}! Please choose again.\n".colorize(:red)
                sleep 3
                system "clear"
              end
            else
              puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3
              system "clear"
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3
            system "clear"
          end
      end

      sleep 1

      @computer = Computer.new("Erwin", computer_marker_symbol.to_sym)
      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)
      @board = Board.new
      @game_over = false
      @current_player = @player_1
      system "clear"
      
      puts "\n\n#{@player_1.name} and #{@computer.name}, who wants to go first?  \n\n Select 1 for #{@player_1.name}\n Select 2 for #{@computer.name}".colorize(:white)

      first_player = gets.chomp.to_i

        if first_player == 1
          @current_player = @player_1
        elsif 
          first_player == 2
          @current_player = @computer
        end 

      sleep 1
      
    elsif @game_play == "2"
      system "clear"
      
      puts "\n\n\nYou've chosen a (2) player game!\n".colorize(:blue)

      valid_input = false
      until valid_input == true 
        print "Player 1, please enter your name.  ".colorize(:white)
        player_1_name = gets.chomp
          if player_1_name.length > 1
            if player_1_name.include? " " 
              puts "\nOops! Your name cannot contain any spaces. Try again! \n".colorize(:red)
            else 
              valid_input = true
              sleep 1
              system "clear"
            end
          else
            puts "\nOops! Your name must be more than one character. Try again! \n".colorize(:red)
          end
      end

      valid_input = false
      until valid_input == true 
       print "#{player_1_name}, enter your desired marker symbol.  ".colorize(:white)
        player_1_marker_symbol = gets.chomp
          if player_1_marker_symbol.length == 1
            if player_1_marker_symbol.include? " " 
              puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3 
              system "clear"
            else 
              valid_input = true
              puts "\nGreat Choice!".colorize(:white)
              sleep 3
              system "clear"
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3 
            system "clear"
          end
      end

      valid_input = false
      until valid_input == true 
        print "\nPlayer 2, please enter your name.  ".colorize(:white)
        player_2_name = gets.chomp
          if player_2_name.length > 1
            if player_2_name.include? " " 
              puts "\nOops! Your name cannot contain any spaces. Try again! \n".colorize(:red)
            else 
              valid_input = true
              sleep 1
              system "clear"
            end
          else
            puts "\nOops! Your name must be more than one character. Try again! \n".colorize(:red)
          end
      end

      valid_input = false
      until valid_input == true 
        print "\n#{player_2_name}, please choose your desired marker symbol .  ".colorize(:white)
        player_2_marker_symbol = gets.chomp
          if player_2_marker_symbol.length == 1
            if !player_2_marker_symbol.include? " "
              if player_2_marker_symbol != player_1_marker_symbol
                puts "\nExcellent Choice!".colorize(:white)
                valid_input = true
                sleep 1
              else
                puts "\nOops! That marker has already been chosen for #{player_1_name}! Please choose again.\n".colorize(:red)
                sleep 3
                system "clear"
              end
            else
              puts "\nOops! A marker symbol cannot contain any spaces. Try again! \n".colorize(:red)
              sleep 3
              system "clear"
            end
          else
            puts "\nOops! A marker symbol must be a single character. Please choose again. \n".colorize(:red)
            sleep 3
            system "clear"
          end
      end

      @player_1 = Player.new(player_1_name, player_1_marker_symbol.to_sym)
      @player_2 = Player.new(player_2_name, player_2_marker_symbol.to_sym)
      

      valid_input = false
      until valid_input == true 
        puts "\n\n#{@player_1.name} and #{@player_2.name}, who wants to go first?  \n\n Select 1 for #{@player_1.name}\n Select 2 for #{@player_2.name}".colorize(:white)
        first_player = gets.chomp
          if first_player.length == 1
            if first_player.include? "1" || "2"
              if !first_player.include? " "
                if first_player == "1"
                    @current_player = @player_1
                    valid_input = true
                    puts "#{player_1_name}, You will go first! ".colorize(:white)
                    sleep 2 
                else 
                   first_player == "2"
                   @current_player = @player_2
                   valid_input = true
                   puts "#{player_2_name}, You will go first! ".colorize(:white)
                   sleep 2
                end
              else
                puts "\nOops! No spaces allowed. Please choose again.\n".colorize(:red)
                sleep 3
                system "clear"
              end
            else
              puts "Oops! Only numbers 1 or 2 allowed. Try again.".colorize(:red) 
              sleep 3
              system "clear"
            end
          else
            puts "\nOops! Choose one number only. Please choose again. \n".colorize(:red)
            sleep 3
            system "clear"
          end
        end
      end

      system "clear"
      
      puts "******  Let the game begin!  *****\n\n" .center(50).colorize(:blue)
  end 


  def start_game 
    @board = Board.new
    until @game_over
      good_cell_choice = false

      until good_cell_choice
        @board.render
        if @game_play.to_i == 0
          cell = @computer.computer_war_games_choice(@board.board, @player_1.marker) 
        elsif @current_player != @computer
          cell = @current_player.get_cell_choice
          # system "clear" 
        else
          cell = @computer.computer_cell_choice(@board.board, @player_1.marker, @computer.marker)
          # system "clear" 
        end

        if @board.within_valid_cell?(cell) && @board.cell_available?(cell)
           good_cell_choice = true
        end 
      end
        puts 
        puts 
        @board.add_marker(cell, @current_player.marker)
        puts "=".colorize(:white) * 50 
        puts "U P D A T E D  B O A R D".center(50).colorize(:green)
        puts "#{@current_player.name} chose ##{cell}".center(50).colorize(:blue)
        puts "=".colorize(:white) * 50 
        puts  
        puts
        @board.render
        puts 
        puts 
        if check_game_over
          break
        end 
        puts
        puts "Press ENTER to continue".center(50).colorize(:green)
        gets
        system "clear"
        switch_players(@game_play) 
        puts 
        puts "=".colorize(:white) * 50
        puts "#{@current_player.name}, your turn!".center(50).colorize(:blue)
        puts "=".colorize(:white) * 50
        puts
      end
  end


  def check_game_over
    if check_victory(@board) || check_draw(@board)
      puts
      play_again(@game_play)
    end 
  end

  def check_victory(current_board)
    if current_board.winning_combination? == true
      puts "=".colorize(:white) * 50 
      puts "Congratulations #{@current_player.name}, you win!".center(50).colorize(:color => :light_blue, :background => :white).blink
      puts "G A M E  O V E R".center(50).colorize(:color => :light_blue, :background => :white)
      puts "=".colorize(:white) * 50 
      @game_over = true
    else
      false
    end
  end

  def check_draw(current_board)
    if current_board.full?
      puts "=".colorize(:white) * 50 
      puts "Game ends with a tie!".center(50).colorize(:color => :light_blue, :background => :white).blink
      puts "G A M E  O V E R".center(50).colorize(:color => :light_blue, :background => :white)
      puts "=".colorize(:white) * 50 
      @game_over = true
      true
    else
        false
    end
  end

  def switch_players(game_play)
    if game_play.to_i == 2
      if @current_player == @player_1
        @current_player = @player_2
      else
        @current_player = @player_1
      end
    else game_play.to_i == 1 || 0
      if @current_player == @player_1
        @current_player = @computer
      else
        @current_player = @player_1
      end
    end 
  end

  def play_again(game_play)
    valid_response = false 
    until valid_response 
      if game_play.to_i == 0
        print "Would you like to watch another game?  Y/N:   ".center(50).colorize(:white)
        response = gets.chomp
      elsif game_play.to_i == 1
        print "Would you like to play Erwin again?  Y/N:   ".center(50).colorize(:white)
        response = gets.chomp
      else game_play.to_i == 2
        print "#{@player_1.name} & #{@player_2.name}, would you like to play again?  Y/N:   ".center(50).colorize(:white)
        response = gets.chomp
      end

      if response.downcase == "y"
        system "clear" 
        @game_over = false
        switch_players(@game_play)
        puts "=".colorize(:white) * 50 
        puts "N E W  G A M E".center(50).colorize(:blue)
        puts "=".colorize(:white) * 50 
        puts
        start_game
        valid_response
      elsif response.downcase == "n"
        @game_over = true
        system "clear"
        puts "=".colorize(:white) * 50 
        puts "=".colorize(:white) * 50 
        puts " ".colorize(:white) * 50 
        puts " ".colorize(:white) * 50
        puts "Thanks for playing!\n".center(50).colorize(:blue)
        puts "See you next time for another rousing game of".center(50).colorize(:color => :light_blue, :background => :white)
        puts "TIC TAC TOE!".center(50).colorize(:color => :light_blue, :background => :white)
        puts " ".colorize(:white) * 50 
        puts " ".colorize(:white) * 50
        puts "=".colorize(:white) * 50 
        puts "=".colorize(:white) * 50 
        exit
        valid_response
      else 
        puts "\nOops! Invalid response. Please choose again.\n".center(50).colorize(:red)
        valid_response = false 
      end
    end 
  end 

end

game = Game.new
game.game_setup
game.start_game
