
class IncidentMap
  include DataMapper::Resource
  property :id, Serial
#  belongs_to :incident, :model =>Incident,   :key => true
  belongs_to :map_link, :model=> MapLink, :key => true
end
