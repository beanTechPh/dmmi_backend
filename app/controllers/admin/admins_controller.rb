class Admin::AdminsController < AdminController
  
  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    admins = Admin.all.order(last_name: :desc)

    if !params[:keyword].present?
      @admins = admins
      num_of_admins = @admins.count
    else
      keywords = params[:keyword].split(' ').map{|kw| "%#{kw}%"}

      at = Admin.arel_table
      @admins = admins.where(
        at[:first_name].matches_all(keywords).or(
          at[:last_name].matches_all(keywords).or(
            at[:email].matches_all(keywords)
          )
        )
      )
      
      num_of_admins = @admins.count
    end

    @admins = @admins.offset(offset * num_of_items).limit(num_of_items)

    @total_page = (num_of_admins.to_f/num_of_items.to_f).ceil
  end
  
  def create
    InviteMailer.with(email: params[:email]).admin_invite.deliver_later
    
    render status: 200
  end
  
end