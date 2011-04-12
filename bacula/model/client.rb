class Client
  include DataMapper::Resource
  storage_names[:default] = "Client"

  property :clientid,    Serial
  property :name,        String
  
end