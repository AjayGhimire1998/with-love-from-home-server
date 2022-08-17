class ProductSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :price, :description
end
