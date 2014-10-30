require "./lib/unknownAttributeError.rb"
class Person
  attr_accessor :name
  attr_reader :hobbies  

  def initialize(hashset = {:name => "user", :hobbies => "none"})
	hashset.each do |key, value|		
		 		
		if(respond_to?("#{key}="))		
			if(key.to_s.eql? "hobbies")
				
				@hobbies = hashset[:hobbies].split(',')		
			else
				self.send "#{key}=", value		
			end		
		else
			raise UnknownAttributeError	
		end
	end
  end
  def hobbies=(value)
	@hobbies = value.split(',')
  end
  def commonHobbies(person)
	ret = Array.new
	person.hobbies.each do |hobby|
		if(@hobbies.include? hobby)
			ret.push(hobby)		
		end
	end
        return ret		
  end
  def self.friendslist(persons)
	ret = Array.new	
	i = 0
	j = 1
	while i < persons.length-1
		j=i+1		
		while j < persons.length 
			result = persons[i].commonHobbies(persons[j])
			k=0			
			while k<result.length
								
				if(ret.length==0 || ret[k][0].to_i<result.length)
					ret.insert(k,[result.length] + [result.join(', ')] + [persons[i].name,persons[j].name])
					break;
				end
				k+=1	
			end				
			
			j+=1		
		end		
		i+=1	
	end
	return ret
  end
end
