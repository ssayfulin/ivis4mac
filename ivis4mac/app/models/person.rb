class Person

  include DataMapper::Resource

  property :id, Serial

  property :first_name, String
  property :last_name, String
  property :patronymic_name, String
  property :birth_date, Date

end
