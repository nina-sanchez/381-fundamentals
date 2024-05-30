# element file
# holds element class, and elements vs elements 

# creating elements class
class Element
    attr_accessor :name # instance variable, both getter + setter

    # constructor --> name parameter + saves to instance variable above
    def initialize(name)
        @name = name
    end

    # abstract --> as undefined
    def compare_to(element)
        fail "This method should be overridden"
    end
end


# creating 5 subclasses: rock, paper, scissors, lizard, spock
# subclass rock --> inheretes from Element superclass
class Rock < Element
    def compare_to(element) # compare argument against its own name
        if element.name == "Rock"                   # comparing vs rock
            return "Rock equals Rock", "Tie"        
        elsif element.name == "Paper"               # comparing vs paper
            return "Paper covers Rock", "Lose"
        elsif element.name == "Scissors"            # comparing vs scissors
            return "Rock crushes Scissors", "Win"
        elsif element.name == "Lizard"              # comparing vs lizard
            return "Rock crushes Lizard", "Win"
        else                                        # comparing vs spock, left as else because we will only encounter these elements
            return "Spock vaporizes Rock", "Lose"
        end
    end
end

# subclass paper --> inherets from Element superclass
class Paper < Element
    def compare_to(element) # compare argument against its own name
        if element.name == "Rock"                   # comparing vs rock
            return "Paper covers Rock", "Win"
        elsif element.name == "Paper"               # comparing vs paper
            return "Paper equals Paper", "Tie"
        elsif element.name == "Scissors"            # comparing vs scissors
            return "Scissors cut Paper", "Lose"
        elsif element.name == "Lizard"              # comparing vs lizard
            return "Lizard eats Paper", "Lose"
        else
            return "Paper disproves Spock", "Win"   # comparing vs spock
        end
    end
end

# subclass scissors
class Scissors < Element
    def compare_to(element) # compare argument against its own name
        if element.name == "Rock"                       # comparing vs rock
            return "Rock crushes Scissors", "Lose"
        elsif element.name == "Paper"                   # comparing vs paper
            return "Scissors cut Paper", "Win"
        elsif element.name == "Scissors"                # comparing vs scissors
            # was failing here --> forgot the s at end of "equals"
            return "Scissors equals Scissors", "Tie"
        elsif element.name == "Lizard"                  # comparing vs lizard
            return "Scissors decapitate Lizard", "Win"
        else
            return "Spock smashes Scissors", "Lose"     # comparing vs spock
        end
    end
end

# subclass lizard
class Lizard < Element
    def compare_to(element) # compare argument against its own name
        if element.name == "Rock"                       # comparing vs rock
            return "Rock crushes Lizard", "Lose"
        elsif element.name == "Paper"                   # comparing vs paper
            return "Lizard eats Paper", "Win"
        elsif element.name == "Scissors"                # comparing vs scissors
            return "Scissors decapitate Lizard", "Lose"
        elsif element.name == "Lizard"                  # comparing vs lizard
            return "Lizard equals Lizard", "Tie"
        else
            return "Lizard poisons Spocks", "Win"     # comparing vs spock
        end
    end
end

# subclass spock
class Spock < Element
    def compare_to(element) # compare argument against its own name
        if element.name == "Rock"                       # comparing vs rock
            return "Spock vaporizes Rock", "Win"
        elsif element.name == "Paper"                   # comparing vs paper
            return "Paper disproves Spock", "Lose"
        elsif element.name == "Scissors"                # comparing vs scissors
            return "Spock smashes Scissors", "Win"
        elsif element.name == "Lizard"                  # comparing vs lizard
            return "Lizard poisons Spock", "Lose"
        else
            return "Spock equals Spocks", "Tie"         # comparing vs spock
        end
    end
end


#### TESTING ####
# rock  = Rock.new('Rock')
# paper = Paper.new('Paper')
# puts rock.compare_to(paper)
# puts paper.compare_to(rock)
# puts rock.compare_to(rock)