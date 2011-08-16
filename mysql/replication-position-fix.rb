# MySQL Replication position fix
# Skips replication transaction unitl it will succeed.

require 'rubygems'
require 'mysql'

puts "+++ running Replication position detection #{Time.now}"

con = Mysql.new('localhost', 'deploy', 'xxxxxx', 'information_schema')


skipped = 0
oks = 0

while oks < 100000 do
  rs = con.query("show slave status")
  rs.each_hash { |h|
		if h['Slave_SQL_Running'] == 'No'
			oks = 0
			puts "Skipping id##{h['Read_Master_Log_Pos']} - #{h['Last_Error']}"
			con.query('SET GLOBAL SQL_SLAVE_SKIP_COUNTER=1')
			con.query('START SLAVE')
		  skipped += 1
    else
			oks += 1
		end
  }
end 

puts "+++ Finished. Totaly skipped #{skipped}"
