class Node
  attr_reader   :value, :next
  attr_accessor :word
 
	def initialize(value)
		@value = value
 
		@word  = false
		@next  = []
	end
end

class Tree
  def initialize
    @root = Node.new("*")
  end
  
  def add_word(word)
    letters = word.chars
    base    = @root
    letters.each { |letter| base = add_character(letter, base.next) }
   
    base.word = true
  end
   
  def find_word(word)
    letters = word.chars
    base    = @root
   
    word_found =
    letters.all? { |letter| base = find_character(letter, base.next) }
   
    yield word_found, base if block_given?
   
    base
  end
  
  
end
	