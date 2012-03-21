class Person
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String, :required => true
  property :last_name,  String, :required => true

  property :second_name, String
  property :patronymic_name, String
  property :birthday, Date
  #
  has n, :signs, :through => Resource


end

class Sign
  include DataMapper::Resource
  property :id, Serial
  belongs_to :sign_value,  :required => true
  belongs_to :sign_type,  :required => true


  has n, :persons, :through => Resource

end

