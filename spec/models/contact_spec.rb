require 'rails_helper'

RSpec.describe Contact, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "creation" do
    let (:contact) { FactoryBot.create(:contact) }

    it "can be created" do
      expect(contact).to be_valid
    end

    it "can not be created without first_name last_name email phone and message " do
      contact.first_name = nil
      contact.last_name = nil
      contact.email = nil
      contact.phone = nil
      expect(contact).to be_invalid
    end
  end

  describe "validations" do
    let (:contact) { FactoryBot.create(:contact) }

    it "require first_name" do
      contact.first_name = nil
      expect(contact.save).to be_falsy
    end

    it "require last_name" do
      contact.last_name = nil
      expect(contact.save).to be_falsy
    end
        
    it "require email" do
      contact.email = nil
      expect(contact.save).to be_falsy
    end

    it "require phone" do
      contact.phone = nil
      expect(contact.save).to be_falsy
    end

    it "email must be unique" do
      contact = FactoryBot.create(:contact)
      new_contact = FactoryBot.build(:contact,email: contact.email)
      expect(new_contact.valid?).not_to be_falsy
    end
  end
end