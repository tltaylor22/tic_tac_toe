# MINMAX USING GAME AND DEPTH TO CALCULATE A WIN USING POINTS SYSTEM AND TO KEEP THE GAME GOING TO THE END (DEPTH).
# @player is the turn taking player
def score(game, depth) # This is the function for scoring the game.
    if game.win?(@player)
        return 10 - depth
    elsif game.win?(@opponent)
        return depth - 10
    else
        return 0
    end
end

def minimax(game, depth)
    return score(game) if game.over?
    depth += 1
    scores = [] # an array of scores
    moves = []  # an array of moves

    # Populate the scores array, recursing as needed
    game.get_available_moves.each do |move|
        possible_game = game.get_new_state(move)
        scores.push minimax(possible_game, depth)
        moves.push move
    end

    # Do the min or the max calculation
    if game.active_turn == @player
        # This is the max calculation
        max_score_index = scores.each_with_index.max[1]
        @choice = moves[max_score_index]
        return scores[max_score_index]
    else
        # This is the min calculation
        min_score_index = scores.each_with_index.min[1]
        @choice = moves[min_score_index]
        return scores[min_score_index]
    end
end

def human_move_to_coordinate(human_move)
  mapping = {
    "1" => [0, 0],
    "2" => [1, 0],
    "3" => [2, 0],
    "4" => [0, 1],
    "5" => [1, 1],
    "6" => [2, 1],
    "7" => [0, 2],
    "8" => [1, 2],
    "9" => [2, 2]
  }
  mapping[human_move]
end