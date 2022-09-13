class Admin::EquipmentsController < AdminController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    equipments = Equipment.all.order(serial_no: :desc)
    @branches = Branch.all
    @brands = equipments.pluck(:brand).uniq.sort

    filters = {
      type_filter: params[:type_filter],
      origin_filter: params[:origin_filter],
      branch_filter: params[:branch_filter],
      brand_filter: params[:brand_filter]
    }

    if !params[:keyword].present?
      @equipments = equipments.filters(filters).order(:name)
      num_of_equipments = @equipments.count
    else
      keywords = params[:keyword].split(' ').map{|kw| "%#{kw}%"}

      et = Equipment.arel_table
      @equipments = equipments.filters(filters).where(
        et[:name].matches_all(keywords).or(
          et[:serial_no].matches_all(keywords)
        )
      ).order(:name)
      
      num_of_equipments = @equipments.count
    end

    @equipments = @equipments.offset(offset * num_of_items).limit(num_of_items)

    @total_page = (num_of_equipments.to_f/num_of_items.to_f).ceil
  end
  
  def show
    @equipment = Equipment.find(params[:id])
  end
  
  def new
    @companies = Company.all
    @product_types = ProductType.all
    @branches = []

    if params[:company_id].present?
      company = Company.find(params[:company_id])
      @branches = company.branches
    end
  end
  
  def create
    equipment = Equipment.new(equipment_params)
    equipment.brand = params[:brand].upcase
    equipment.serial_no = Equipment.generate_serial_no
    equipment.url_code = Equipment.generate_url_code

    equipment.save! 

    render json: {}, status: 200
  rescue => e 
    logger.info("\n\n\n\n #{e} \n\n\n\n")
    render json: {error: e}, status: 500 
  end
  

  private 
    def equipment_params 
      params.permit(:name, :product_type_id, :installed_date, :brand, :branch_id, :description, images: [], schematics: [])
    end
    
end