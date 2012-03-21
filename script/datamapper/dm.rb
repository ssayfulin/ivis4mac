require 'rubygems'
require 'data_mapper' # requires all the gems listed above


class Person

  include DataMapper::Resource
  property :id, Serial
  property :first_name,	String, :required => true
  property :last_name,  String, :required => true

  property :second_name, String
  property :patronymic_name, String
  property :birth_date, Date

  has n, :person_signs
  has n, :sign_values, :through => :person_signs
  has n, :sign_types, :through => :person_signs

  has n, :person_images
  has n, :images, :through => :person_images

end


class SignValue
  include DataMapper::Resource
  property :id, Serial

  property :sign_value, String
  has n, :person_signs
  has n, :persons, :through => :person_signs
end


class SignType
  include DataMapper::Resource

  property :id, Serial
  property :sign_type, String


  has n, :person_signs
  has n, :persons, :through => :person_signs
end




class PersonSign
  include DataMapper::Resource

  belongs_to :person,   :key => true
  belongs_to :sign_value, :key => true
  belongs_to :sign_type, :key => true
end


class PersonImage
  include DataMapper::Resource

  belongs_to :person,   :key => true
  belongs_to :image, :key => true
end




class Image
  include DataMapper::Resource
  property :id,     Serial
  property :data, Binary
  property :path,   FilePath, :required => true
  property :md5sum, String,   :length => 32, :default => lambda { |r, p| Digest::MD5.hexdigest(r.path.read) if r.path }





  has n, :person_images
  has n, :persons, :through => :person_images

end

class File



end







#DataMapper.setup(:default, "sqlite3://#{File.expand_path(File.dirname(__FILE__))}/db.s3dbR)
adapter = DataMapper.setup(:default, 'mysql://root:root@localhost/dm_development')
#adapter.resource_naming_convention = DataMapper::NamingConventions::Resource::Underscored
#DataMapper.finalize
#DataMapper.auto_migrate!


adapter = DataMapper.setup(:default, 'mysql://root:root@localhost/dm_test')
#adapter.resource_naming_convention = DataMapper::NamingConventions::Resource::Underscored
DataMapper.finalize
DataMapper.auto_migrate!








