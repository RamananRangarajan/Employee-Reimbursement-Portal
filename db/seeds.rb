# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Clear existing data
Bill.destroy_all
EmployeeDetail.destroy_all
User.destroy_all
Department.destroy_all

# Create Departments
departments = [
  { name: "Engineering" },
  { name: "Sales" },
  { name: "Marketing" },
  { name: "HR" },
  { name: "Finance" }
]

departments.each do |dept|
  Department.create!(dept)
end

puts "Created #{Department.count} departments"

# Create Admin User
admin_user = User.create!(
  name: "Admin User",
  email: "admin@example.com",
  password: "password123",
  role: "admin"
)

puts "Created admin user: #{admin_user.email}"
puts "\nSeed data created successfully!"
