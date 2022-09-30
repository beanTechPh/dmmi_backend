class Admin::ContactsController < AdminController

  def index
    num_of_items = params[:num_entries].present? ? params[:num_entries].to_i : 10
    @page = params[:page].present? ? params[:page].to_i : 1
    offset = params[:page].present? ? params[:page].to_i - 1 : 0

    contacts = Contact.all.order(id: :desc)

    @contacts = contacts
    num_of_contacts = @contacts.count

    @contacts = @contacts.offset(offset * num_of_items).limit(num_of_items)

    @total_page = (num_of_contacts.to_f/num_of_items.to_f).ceil
  end
  
end