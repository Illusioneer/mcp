class Servicestatus < ActiveRecord::Base
  attr_accessible :current_event_id, :current_state, :host_name, :nagiostimeid, :service_description, :servicedata

  def self.uptime(datestart, dateend, servicename, hostname)

    uptick = Servicestatus.where(:host_name => hostname).where(:service_description => servicename).where(:nagiostimeid => datestart..dateend).where(:current_state => 0).count
    totaltick = Servicestatus.where(:host_name => hostname).where(:service_description => servicename).where(:nagiostimeid => datestart..dateend).count
    return (uptick.fdiv(totaltick.to_i)).*100

  end

  def self.all_hosts
    return Rails.cache.fetch('all_hosts', :expires_in => 20.minutes) { Servicestatus.select(:host_name).uniq.all }
  end

  def self.all_services(host)
    host_key = host + "_key"
    return Rails.cache.fetch(host_key, :expires_in => 20.minutes) { Servicestatus.where(:host_name => host).select(:service_description).uniq.all }
  end
end