class Client::EquipmentsController < ClientController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    company = @current_user.company
    equipments = company.equipments.order(serial_no: :desc)
    @branches = company.branches
    @brands = equipments.pluck(:brand).uniq.sort

    filters = {
      type_filter: params[:type_filter],
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

    if !@equipment.present?
      @equipment = Equipment.find_by(url_code: params[:id])
    end
  end
  
end