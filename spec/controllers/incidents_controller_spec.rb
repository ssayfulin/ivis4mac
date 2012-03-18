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

describe IncidentsController do

  # This should return the minimal set of attributes required to create a valid
  # Incident. As you add validations to Incident, be sure to
  # update the return value of this method accordingly.
  def valid_attributes

    {
      :incident_registration_date =>"2002-03-11"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IncidentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all incidents as @incidents" do
      incident = Incident.create! valid_attributes
      get :index, {}, valid_session
      assigns(:incidents).should eq([incident])
    end
  end

  describe "GET show" do
    it "assigns the requested incident as @incident" do
      incident = Incident.create! valid_attributes
      get :show, {:id => incident.to_param}, valid_session
      assigns(:incident).should eq(incident)
    end
  end

  describe "GET new" do
    it "assigns a new incident as @incident" do
      get :new, {}, valid_session
      assigns(:incident).should be_a_new(Incident)
    end
  end

  describe "GET edit" do
    it "assigns the requested incident as @incident" do
      incident = Incident.create! valid_attributes
      get :edit, {:id => incident.to_param}, valid_session
      assigns(:incident).should eq(incident)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Incident" do
        expect {
          post :create, {:incident => valid_attributes}, valid_session
        }.to change(Incident, :count).by(1)
      end

      it "assigns a newly created incident as @incident" do
        post :create, {:incident => valid_attributes}, valid_session
        assigns(:incident).should be_a(Incident)
        assigns(:incident).should be_persisted
      end

      it "redirects to the created incident" do
        post :create, {:incident => valid_attributes}, valid_session
        response.should redirect_to(Incident.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved incident as @incident" do
        # Trigger the behavior that occurs when invalid params are submitted
        Incident.any_instance.stub(:save).and_return(false)
        post :create, {:incident => {}}, valid_session
        assigns(:incident).should be_a_new(Incident)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Incident.any_instance.stub(:save).and_return(false)
        post :create, {:incident => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested incident" do
        incident = Incident.create! valid_attributes
        # Assuming there are no other incidents in the database, this
        # specifies that the Incident created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Incident.any_instance.should_receive(:update).with({'these' => 'params'})
        put :update, {:id => incident.to_param, :incident => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested incident as @incident" do
        incident = Incident.create! valid_attributes
        put :update, {:id => incident.to_param, :incident => valid_attributes}, valid_session
        assigns(:incident).should eq(incident)
      end

      it "redirects to the incident" do
        incident = Incident.create! valid_attributes
        put :update, {:id => incident.to_param, :incident => valid_attributes}, valid_session
        response.should redirect_to(incident)
      end
    end

    describe "with invalid params" do
      it "assigns the incident as @incident" do
        incident = Incident.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Incident.any_instance.stub(:save).and_return(false)
        put :update, {:id => incident.to_param, :incident => {}}, valid_session
        assigns(:incident).should eq(incident)
      end

      it "re-renders the 'edit' template" do
        incident = Incident.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Incident.any_instance.stub(:save).and_return(false)
        put :update, {:id => incident.to_param, :incident => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested incident" do
      incident = Incident.create! valid_attributes
      expect {
        delete :destroy, {:id => incident.to_param}, valid_session
      }.to change(Incident, :count).by(-1)
    end

    it "redirects to the incidents list" do
      incident = Incident.create! valid_attributes
      delete :destroy, {:id => incident.to_param}, valid_session
      response.should redirect_to(incidents_url)
    end
  end

end
