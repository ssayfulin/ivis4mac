class Incident

  include DataMapper::Resource
  property :id, Serial

  belongs_to :incident_type, :model => IncidentType    , :required => false
  property :incident_date, DateTime   , :required => false

  property :incident_registration_date, DateTime , :required => false

  belongs_to :incident_description, :model => RichText     , :required => false
  belongs_to :incident_extra_information, :model => RichText     , :required => false
  #
  belongs_to :person_coordinator, :model => Person  , :required => false
  belongs_to :person_registered_by, :model=> Person            , :required => false
  belongs_to :police_statement, :model=> PoliceStatement     , :required => false


  has n, :persons, :through => Resource
  has n, :incident_maps,   :through => Resource


end


