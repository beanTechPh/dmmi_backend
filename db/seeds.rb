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

if Service.all.count == 0 
  services = [
    {
      name: "Retrofitting",
      description: "DMMI can engage retrofitting of old/damage equipment into the corresponding new specification",
      is_top_service: true,
      icon: "engineering-supervision.png"
    },
    {
      name: "Testing and Commissioning",
      description: "With excellent technical team, DMMI can provide reports with proper analysis and correct maintenance methodology",
      is_top_service: true,
      icon: "testing-and-comissioning.png"
    },
    {
      name: "AFTER SALES SERVICE",
      description: "DMMI can provide after sale service 24hrs 7 days a week. Moreover, DMMI can provide 1 year warranty on factory defects.",
      is_top_service: true,
      icon: "after-sales.png"
    }
  ]

  Service.transaction do
    services.each do |service|
      s = Service.create(
        name: service[:name],
        description: service[:description],
        is_top_service: service[:is_top_service]
      )
  
      s.icon.attach(io: File.open("app/assets/images/services/#{service[:icon]}"), filename: service[:icon])
    end
  end
end

if Product.all.count == 0
  products = [
    {
      name: "All Types Of Free Standing Panels",
      raw_material: "Galvanized Iron Sheets 1.4mm - 2.0mm",
      coating: "Powder Coated",
      color: "Wrinkled Grey/Wrinkled Beige/ Client's Color Choice",
      application: "LVSG, MVSG, ATS, MTS, Relay Panel, & etc",
      usage: "Industrial Plant, Factories, Commercial Bldg, Hotels, Malls, Schools & etc.",
      is_top_product: true,
      image: "all-types-of-free-standing-panels.jpg"
    },
    {
      name: "Cable Tray System",
      raw_material: "Galvanized Iron Sheets 1.4mm - 2.0mm",
      coating: "Powder Coated",
      color: "Wrinkled Grey/Wrinkled Beige/ Client's Color Choice",
      application: "Indoor/Outdoor",
      usage: "Industrial Plant, Factories, Commercial Bldg, Hotels, Malls, Schools & etc.",
      is_top_product: true,
      image: "cable-tray.jpg"
    },
    {
      name: "Distribution Panel Boards",
      raw_material: "Galvanized Iron Sheets 1.4mm - 2.0mm",
      coating: "Powder Coated",
      color: "Wrinkled Grey/Wrinkled Beige/ Client's Color Choice",
      application: "Multi Distribution Panel Boards",
      usage: "Industrial Plant, Factories, Commercial Bldg, Hotels, Malls, Schools & etc.",
      is_top_product: true,
      image: "distribution-panel-board.jpg"
    },
    {
      name: "Meter Centers",
      raw_material: "Galvanized Iron Sheets 1.4mm - 2.0mm",
      coating: "Powder Coated",
      color: "Wrinkled Grey/Wrinkled Beige/ Client's Color Choice",
      application: "Elevated/Outdoor/Indoor Meter Centers",
      usage: "Industrial Plant, Factories, Commercial Bldg, Hotels, Malls, Schools & etc.",
      is_top_product: true,
      image: "meter-center.png"
    },
    {
      name: "Enclosed Circuit Breakers",
      raw_material: "Galvanized Iron Sheets 1.4mm - 2.0mm",
      coating: "Powder Coated",
      color: "Wrinkled Grey/Wrinkled Beige/ Client's Color Choice",
      application: "ECB/MTS/ATS/ Any Nema Standard",
      usage: "Industrial Plant, Factories, Commercial Bldg, Hotels, Malls, Schools & etc.",
      is_top_product: true,
      image: "enclosed-circuit-breaker.jpeg"
    },
    {
      name: "Automatic Transfer Switch",
      image: "Automatic-Transfer-Switch.jpg"
    },
    {
      name: "Busbar and Breaker Gutter",
      image: "Busbar and Breaker Gutter.jpg"
    },
    {
      name: "Capacitor Bank",
      image: "CAPACITOR BANK.png"
    },
    {
      name: "Data Cabinets",
      image: "Data Cabinets.jpg"
    },
    {
      name: "Low Voltage Switchgear",
      image: "Low Voltage Switchgear.jpg"
    },
    {
      name: "Manual Transfer Switch",
      image: "Manual Transfer Switch.jpg"
    },
    {
      name: "Medium Voltage Switchgear",
      image: "Medium Voltage Switchgear.jpeg"
    },
    {
      name: "PROTECTION RELAY PANEL",
      image: "PROTECTION RELAY PANEL.png"
    },
    {
      name: "Pull Boxes",
      image: "Pull Boxes.jpg"
    },
    {
      name: "SYNCHRONIZING PANEL",
      image: "SYNCHRONIZING PANEL.jpg"
    }
  ]

  Product.transaction do
    products.each do |product|
      p = Product.create!(
        name: product[:name],
        raw_material: product[:raw_material],
        coating: product[:coating],
        color: product[:color],
        application: product[:application],
        usage: product[:usage],
        is_top_product: product[:is_top_product]
      )
  
      p.image.attach(io: File.open("app/assets/images/products/#{product[:image]}"), filename: product[:image])
    end
  end
end