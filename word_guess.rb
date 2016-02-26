class WordGuess
  def initialize
    # possible words, selected at random
    @words = {
      "e" => %w(dog cat bug hat cap lit kin fan fin fun tan ten tin ton),
      "m" => %w(plain claim brine crime alive bride skine drive slime stein jumpy),
      "h" => %w(
          machiavellian prestidigitation plenipotentiary quattuordecillion
          magnanimous unencumbered bioluminescent circumlocution
        )
    }

    # players attempts allowed by difficulty
    @tries = {
      "e" => 10,
      "m" => 6,
      "h" => 4
    }

    # ask the user to set the game mode
    mode = set_mode

    @word    = @words[mode].sample # chosen word; players try to guess this
    @guesses = @tries[mode] # how many tries the player gets
    @user_word = "•" * @word.length # a "blank word" for user output

    # debugging for now
    puts "Your word is #{ @word }. You have #{ @guesses } guesses."
    puts "Guess the word: #{ @user_word }"

    # start the game
    play_turn
  end

  def play_turn
    # a turn begins by asking a player for their guess
    letter = ask_for_letter

    # update the word with the letter, maybe
    update_user_word!(letter)

    # decrement the available guesses
    @guesses -= 1

    # determine if the player has won or lost

    # debugging
    puts "You guessed #{ letter }. The word is now #{ @user_word }."
    puts "You have #{ @guesses } guesses left."
  end

  def set_mode
    mode = ""
    until %w(e m h).include? mode
      print "\nThis can be (e)asy, (m)edium or really (h)ard. The choice is yours: "
      mode = gets.chomp
    end

    mode
  end

  private
  def update_user_word!(letter)
    @word.chars.each_index do |index|
      @user_word[index] = letter if @word[index] == letter
    end
  end

  def ask_for_letter
    letter = ""
    until ('a'..'z').include? letter
      print "\nPlease guess a letter! (a..z): "
      letter = gets.chomp.downcase
    end

    letter
  end
end

WordGuess.new
