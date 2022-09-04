# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Admin.all.count == 0
  Admin.create!(
    first_name: "Super",
    last_name: "Admin",
    mobile_no: "09053536495",
    address: "Cebu City",
    email: "superadmin@gmail.com",
    password: "123456"
  )
end

if Company.all.count == 0
  Company.create!(
    name: "DMMI",
    address: "Cebu City",
    email: "info.dmmimftg@gmail.com"
  )
end

if ProductType.all.count == 0
  types = ["All Types Of Free Standing Panels", "Distribution Panel Board"]

  types.each do |type|
    ProductType.create!(
      name: type
    )
  end
end

if Branch.all.count == 0
  branches = ["City Mall Cotabato", "City Mall Danao"]

  branches.each do |branch|
    Branch.create!(
      name: branch,
      company_id: Company.first.id
    )
  end
end

if Equipment.all.count == 0
  equipments = [
    {
      name: "Low Voltage Switch Gear",
      product_type: ProductType.find_by(name: "All Types Of Free Standing Panels"),
      serial_no: "22001",
      origin: "order",
      description: "4000A, 3P, 400V, Schnieder",
      installed_date: DateTime.new(2021, 8),
      branch: Branch.find_by(name: "City Mall Cotabato"),
      brand: "DMMI"
    },
    {
      name: "Enclosed Panel Board",
      product_type: ProductType.find_by(name: "Distribution Panel Board"),
      serial_no: "22002",
      origin: "scan",
      description: "4000A, 3P, 400V, Schnieder",
      installed_date: DateTime.new(2020, 8),
      branch: Branch.find_by(name: "City Mall Danao"),
      brand: "Existing"
    }
  ]

  equipments.each do |equipment|
    e = Equipment.create!(equipment)
    e.update!(url_code: Equipment.generate_url_code)
  end
end