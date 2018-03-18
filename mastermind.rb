class Board
	def initialize(puzzle)
		@puzzle=puzzle
		@quessinstances = []
		@victory = false	
	end

  def oneround(instanssi)
  	quesses = []
  	puts "You have quessed: #{instanssi} It matches as follows: (2=correct color, correct place, 1=correct color,wrong place"
  	for i in 0...instanssi.length
  		if instanssi[i] == @puzzle[i]
  		 quesses.push("2") 
  		 elsif @puzzle.include?(instanssi[i]) then quesses.push("1") 
  		else quesses.push("0")  		  		 	
  		end 		
    end 
    puts quesses.shuffle! 
    checkVictory(instanssi)  
  end

  def checkVictory(instanssi)
  	if instanssi == @puzzle
  		@victory = true
  		puts "You have cracked the code! The correct code was #{instanssi}"
  		exit
    end
  end
 end


class Puzzle
	attr_accessor :puzzle
  def initialize(role)
  	if role == "1"
	@puzzle= []
    randomizepuzzle(@puzzle)
    p @puzzle
   
      elsif role == "2"
    for i in 1..4
    @puzzle = []	
	puts "Select color number #{i} from among #{$colors}"	
	color = gets.chomp			
	@puzzle.push(color)	
	p @puzzle
end
      end    
  
end

def randomizepuzzle(puzzle)
  $colors = ["red", "green", "blue", "orange", "purple", "teal"]  
  4.times do puzzle.push($colors[rand(5)])
    end  
  end
end


$colors = ["red", "green", "blue", "orange", "purple", "teal"] 
class InstanceOfPuzzle
  attr_accessor :quessinstance
  def initialize(role) 
  	
  	if role == "1"
  	@quessinstance = []
	for i in 1..4	
	puts "Select color number #{i} from among #{$colors}"
	color = " "	
	loop do 
	color = gets.chomp	
	 break if validateColor(color) == true
	end		
	@quessinstance.push(color)	
      end    
    
elsif role == "2"
    @quessinstance = []
      4.times do @quessinstance.push($colors[rand(5)])
      end
end
end
  def validateColor(color)
  	if $colors.include?(color)
  		return true
  	else
  		p "Please choose among these: #{$colors}"
  		return false
  	end

  end

end





puts "Do you want to crack or quess? Type 1 if you want to crack and 2 if you want to quess"
role = gets.chomp

  newPuzzle = Puzzle.new(role)
  newGame = Board.new(newPuzzle.puzzle)
  if role == "1"
  puts "Game on! Computer will randomize puzzle..."
  12.times do 
  eka = InstanceOfPuzzle.new(role)
  newGame.oneround(eka.quessinstance)
  end
  puts "You were unable to crack the code!"
 end

puts "Computer will now quess your puzzle"  
  12.times do 
  toka = InstanceOfPuzzle.new(role)
  newGame.oneround(toka.quessinstance)
end

#tarkistus

