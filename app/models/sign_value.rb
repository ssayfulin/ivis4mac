class SignValue
  include DataMapper::Resource
  property :id, Serial

  property :sign_value, String
  has n, :person_signs
  has n, :persons, :through => :person_signs
end
