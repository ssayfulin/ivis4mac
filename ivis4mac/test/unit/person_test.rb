require File.expand_path("../../test_helper", __FILE__)

class PersonTest < ActiveSupport::TestCase
  test "person create" do


  # DataMapper::Logger.new(STDOUT, :debug)


  #p = Person.create(:first_name =>"Ivan22", :last_name=>"Ivanov", :birth_date=>DateTime.now)
  #p.save()




  Person.all.each do |p|
    puts "#{p.first_name} #{p.last_name} #{p.id}  "
  end

  assert true


  end
end
