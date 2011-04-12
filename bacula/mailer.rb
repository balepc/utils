require 'net/smtp'

def send_email(to,opts={})
  opts[:server]      ||= 'localhost'
  opts[:from]        ||= 'bacula@domain.com'
  opts[:from_alias]  ||= 'Bacula'
  opts[:subject]     ||= "Backup report"
  opts[:body]        ||= "Important stuff!"

  msg = <<END_OF_MESSAGE
From: #{opts[:from_alias]} <#{opts[:from]}>
To: #{to.collect{|m| "<#{m}>"}.join(',') }
Subject: #{opts[:subject]}
Content-Type: text/html;

#{opts[:body]}
END_OF_MESSAGE

  Net::SMTP.start(opts[:server]) do |smtp|
    smtp.send_message msg, opts[:from], to
  end
end