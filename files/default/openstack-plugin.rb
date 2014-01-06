require 'ohai/mixin/ec2_metadata'
extend Ohai::Mixin::Ec2Metadata

Ohai.plugin do
  provides "openstack"

  collect_data do
    if hint?('openstack') || hint?('hp')
      Ohai::Log.debug("ohai openstack")
      openstack Mash.new
      if can_metadata_connect?(EC2_METADATA_ADDR,80)
        Ohai::Log.debug("connecting to the OpenStack metadata service")
        self.fetch_metadata.each {|k, v| puts "key: #{k}"; openstack[k] = v }
        case
        when hint?('hp')
          openstack['provider'] = 'hp'
        else
          openstack['provider'] = 'openstack'
        end
      else
        Ohai::Log.debug("unable to connect to the OpenStack metadata service")
      end
    else
      Ohai::Log.debug("NOT ohai openstack")
    end
  end
end