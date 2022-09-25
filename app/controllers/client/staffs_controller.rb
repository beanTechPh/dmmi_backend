class Client::StaffsController < ClientController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    staffs = @current_user.company.staffs

    if !params[:keyword].present?
      @staffs = staffs.order(:last_name)
      num_of_staffs = @staffs.count
    else
      keywords = params[:keyword].split(' ').map{|kw| "%#{kw}%"}

      st = Staff.arel_table
      @staffs = staffs.where(
        st[:first_name].matches_all(keywords).or(
          st[:last_name].matches_all(keywords).or(
            st[:email].matches_all(keywords)
          )
        )
      ).order(:last_name)
      
      num_of_staffs = @staffs.count
    end

    @staffs = @staffs.offset(offset * num_of_items).limit(num_of_items)

    @total_page = (num_of_staffs.to_f/num_of_items.to_f).ceil
  end
  
end