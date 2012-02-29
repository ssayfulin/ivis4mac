require 'rubygems'
require 'data_mapper' # requires all the gems listed above


class Person

  include DataMapper::Resource
  property :id, Serial
  property :first_name,	String
  property :last_name,  String
  property :second_name, String
  property :patronymic_name, String
  property :birth_date, Date

  has n, :person_signs
  has n, :signs, :through => :person_signs
end


class Sign
  include DataMapper::Resource

  property :id, Serial

  has n, :person_signs
  has n, :persons, :through => :person_signs
end


class PersonSign
  include DataMapper::Resource
  belongs_to :person,   :key => true
  belongs_to :sign, :key => true
end





adapter =  DataMapper.setup(:default, 'mysql://root:root@localhost/dm_test')

adapter.resource_naming_convention = DataMapper::NamingConventions::Resource::Underscored


#:DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.dirname(__FILE__))}/db.sqlite")

DataMapper.finalize


DataMapper.auto_migrate!






