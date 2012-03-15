module DataMapper
  module Resource
    def new_record?
      new?
    end

    def update_attributes(attributes)
      update(attributes)
    end
  end

end





    if Rails.env=="production"

  DataMapper.auto_migrate!

end
