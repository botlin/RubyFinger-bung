require "unknownAttributeError.rb"
class Person
  attr_accessor :name, :hobbies

  def initialize(hashset = {:name => "user", :hobbies => "none"})
	hashset.each do |key, value|
		if !(key.to_s.eql? "name") && !(key.to_s.eql? "hobbies")
			puts "#{key} : #{value}"			
			raise UnknownAttributeError			
		end	
	end
	@name = hashset[:name]
	@hobbies = [hashset[:hobbies]]
  end
end
