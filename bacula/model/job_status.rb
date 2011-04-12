class JobStatus
  include DataMapper::Resource
  storage_names[:default] = "Status"

  property :jobstatus,            String
  property :jobstatuslong,        String

end