# this file will contain the history of plays and the score

# creating a History class
class History
    attr_accessor :plays, :opponent_plays, :score

    # creating the constructor, creating arrays and setting score to 0
    def initialize
        @plays = Array.new              # new array for plays
        @opponent_plays = Array.new     # new initialized empty array for opp plays
        @score = 0                      # setting score to 0
    end

    # followed the canvas instructions --> push the move
    def log_play(move)
        @plays.push(move)
    end

    # again followed canvas instructions --> push the opp moved
    def log_opponent_play(move)
        @opponent_plays.push(move)
    end

    # incrememnts score by 1 each time it is called
    def add_score()
        @score += 1
    end
end