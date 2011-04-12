require 'rubygems'
require 'dm-core'
require 'date'
require 'erb'

$LOAD_PATH.push(File.dirname(__FILE__))

require 'config'
require 'mailer'

require 'model/job'
require 'model/client'
require 'model/job_status'
require 'model/system'

DataMapper.setup(:default, "mysql://#{MYSQL_USERNAME}:#{MYSQL_PASSWORD}@localhost/#{MYSQL_DBNAME}")

@jobs = Job.all(:starttime.gt => (Date.today))

template = File.read(File.dirname(__FILE__) + '/mail.erb')
mail_body = (ERB.new(template).result(binding))

f = File.new('report.html', 'w')
f.write(mail_body)
f.close

send_email MAIL_TO, :body => mail_body, :mail_from => MAIL_FROM