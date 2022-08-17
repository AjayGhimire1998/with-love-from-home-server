class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :fullname
end
