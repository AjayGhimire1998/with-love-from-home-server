class StoreSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :category_id, :logo

  
end
