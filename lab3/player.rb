# this file will hold the players information
# more specifically, how the players play

# will need the information from these files
require_relative "element"
require_relative "history"

class Player
    # declares the instance variables and create a getter --> dont need a setter
    attr_reader :name, :history

    # creating constructor
    def initialize(name, history)
        @name = name
        @history = history
    end

    # creating method play --> throw exception
    def play
        fail "This method should be overridden"
    end
end

# creating subclasses

# creating stupid bot subclass --> always picks rock
class StupidBot < Player
    def play
        # setting move to a instance of rock
        move = Rock.new('Rock')   
        @history.log_play(move) # logging the players move of rock
        return move             # returning the instance
    end
end

# creating random bot subclass --> randomly picks move
# oh shoot --> add in the history LOG
class RandomBot < Player
    def play
        # creating random 
        randomizer = Random.new
        player_move = randomizer.rand(1..5)

        # all of the objects
        rock = Rock.new('Rock')
        paper = Paper.new('Paper')
        scissors = Scissors.new('Scissors')
        lizard =  Lizard.new('Lizard')
        spock = Spock.new('Spock')

        # switch case which will create object from randomizer
        case player_move
        # case 1 = rock
        when 1
            return rock
        # case 2 = paper
        when 2
            return paper
        # case 3 = scissors
        when 3
            return scissors
        # case 4 = lizard
        when 4
            return lizard
        else
        # or else it is spock
            return spock
        end
    end
end

# subclass iterative bot
class IterativeBot < Player
    # constant array --> instances of all possible moves
    ARR = [Rock.new('Rock'), Paper.new('Paper'), Scissors.new('Scissors'), Lizard.new('Lizard'), Spock.new('Spock')]

    # constructor --> using parent
    def initialize(name, history)
        # gets parents values
        super
        @current_index = 0
    end
    # will go through all 5 possible moves --> in order
    def play
        # move is the current index of the array above
        move = ARR[@current_index]
        # will add to history
        @history.log_play(move)
        # moving the index up to get the next instance in array
        @current_index = (@current_index + 1) % ARR.length
        move
    end
end

# subclass last play bot --> i think somethig is wrong here or in driver file
class LastPlayBot < Player
    def play
      # if player doesnt have prev move, will set to rock
        if @history.opponent_plays.empty?
            move = Rock.new("Rock")
        else
        # return the opponent last move
            move = @history.opponent_plays.last
        end
        # add that move
        @history.log_play(move)
        move
    end
    
    # keep messing with this --> not sure if fixing or just need to redo function
    def log_opponent_play(move)
        # gets parents 
        super
        @last_opponent_move = move
    end
end
  
# subclass for human player
class Human < Player
    # array with all the moves a human could pick
    ARR = [Rock.new('Rock'), Paper.new('Paper'), Scissors.new('Scissors'), Lizard.new('Lizard'), Spock.new('Spock')]

    def play
        # prints out the options to the player --> copy and pasted from canvas
        # puts "(1) Rock "
        # puts "(2) Paper"
        # puts "(3) Scissors"
        # puts "(4) Lizard"
        # puts "(5) Spock "
        print "(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock\n"
        loop do
            # lets user enter in option
            print "Enter your move: "
            choice = gets.chomp.to_i
            # switch case to go through the choices
            case choice
            # when option is 1 to 5
            when 1..5
                # setting move to the array
                move = ARR[choice - 1]
                # log in history
                @history.log_play(move)
                return move
            else
                # if not within bounds --> error msg
                puts "Invalid move - try again"
            end
        end
    end
end



#### TESTING ####
# p1 = StupidBot.new('StupidBot', History.new)
# p2 = LastPlayBot.new('LastPlayBot', History.new)
# p1move = p1.play()
# p2move = p2.play()
# puts p1move.compare_to(p2move)


