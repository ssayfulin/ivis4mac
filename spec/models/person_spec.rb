require 'spec_helper'

describe Person do
  pending "add some examples to (or delete) #{__FILE__}"
  it "Basic create" do

    #p = Person.create! (  :first_name => 'MyString', :second_name => "MyString", :patronymic_name => "MyString", :birth_date => Time.now    )
    p = Person.create! (  {:first_name => 'MyString', :last_name => "MyString"})

    p.save
    puts Person.count();

  end



end
