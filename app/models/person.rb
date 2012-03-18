class Person
  include DataMapper::Resource
  property :id, Serial
  property :first_name, String, :required => true
  property :last_name,  String, :required => true

  property :second_name, String
  property :patronymic_name, String
  property :birth_date, Date

  has n, :person_signs
  has n, :sign_values, :through => :person_signs
  has n, :sign_types, :through => :person_signs

end

class PersonSign
  include DataMapper::Resource

  belongs_to :person,   :key => true
  belongs_to :sign_value, :key => true
  belongs_to :sign_type, :key => true



end

