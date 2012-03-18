class IncidentStatus
  include DataMapper::Resource

  property :id, Serial
  property :incident_state, String


end
