class IncidentPerson
  include DataMapper::Resource
  property :id, Serial
  belongs_to :incident, :model =>Incident,   :key => true
  belongs_to :person, :model=> Person, :key => true
end



