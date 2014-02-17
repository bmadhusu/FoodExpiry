scheduler = Rufus::Scheduler.new


scheduler.every '2m' do
  puts "AWESOME!!!"

 # UserMailer.email_expiring_foods.deliver

end

# if you join threads, the server thread will simply yield and wait for the scheduling thread to finish, but we don't want this! b/c the web app will never execute! the threads need to run independently

# scheduler.join

