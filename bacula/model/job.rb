require 'date'

class Job
  include DataMapper::Resource
  storage_names[:default] = "Job"

  property :jobid,        Serial
  property :name,         String
  property :type,         String  # Backup || Restore
  property :level,        String  # Full || Differential || Incremental
  property :jobstatus,    String
  property :starttime,    DateTime
  property :realendtime,  DateTime
  property :jobfiles,     Integer
  property :jobbytes,     Integer
  property :joberrors,    Integer

  belongs_to :client, :child_key => [ :clientid ]
  

  def backup_level
    case level
    when 'D'
      "Differential"
    when 'F'
      "Full"
    when 'I'
      "Incremental"
    end
  end

  def time_spent
    diff_seconds = (Time.parse(realendtime.ctime) - Time.parse(starttime.ctime))
    diff_seconds / 60
  end

  def termination_ok?
    jobstatus == 'T'
  end

  def backup_size
    jobbytes / (1024.0 * 1024.0)
  end

  def job_status
    JobStatus.first(:jobstatus=>jobstatus)
  end

end