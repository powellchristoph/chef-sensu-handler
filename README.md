# Chef Sensu Handler

Chef Sensu Handler is an OpsCode Chef exception handler for notifying
people when a Chef run fails via Sensu. This will create and resolve Sensu
alerts for a node in which the chef-run fails. This leverages the Sensu
client's [socket input](https://sensuapp.org/docs/0.26/reference/clients.html#client-socket-input) to create/resolve checks.

## Installation

```
gem install chef-sensu-handler
```

## Usage

Append the following to your Chef client configs, usually at `/etc/chef/client.rb`. The default return status is a `warning`. You can change this to an `error` in the config if you prefer. If you would like the alerts to automatically resolve themselves on a successful run set the `report_handlers`.

```
# Notify Sensu when a Chef run fails
require "chef-sensu-handler"

report_handlers << SensuHandler.new         # Auto-resolve alerts
exception_handlers << SensuHandler.new      # Creates a warning

# or return status critical
# exception_handlers << SensuHandler.new(:critical) # Sets return status to critical
```

Alternatively, you can use the LWRP (available @
http://community.opscode.com/cookbooks/chef_handler)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
