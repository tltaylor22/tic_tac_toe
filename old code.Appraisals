# MINMAX USING GAME AND DEPTH TO CALCULATE A WIN USING POINTS SYSTEM AND TO KEEP THE GAME GOING TO THE END (DEPTH).

def score(game, depth)
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