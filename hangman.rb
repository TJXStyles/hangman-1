class Hangman
	LIST = ["canada", "england", "australia", "japan"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

  def initialize()
    @chances = 8
    @guesses = []
    @word    = LIST.sample
    @board   = draw_board(@word)
  end
  
  # return @guesses as a string
  def guesses
  	@guesses.join(' ')
  end
  
  def draw_board(word)
    "_" * @word.length
  end

  def word_has?(letter)
  	@word.include? letter
  end

  def put_letter_on_board(letter)
  	for i in (0..@word.length)
      @board[i] = letter if @word[i] == letter 
    end
  end

  def wrong_letter(letter)
  	@chances -= 1
    @guesses << letter
  end

  def valid_guess?(letter)
    letter.length == 1
  end
  
  def guess(letter)
   raise "Invalid Guess!" unless valid_guess?(letter)
   
    if word_has?(letter)
    	put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  def win?
    !@board.include? '_'
  end

  def lost?
     @chances == 0   
  end
  
end