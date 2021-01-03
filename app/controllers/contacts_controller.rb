class ContactsController < ApplicationController
	before_action :set_contact, only: [:edit, :update, :destroy, :show]

  def index
    @contacts = Contact.order('updated_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
		if @contact.valid?
			@contact.save
			respond_to do |format|
				format.html { redirect_to contacts_path, notice: 'Contact details sucessfully created' }
			end
		else
			flash.now[:messages] = @contact.errors.full_messages[0]
			render :new
		end
  end

  def edit
  end

  def update
		if @contact.update(contact_params)
			respond_to do |format|
				format.html { redirect_to contacts_path,
				notice: 'Contact details update successfully.' }
			end
		else
			flash.now[:messages] = @contact.errors.full_messages[0]
			render :edit
		end
  end

  def show
  end

  def destroy
  	respond_to do |format|
			@contact.destroy
			format.html { redirect_to contacts_path(@contact), notice: 'Contact details successfully deleted' }
		end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name,:last_name,:email,:phone,:message)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end

end
