require "rails_helper"

describe Api::V1::ContactsController, type: :controller do

  describe "Contact index action" do
    let (:contact) { FactoryBot.create(:contact) }

    it "lists of Contacts" do
      FactoryBot.create(:contact)
      get :index
      contact = JSON.parse(response.body)
      expect(contact["success"]).to eq(true)
    end
  end

  # describe "Contact create action" do
  #   let (:contact) { FactoryBot.create(:contact) }

  #   it "should create contact details" do
  #     post :create, params: {contact: { first_name: "chris", last_name: "joe", email: "chris@joe.com", phone: "9012345678", message: "Hello Chris" }}
  #     contact = JSON.parse(response.body)
  #     expect(contact["success"]).to eq(true)
  #     expect(response.status).to eq(200)
  #   end
  # end

  describe "POST #create" do
    context "with valid attributes" do
      it "create new contact" do
        expect { post :create, params: {contact: FactoryBot.attributes_for(:contact)}}.to change(Contact, :count).by(1)
      end
    end
  end

  describe "Contact update action" do
    let (:contact) { FactoryBot.create(:contact) }

    it "should update Contact details" do
      contact = FactoryBot.create(:contact)
      updated_contact = FactoryBot.attributes_for(:contact, first_name: "chris", last_name: "joe", email: "chris@joe.com", phone: "9012345678", message: "Hello Chris")
      put :update, params: {id: contact, contact: updated_contact}
      contact = JSON.parse(response.body)
      expect(contact["success"]).to eq(true)
      expect(response.status).to eq(200)
    end
  end

  describe "Contact show action" do
    let (:contact) { FactoryBot.create(:contact) }

    it "should display one contact" do

      contact = FactoryBot.create(:contact)
      get :show,params: {id: contact.id }
      contact = JSON.parse(response.body)
      expect(contact["success"]).to eq(true)
    end
  end

  describe "Contact destroy action" do
    let (:contact) { FactoryBot.create(:contact) }

    it "should delete contact details" do
      contact = FactoryBot.create(:contact)
      delete :destroy, params: {id: contact.id }
      contact = JSON.parse(response.body)
      expect(contact["success"]).to eq(true)
    end
  end
end
