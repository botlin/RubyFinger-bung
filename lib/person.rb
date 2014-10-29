
class Person
  attr_accessor :name, :hobbies

  def initialize(hashset)
	hashset.each do |key,value|	 
		raise UnknownAttributeError, "#{key} is not valid"
	end
	@name = hashset[:name]
	@hobbies = [hashset[:hobbies]]
  end
end
