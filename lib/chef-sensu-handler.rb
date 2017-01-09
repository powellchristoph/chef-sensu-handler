require "chef/handler"
require "json"
require "socket"

SENSU_CLIENT_PORT = 3030
STATUS = {
  :warning  => 1,
  :error    => 2
}

class SensuHandler < Chef::Handler

  def initialize(status=:warning)
    @return_status = STATUS[status]
  end

  def send_to_sensu(msg)
    begin
      Timeout.timeout(10) do
        s = TCPSocket.new 'localhost', SENSU_CLIENT_PORT
        s.puts msg.to_json
        s.close
      end
      Chef::Log.info("Updated Sensu with #{msg}")
    rescue Timeout::Error
      Chef::Log.error("Timed out while attempting to update Sensu.")
    rescue => error
      Chef::Log.error("Unexpected error while attemping to update Sensu: #{error}")
    end
  end

  def report
    msg = { 'name' => 'check_chef_run' }
    if run_status.success?
      msg['status'] = 0
      msg['output'] = 'OK: Chef-client ran successfully.'
    elsif run_status.failed?
      msg['status'] = @return_status
      msg['output'] = 'WARNING: Chef-client run failed!'
    else
      msg['status'] = 3
      msg['output'] = 'UNKNOWN: Not sure what happened.'
    end
    send_to_sensu msg
  end

end
