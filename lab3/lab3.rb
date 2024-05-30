require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

# ######################################### 	
# #     CS 381 - Programming Lab #3		#
# #										#
# #  Regina Sanchez					 	#
# #  sanchreg@oregonstate.edu          	#
# #										#
# #########################################


def game(round)
    # welcome board --> copy and pasted from canvas
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!\n\n"
    puts "Please choose two players:\n"
    puts "(1) StupidBot\n(2) RandomBot\n(3) IterativeBot\n(4) LastPlayBot\n(5) Human"

    # initializing my variables --> setting the two players to 0 
    player_one = 0
    player_two = 0

    # initializing a flag to error check the user inputs
    bool = true

    # creating a dictionary of players that can be selected
    available_players = {
        1 => "StupidBot",
        2 => "RandomBot",
        3 => "IterativeBot",
        4 => "LastPlayBot",
        5 => "Human"
    }

    # while loop to error check user input
    # will store the user entered value into the correct variable
    # i think it is fixed now? --> removed the double testing --> only validate once at the end
    while bool
        
        # setting them to empty essentially --> i was getting errors 
        player_one = nil
        player_two = nil
        
        # get the player 1 choice
        print "Select player 1: "
        player_one = gets.chomp.to_i
        
        # gets the player 2 choice
        print "Select player 2: "
        player_two = gets.chomp.to_i
        
        # here is the validating, if either one is not in range
        unless available_players.key?(player_one) && available_players.key?(player_two)
            # output error message --> had the wrong error message so was failing GS tests
            # had this set to human player error msg
            puts "Invalid choice(s) - start over\n\n"
            next
        end
        # sets bool to false
        bool = false
    end

    # printing player one vs. player 2
    print_one = [available_players[player_one]] # getting the element wanted
    print_two = [available_players[player_two]]
    puts "#{print_one[0]} vs. #{print_two[0]}\n\n" # printing them this way to remove unnecessary brackets + quotes

    # now setting the user entered values to the objects that they wanted
    # starting with player 1
    case player_one
    when 1
        first_player = StupidBot.new("StupidBot", History.new)
    when 2
        first_player = RandomBot.new("RandomBot", History.new)
    when 3
        first_player = IterativeBot.new("IterativeBot", History.new)
    when 4
        first_player = LastPlayBot.new("LastPlayBot", History.new)
    when 5
        first_player = Human.new("Human", History.new)
    end

    # now setting player two
    case player_two
    when 1
        second_player = StupidBot.new("StupidBot", History.new)
    when 2
        second_player = RandomBot.new("RandomBot", History.new)
    when 3
        second_player = IterativeBot.new("IterativeBot", History.new)
    when 4
        second_player = LastPlayBot.new("LastPlayBot", History.new)
    when 5
        second_player = Human.new("Human", History.new)
    end

    # set i to 1 because then starts round 1... instead of starting at round 0
    i = 1
    # 6 rounds to account for starting at i = 1, will only be 5 rounds
    rounds = 6
    # loop, while i is less than 5 rounds that have been played
    while (i < rounds)
        # prints the round # 
        puts "Round " + i.to_s + ":"
        # adds 1 after each round
        i += 1

        # storing the players moves
        player_one_move = first_player.play()
        player_two_move = second_player.play()

        # dealing with player historrrieeesss 
        player_one_history = first_player.instance_variable_get(:@history)
        player_two_history = second_player.instance_variable_get(:@history)

        # logging the opps moves, have to make player 1 take player twos move --> vice versa
        # if not, then the last play bot doesnt work properly bc it takes its own move repeadetly --> learned the hard way 
        player_one_history.log_opponent_play(player_two_move)
        player_two_history.log_opponent_play(player_one_move)

        # prints what the players moves name is
        p1_move = player_one_move.name
        p2_move = player_two_move.name
        puts "Player 1 chose " + p1_move
        puts "Player 2 chose " + p2_move

        # prints out each round what player won it, or if they tied
        round_winner, round_result = player_one_move.compare_to(player_two_move)
        # prints round winner!
        puts round_winner
        # switches through the different outcomes
        case round_result
        when "Win"
            # if player one wins then it gets added to their history
            first_player.instance_variable_get(:@history).add_score
            puts "Player 1 won the round\n\n"
        when "Lose"
            # if player two wins, then score gets added to their score
            second_player.instance_variable_get(:@history).add_score
            puts "Player 2 won the round\n\n"
        else
            # if tie then no adding score is needed
            puts "Round was a tie\n\n"
        end

    end
    # gets the final score
    # gets the first players score
    final_one = first_player.history.score
    # gets the second players score
    final_two = second_player.history.score
    # prints the final score
    puts "Final score is " + final_one.to_s + " to " + final_two.to_s # to s means converting to string
    # if tie
    if final_one == final_two
        puts "Game was a draw"
    # if p 1 wins
    elsif final_one > final_two
        puts "Player 1 wins"
    # else p 2 wins
    else 
        puts "Player 2 wins"
    end
end

# given code from skeleton code
# Main Program (should be last)
n_rounds = 5
# call to kick off the game
game(n_rounds)
