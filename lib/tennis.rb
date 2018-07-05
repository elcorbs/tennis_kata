# frozen_string_literal: true

class Tennis
  def initialize
    @player1score = 'love'
    @player2score = 'love'
    @deuce = false
  end

  def player_scores(player)
    if player == 1
      @player1score = score_updater(@player1score)
    else
      @player2score = score_updater(@player2score)
    end
    deuce_scenario
  end

  def score_updater(playerscore)
    if return_to_deuce?(playerscore)
      @player1score, @player2score = '40'
    elsif a_win?(playerscore)
      'win'
    elsif @deuce
      'adv'
    elsif playerscore == '30'
      '40'
    elsif playerscore == '15'
      '30'
    else
      '15'
    end
  end

  def a_win?(playerscore)
    playerscore == 'adv' || (playerscore == '40' && !@deuce)
  end

  def return_to_deuce?(playerscore)
    (@player1score == 'adv' || @player2score == 'adv') && playerscore == '40'
  end

  def deuce_scenario
    return @deuce = true if @player1score == '40' && @player2score == '40'
  end

  def there_winner?
    if @player1score == 'win'
      'Player 1 wins'
    elsif @player2score == 'win'
      'Player 2 wins'
    else
      false
    end
  end

  def there_advantage?
    if @player1score == 'adv'
      'Advantage Player 1'
    elsif @player2score == 'adv'
      'Advantage Player 2'
    else
      'Deuce'
    end
  end

  def current_score
    if there_winner?
      there_winner?
    elsif @deuce
      there_advantage?
    else
      @player1score + '-' + @player2score
    end
  end
end
