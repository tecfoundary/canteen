namespace :canteen do
  desc "Task Description"
  task dummy_data: :environment do
    puts "Creating user..."
    user = Canteen::User.find_or_create_by(email: 'admin@example.com', password: 'admin', name: 'Admin User')
    puts "#{user.email} created."
  end
end
