worker_processes 2

app_root = File.expand_path(File.dirname(__FILE__))
working_directory app_root

listen 4001
timeout 30

pid         app_root + '/log/unicorn.pid'
stderr_path app_root + '/log/unicorn.stderr.log'
stdout_path app_root + '/log/unicorn.stdout.log'

before_fork do |server, worker|
  old_pid = app_root + '/log/unicorn.pid.oldbin'
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end
