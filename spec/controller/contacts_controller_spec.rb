require 'rails_helper'

RSpec.describe ContactsController, type: :controller do

	describe "GET #index" do
    context "with valid attributes" do
      it "renders the index template" do
      	get :index
      	expect(response.status).to eq(200)
    	end
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new contact" do
        expect { post :create, params: {contact: FactoryBot.attributes_for(:contact)}}.to change(Contact, :count).by(1)
      end
    end
  end

	describe "PATCH #update" do
	  context "with good data" do
	    it "updates the wallet and redirects" do
	    	contact = FactoryBot.create(:contact)
	    	updated_contact = FactoryBot.attributes_for(:contact, first_name: "chris", last_name: "joe", email: "chris@joe.com", phone: "9012345678", message: "Hello Chris")
	    	put :update, params: {id: contact, contact: updated_contact}
	      expect(response).to be_redirect
	    end
	  end
	end

	describe "GET #show" do
    context "with valid attributes" do
      it "renders the show template" do
      	contact = FactoryBot.create(:contact)
      	get :show, params: {id: contact}
      	expect(response.status).to eq(200)
    	end
    end
  end
end