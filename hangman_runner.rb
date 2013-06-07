require_relative "hangman"

class HangmanRunner

  def self.run 
    @game = Hangman.new()
    while true
    	puts "\nBoard: #{@game.board}\n\n"
	    puts "Guessed letters: #{@game.guesses}\n\n"
	    puts "Chances: #{@game.chances}\n\n" 
	    print "Take your best shot! Enter guess: "
	    letter = gets.chomp
	    @game.add_to_guesses(letter)

	    if @game.win?
	    	puts "\n\nCongratulations! You won!\n"
	    	puts "The word was #{@game.word}"
	    	break
	    elsif @game.lost?
	    	puts "\n\nYou lost. The word was #{@game.word}\n"	
	    	break
	    end
	    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++\n"
    end
  end
end 

HangmanRunner.run