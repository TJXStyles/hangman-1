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
	    begin
	      @game.guess(letter)
	  	rescue Exception => e
	  	  puts e.message
	    end

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