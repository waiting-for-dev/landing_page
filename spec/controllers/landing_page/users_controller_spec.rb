require 'spec_helper' 

module LandingPage
  describe UsersController do
    describe "#new" do
      it "assigns an user" do
        get :new, use_route: 'landing_page'
        expect(assigns[:user]).to be_instance_of LandingPage::User
      end
    end
    describe "#create" do
      context "when valid email is given" do
        before :each do
          post :create, use_route: 'landing_page', user: {email: 'valid@email.com'}
        end
        it "render #create template" do
          expect(response).to render_template :create
        end
        it "flash a success message" do
          expect(flash[:success]).to_not be_nil
        end
        it "save the record" do
          expect(User.count()).to eq(1)
        end
      end
      context "when invalid email is given" do
        before :each do
          post :create, use_route: 'landing_page', user: {email: 'invalid_email'}
        end
        it "render #new template" do
          expect(response).to render_template :new
        end
        it "assign user" do
          expect(assigns[:user]).to be_an_instance_of LandingPage::User
        end
      end
    end
  end
end
