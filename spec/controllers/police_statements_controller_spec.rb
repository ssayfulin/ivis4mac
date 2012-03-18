require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PoliceStatementsController do

  # This should return the minimal set of attributes required to create a valid
  # PoliceStatement. As you add validations to PoliceStatement, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PoliceStatementsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all police_statements as @police_statements" do
      police_statement = PoliceStatement.create! valid_attributes
      get :index, {}, valid_session
      assigns(:police_statements).should eq([police_statement])
    end
  end

  describe "GET show" do
    it "assigns the requested police_statement as @police_statement" do
      police_statement = PoliceStatement.create! valid_attributes
      get :show, {:id => police_statement.to_param}, valid_session
      assigns(:police_statement).should eq(police_statement)
    end
  end

  describe "GET new" do
    it "assigns a new police_statement as @police_statement" do
      get :new, {}, valid_session
      assigns(:police_statement).should be_a_new(PoliceStatement)
    end
  end

  describe "GET edit" do
    it "assigns the requested police_statement as @police_statement" do
      police_statement = PoliceStatement.create! valid_attributes
      get :edit, {:id => police_statement.to_param}, valid_session
      assigns(:police_statement).should eq(police_statement)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new PoliceStatement" do
        expect {
          post :create, {:police_statement => valid_attributes}, valid_session
        }.to change(PoliceStatement, :count).by(1)
      end

      it "assigns a newly created police_statement as @police_statement" do
        post :create, {:police_statement => valid_attributes}, valid_session
        assigns(:police_statement).should be_a(PoliceStatement)
        assigns(:police_statement).should be_persisted
      end

      it "redirects to the created police_statement" do
        post :create, {:police_statement => valid_attributes}, valid_session
        response.should redirect_to(PoliceStatement.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved police_statement as @police_statement" do
        # Trigger the behavior that occurs when invalid params are submitted
        PoliceStatement.any_instance.stub(:save).and_return(false)
        post :create, {:police_statement => {}}, valid_session
        assigns(:police_statement).should be_a_new(PoliceStatement)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PoliceStatement.any_instance.stub(:save).and_return(false)
        post :create, {:police_statement => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested police_statement" do
        police_statement = PoliceStatement.create! valid_attributes
        # Assuming there are no other police_statements in the database, this
        # specifies that the PoliceStatement created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PoliceStatement.any_instance.should_receive(:update).with({'these' => 'params'})
        put :update, {:id => police_statement.to_param, :police_statement => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested police_statement as @police_statement" do
        police_statement = PoliceStatement.create! valid_attributes
        put :update, {:id => police_statement.to_param, :police_statement => valid_attributes}, valid_session
        assigns(:police_statement).should eq(police_statement)
      end

      it "redirects to the police_statement" do
        police_statement = PoliceStatement.create! valid_attributes
        put :update, {:id => police_statement.to_param, :police_statement => valid_attributes}, valid_session
        response.should redirect_to(police_statement)
      end
    end

    describe "with invalid params" do
      it "assigns the police_statement as @police_statement" do
        police_statement = PoliceStatement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PoliceStatement.any_instance.stub(:save).and_return(false)
        put :update, {:id => police_statement.to_param, :police_statement => {}}, valid_session
        assigns(:police_statement).should eq(police_statement)
      end

      it "re-renders the 'edit' template" do
        police_statement = PoliceStatement.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        PoliceStatement.any_instance.stub(:save).and_return(false)
        put :update, {:id => police_statement.to_param, :police_statement => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested police_statement" do
      police_statement = PoliceStatement.create! valid_attributes
      expect {
        delete :destroy, {:id => police_statement.to_param}, valid_session
      }.to change(PoliceStatement, :count).by(-1)
    end

    it "redirects to the police_statements list" do
      police_statement = PoliceStatement.create! valid_attributes
      delete :destroy, {:id => police_statement.to_param}, valid_session
      response.should redirect_to(police_statements_url)
    end
  end

end
