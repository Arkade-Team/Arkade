 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/hospitals", type: :request do
  # Hospital. As you add validations to Hospital, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Hospital.create! valid_attributes
      get hospitals_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      hospital = Hospital.create! valid_attributes
      get hospital_url(hospital)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Hospital" do
        expect {
          post hospitals_url, params: { hospital: valid_attributes }
        }.to change(Hospital, :count).by(1)
      end

      it "redirects to the created hospital" do
        post hospitals_url, params: { hospital: valid_attributes }
        expect(response).to redirect_to(hospital_url(Hospital.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Hospital" do
        expect {
          post hospitals_url, params: { hospital: invalid_attributes }
        }.to change(Hospital, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post hospitals_url, params: { hospital: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

end
