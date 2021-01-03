class Api::V1::ContactsController < Api::V1::ApiBaseController

	before_action :set_contact, only: [:show, :update, :edit, :destroy]
	
	def index
		@contacts = Contact.order('updated_at DESC')
		render json: {
			success: true,
			result: { contact_list: @contacts }
		}
	end

	def create
		begin
      unless params[:contact][:first_name].present? && params[:contact][:last_name].present? && params[:contact][:email].present? && params[:contact][:phone].present?
        render json: {
        	success: false,
          status: 0,
          message: "Please check empty field"
        } and return
      end

      contact = Contact.new(contact_params)
      if contact.save
        render json: {
        	success: true,
          status: 200,
          message: 'Successfully created',
          result: contact.as_json
        }
      else
        render json: {
        	success: false,
          status: 0,
          message: contact.errors
        }
      end
    rescue TypeError => ex
      render json: {
      	success: false,
        status: 0,
        message: 'Please check Something went wrong'
      }
    end
	end

	def update
		begin
			unless params[:contact][:first_name].present? && params[:contact][:last_name].present? && params[:contact][:email].present? && params[:contact][:phone].present?
        render json: {
        	success: false,
          status: 0,
          message: "Please check empty field"
        } and return
      end
      
			if @contact.update(contact_params)
	      render json: {
	      	success: true,
	        status: 200,
	        message: 'Information update is complete.',
	        result: @contact.as_json
	      }
	    else
	      render json: {
	      	success: false,
	        status: 0,
	        message: @contact.errors.full_messages
	      }
	    end
		rescue Exception => e
			render json: {
				success: false,
        status: 0,
        message: 'Please check Something went wrong'
      }
		end
	end

	def show
		render json: {
			success: true,
      status: 200,
      result: @contact.as_json
    }
	end

	def destroy
    render json: {
    	success: true,
      status: 200,
      result: @contact.destroy!,
      message: 'successfully deleted'
    }
	end

	private

	def contact_params
		params.require(:contact).permit(:first_name,:last_name,:email,:phone,:message)
	end

	def set_contact
    @contact = Contact.find_by(id: params[:id])
    unless @contact
      render json: {
        status: 0,
        message: "I can't find the contact's details."
      }and return
    end
  end
end
