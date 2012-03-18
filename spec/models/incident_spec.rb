require 'spec_helper'

describe Incident do
  pending "add some examples to (or delete) #{__FILE__}"


  it "Basic create" do

    d = RichText.new(:value=>"Some Description")
    d.save

    puts RichText.count();

    i = Incident.new(:incident_description=>d)
    i.save


    puts Incident.count();

    Incident.all.each do |e|
      puts "ffffffff"
      puts i.incident_description.value

    end




  end

end
