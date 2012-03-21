require 'spec_helper'

describe Incident do


  def valid_attributes

    {
        :incident_registration_date => "2002-03-11",
        :incident_description => {:value => "f"},
        :incident_extra_information => {:value => "f"},
        #
        :person_coordinator => {
                                :first_name => "MyString",    :second_name => "MyString",
                                :patronymic_name => "MyString",
                                :birth_date => "2012-03-11"}

        #:person_registered_by =>{:first}   ,
        #:police_statement => {}      ,


    }
  end



  pending "add some examples to (or delete) #{__FILE__}"


  it "Basic create" do


    puts Incident.count();



    #p = Person.create! (  :first_name => 'MyString', :second_name => "MyString", :patronymic_name => "MyString", :birth_date => Time.now    )
    p = Person.create! (  {:first_name => 'MyString', :last_name => "MyString"})

    p.save


    i = Incident.new(  :incident_registration_date => "2002-03-11" )

    i.incident_description = RichText.new(:value =>"")
    i.incident_extra_information = RichText.new(:value =>"")
    i.police_statement = PoliceStatement.new()
    i.incident_type = IncidentType.new();

    i.person_coordinator  =     p
    i.person_registered_by= p


    puts i.attributes


    i2 = Incident.new(
    {:incident_registration_date=>"2002-03-11", :incident_type_id=>nil, :incident_description_id=>nil, :incident_extra_information_id=>nil, :person_coordinator_id=>1, :person_registered_by_id=>1, :police_statement_id=>nil}
    )

    puts i2.save





    #
    #
    puts i.save




    Incident.all.each do |e|
      puts "ffffffff"
      puts i.incident_description.value

    end




  end

end
