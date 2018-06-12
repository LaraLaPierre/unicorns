require_relative "./computer"
require_relative "./board"

 
class Player
 attr_accessor :name, :marker

  # initialize
  def initialize(name = "Player_1", marker)
    # Set marker type (e.g. X or O)
    raise "Marker must be a Symbol!" unless marker.is_a?(Symbol)
    @name = name
    @marker = marker
    # @board = board


  end


  # get_cell_choice
  def get_cell_choice
    puts
    print "#{@name}(#{@marker}), choose a cell number between 0 and 8:  ".colorize(:white)
      # pull cell number from command line
    cell = gets.chomp.to_i
    return cell 
    system "clear"

  end


  # validate_cell
  # def validate_cell(cell)
  #     # check cell is within proper integer ran
  #     if (0..8).include?(cell)
  #         true
  #     else
  #         # display error message
  #         # Note that returning `nil` acts falsy!
  #         puts "The choosen cell number must be between 0 and 8."
  #     end
  # end


end 