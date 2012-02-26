#config/initializers/datamapper.rb
Rails::DataMapper.configuration.resource_naming_convention[:default] = lambda do |name|
  name.downcase.singularize
end

# note: this will be available in dm-rails 1.1.1
Rails::DataMapper.configuration.field_naming_convention[:default] = lambda do |property|

  if "#{property.name}" == "id"
   return  "id_#{property.model.name.downcase}"
  end

  "#{property.name.to_s}"
end
