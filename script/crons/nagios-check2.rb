require 'pg'
require 'active_record'
require 'activerecord-postgres-hstore'
require 'nagios_parser/status/parser'

ActiveRecord::Base.establish_connection(:adapter => "postgresql", :username => "master1", :password => "harper123", :database => "mastercontrol")
class Servicestatus  < ActiveRecord::Base
  serialize :servicedata, ActiveRecord::Coders::Hstore
end
class Hoststatus  < ActiveRecord::Base
  serialize :hostdata, ActiveRecord::Coders::Hstore
end

status = File.open("/var/log/nagios/status.dat").read
doc = NagiosParser::Status::Parser.parse(status)

#doc = {"timestamp" => data['info'][0]['created'], "programstatus" => data['programstatus'], "hoststatus" => data['hoststatus'], "servicestatus" => data['servicestatus']}

doc['servicestatus'].each do |host|
  entry = Servicestatus.new
  entry.host_name = host["host_name"]
  entry.service_description = host["service_description"]
  entry.current_state = host["current_state"]
  entry.current_event_id = host["current_event_id"]
  entry.nagiostimeid = Time.at(doc['info'][0]['created'])
  entry.servicedata = host
  entry.save
  #p entry.current_event_id
end

doc['hoststatus'].each do |host|
  entry = Hoststatus.new
  entry.host_name = host["host_name"]
  entry.current_state = host["current_state"]
  entry.current_event_id = host["current_event_id"]
  entry.nagiostimeid = Time.at(doc['info'][0]['created'])
  entry.hostdata = host
  entry.save
 # p entry.current_event_id
end


