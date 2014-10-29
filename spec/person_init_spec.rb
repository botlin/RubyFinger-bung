require "rspec"
require "./lib/person.rb"

describe "Person initialization" do

  it "should initialize it's attributes from a hash" do
    attribute_hash =   {:name => "Dagobert", :hobbies => "Money"}
    p = Person.new(attribute_hash)
    expect(p.name).to eq "Dagobert"
    expect(p.hobbies).to eq ["Money"]
  end

  it "should raise an UnknownAttributeError if an attribute is unknown" do
    argument_hash =   {:name => "Dagobert", :hobbies => "Money",:nonexistent_attribute => "some Value"}
    expect { p = Person.new(argument_hash) }.to raise_error(UnknownAttributeError)
  end

  it "should still be initializable without any parameters" do
    p = Person.new
  end

  it "should work with an existent arbitrary attribute of Person" do
    random_attribute_name = (0...5).map { (97 + rand(26)).chr }.join
    RFN = random_attribute_name.to_sym
    class Person
      attr_accessor RFN
    end
    random_attribute_value = "The Value of the Random attribute"
    argument_hash =   {:name => "Dagobert", :hobbies => "Money",random_attribute_name.to_sym => random_attribute_value}
    p = Person.new(argument_hash)
    expect(p.send(random_attribute_name)).to eq random_attribute_value
  end

end
