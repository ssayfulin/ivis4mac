class Incident

  include DataMapper::Resource
  property :id, Serial

  belongs_to :incident_type, :model => IncidentType
  property :incident_date, DateTime
  property :incident_date, DateTime


  property :incident_registration_date, DateTime
  property :incident_registration_date, DateTime

  belongs_to :incident_description, :model => RichText
  belongs_to :incident_extra_information, :model => RichText

  belongs_to :person_coordinator, :model => Person
  belongs_to :person_registrator, :model=> Person
  belongs_to :police_statement, :model=> PoliceStatement


  has n, :incident_persons
  has n, :persons, :through => :incident_persons


  has n, :incident_maps
  has n, :map_links, :through => :incident_maps

end


