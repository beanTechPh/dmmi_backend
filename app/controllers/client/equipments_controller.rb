class Client::EquipmentsController < ClientController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    company = Company.first
    equipments = company.equipments

    if !params[:keyword].present?
      @equipments = equipments.order(:name)
      num_of_equipments = @equipments.count
    else
      keywords = params[:keyword].split(' ').map{|kw| "%#{kw}%"}

      et = Equipment.arel_table
      @equipments = equipments.where(
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
    @equipment = Equipment.find_by(serial_no: params[:id])
  end
  
end