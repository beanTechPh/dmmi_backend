class Equipment < ApplicationRecord
  belongs_to :product_type
  belongs_to :branch
  has_many_attached :images
  has_many_attached :schematics
  has_one_attached :documentation
  has_one_attached :qr_code
  has_many :components

  def age
    years = 0
    months = 0
    days = 0
    now = DateTime.now.in_time_zone("Asia/Manila")  # date now
    idate = installed_date.in_time_zone("Asia/Manila")  # installed date
    
    if idate.year == now.year
      # if same year, installed date month can be either equal or less than the now month
      if idate.month == now.month 
        if idate.day < now.day 
          days = now.day - idate.day
        end
      else
        # subtracted 1 because we cant say if the installed day is greater than or equal to now day, because if it is less than, it cannot be a one complete month
        months = now.month - idate.month - 1

        if idate.day <= now.day
          months += 1
          days = now.day - idate.day 
        else  # installed day is greater than now day
          # get the last day of installed date month
          last_day_of_installed_date_month = idate.end_of_month.day
          installed_date_days = last_day_of_installed_date_month - idate.day

          days = now.day + installed_date_days
        end
      end
    else
      # subtracted 1 because we cant say if the installed month is greater than or less than or equal to now month, because if it is less than, it cannot be a one complete year
      years = now.year - idate.year - 1

      if idate.month == now.month && idate.day <= now.day 
        years += 1
        days = now.day - idate.day
      elsif idate.month < now.month
        years += 1
        # subtracted 1 because we cant say if the installed day is greater than or equal to now day, because if it is less than, it cannot be a one complete month
        months = now.month - idate.month - 1

        if idate.day <= now.day
          months += 1
          days = now.day - idate.day 
        else  # installed day is greater than now day
          # get the last day of installed date month
          last_day_of_installed_date_month = idate.end_of_month.day
          installed_date_days = last_day_of_installed_date_month - idate.day

          days = now.day + installed_date_days
        end
      else
        installed_date_months = 12 - idate.month 
        # subtracted 1 because we cant say if the installed day is greater than or equal to now day, because if it is less than, it cannot be a one complete month
        months = now.month + installed_date_months - 1

        if idate.day <= now.day
          months += 1
          days = now.day - idate.day 
        else  # installed day is greater than now day
          if idate.month == now.month
            days = idate.day - now.day
          else
            # get the last day of installed date month
            last_day_of_installed_date_month = idate.end_of_month.day
            installed_date_days = last_day_of_installed_date_month - idate.day

            days = now.day + installed_date_days
          end
        end
      end
    end

    puts years, months, days

    if years == 0 && months == 0 && days == 0
      return "0 Day"
    else
      return "#{years} Years, #{months} Months, #{days} Days"
    end
  end
  
  def self.filters(filters)
    equipments = self.all 
    
    if filters[:type_filter].present?
      product_type = ProductType.find_by(name: filters[:type_filter])

      equipments = equipments.where(product_type_id: product_type.id)
    end
    
    if filters[:branch_filter].present?
      branch = Branch.find_by(name: filters[:branch_filter])

      equipments = equipments.where(branch_id: branch.id)
    end
    
    if filters[:brand_filter].present?
      equipments = equipments.where(brand: filters[:brand_filter])
    end

    return equipments
  end

  def self.generate_serial_no
    last_equipment = Equipment.last 

    if last_equipment.present? 
      last_year = last_equipment.serial_no.split("-").first.to_i
      last_num = last_equipment.serial_no.split("-").last.to_i

      if last_year == DateTime.now.year
        num = (last_num + 1).to_s.rjust(5, '0')
        return "#{last_year}-#{num}"
      end
    end

    year = DateTime.now.year
    num = 1.to_s.rjust(5, '0')

    return "#{year}-#{num}"
  end
  
  def self.generate_url_code
    o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten

    code = ''
    loop do
      code = (0...50).map { o[rand(o.length)] }.join

      break if !Equipment.find_by(url_code: code).present?
    end

    return code
  end
  
  def generate_qr
    require "rqrcode"

    if qr_code.attached?
      qr_code.purge
    end

    if Rails.env == "development"
      qr = RQRCode::QRCode.new("http://localhost:3001/equipments/#{url_code}")
    else
      qr = RQRCode::QRCode.new("http://client.dmmimftg.com/equipments/#{url_code}")
    end
    
    png = qr.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "FFFFFF00",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )
    
    self.qr_code.attach(io: StringIO.new(png.to_s), filename: "#{url_code}.png")
  end
  
end
