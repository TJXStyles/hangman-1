class Hangman
  # LIST = ["canada"]
  attr_accessor :word, :chances, :board, :list, :guesses, :answer

  def initialize()
    @chances = 8
    @guesses = []
    @word    = "canada"
    @board   = draw_board(@word)
  end
  
  # return @guesses as a string
  def guesses
    @guesses
  end

  
  def draw_board(word)
    @board = '_' * @word.length
  end

  # return true if word has letter
  def word_has?(letter)
    return true if @word.include? letter
    # put_letter_on_board(letter)
  end

  # replace indexes of @board with letter where the same indexes of @word are letter
  # in other words, if @board is _ _ _ _ _ _ and @word is canada
  # and the letter guessed is a
  # then @board should become _ a _ a _ a
  def put_letter_on_board(letter)
    @word.split('').each_with_index do |element, index|
      if letter == element
        @board[index] = letter
      end
    end
  end

  # decrement # of chances and add letter to guesses
  def wrong_letter(letter)
    @chances = @chances - 1
    @guesses << letter
  end
  
  # if the word has the given letter, put it on the board, otherwise, it's a wrong guess
  def guess(letter)
    if word_has?(letter)
      put_letter_on_board(letter)
    else
      wrong_letter(letter) if !@guesses.include? letter
    end
  end

  # return true if @board doesn't have a '_', otherwise return false
  def win?
    !@board.include? '_'
  end

  # return true if @chances is 0, otherwise return false
  def lost? 
    until @chances > 0 
      return true
    end
  end 
end