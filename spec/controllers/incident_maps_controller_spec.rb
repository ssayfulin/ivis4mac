#require 'spec_helper'
#
## This spec was generated by rspec-rails when you ran the scaffold generator.
## It demonstrates how one might use RSpec to specify the controller code that
## was generated by Rails when you ran the scaffold generator.
##
## It assumes that the implementation code is generated by the rails scaffold
## generator.  If you are using any extension libraries to generate different
## controller code, this generated spec may or may not pass.
##
## It only uses APIs available in rails and/or rspec-rails.  There are a number
## of tools you can use to make these specs even more expressive, but we're
## sticking to rails and rspec-rails APIs to keep things simple and stable.
##
## Compared to earlier versions of this generator, there is very limited use of
## stubs and message expectations in this spec.  Stubs are only used when there
## is no simpler way to get a handle on the object needed for the example.
## Message expectations are only used when there is no simpler way to specify
## that an instance is receiving a specific message.
#
#describe IncidentMapsController do
#
#  # This should return the minimal set of attributes required to create a valid
#  # IncidentMap. As you add validations to IncidentMap, be sure to
#  # update the return value of this method accordingly.
#  def valid_attributes
#    {}
#  end
#
#  # This should return the minimal set of values that should be in the session
#  # in order to pass any filters (e.g. authentication) defined in
#  # IncidentMapsController. Be sure to keep this updated too.
#  def valid_session
#    {}
#  end
#
#  describe "GET index" do
#    it "assigns all incident_maps as @incident_maps" do
#      incident_map = IncidentMap.create! valid_attributes
#      get :index, {}, valid_session
#      assigns(:incident_maps).should eq([incident_map])
#    end
#  end
#
#  describe "GET show" do
#    it "assigns the requested incident_map as @incident_map" do
#      incident_map = IncidentMap.create! valid_attributes
#      get :show, {:id => incident_map.to_param}, valid_session
#      assigns(:incident_map).should eq(incident_map)
#    end
#  end
#
#  describe "GET new" do
#    it "assigns a new incident_map as @incident_map" do
#      get :new, {}, valid_session
#      assigns(:incident_map).should be_a_new(IncidentMap)
#    end
#  end
#
#  describe "GET edit" do
#    it "assigns the requested incident_map as @incident_map" do
#      incident_map = IncidentMap.create! valid_attributes
#      get :edit, {:id => incident_map.to_param}, valid_session
#      assigns(:incident_map).should eq(incident_map)
#    end
#  end
#
#  describe "POST create" do
#    describe "with valid params" do
#      it "creates a new IncidentMap" do
#        expect {
#          post :create, {:incident_map => valid_attributes}, valid_session
#        }.to change(IncidentMap, :count).by(1)
#      end
#
#      it "assigns a newly created incident_map as @incident_map" do
#        post :create, {:incident_map => valid_attributes}, valid_session
#        assigns(:incident_map).should be_a(IncidentMap)
#        assigns(:incident_map).should be_persisted
#      end
#
#      it "redirects to the created incident_map" do
#        post :create, {:incident_map => valid_attributes}, valid_session
#        response.should redirect_to(IncidentMap.last)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns a newly created but unsaved incident_map as @incident_map" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        IncidentMap.any_instance.stub(:save).and_return(false)
#        post :create, {:incident_map => {}}, valid_session
#        assigns(:incident_map).should be_a_new(IncidentMap)
#      end
#
#      it "re-renders the 'new' template" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        IncidentMap.any_instance.stub(:save).and_return(false)
#        post :create, {:incident_map => {}}, valid_session
#        response.should render_template("new")
#      end
#    end
#  end
#
#  describe "PUT update" do
#    describe "with valid params" do
#      it "updates the requested incident_map" do
#        incident_map = IncidentMap.create! valid_attributes
#        # Assuming there are no other incident_maps in the database, this
#        # specifies that the IncidentMap created on the previous line
#        # receives the :update_attributes message with whatever params are
#        # submitted in the request.
#        IncidentMap.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, {:id => incident_map.to_param, :incident_map => {'these' => 'params'}}, valid_session
#      end
#
#      it "assigns the requested incident_map as @incident_map" do
#        incident_map = IncidentMap.create! valid_attributes
#        put :update, {:id => incident_map.to_param, :incident_map => valid_attributes}, valid_session
#        assigns(:incident_map).should eq(incident_map)
#      end
#
#      it "redirects to the incident_map" do
#        incident_map = IncidentMap.create! valid_attributes
#        put :update, {:id => incident_map.to_param, :incident_map => valid_attributes}, valid_session
#        response.should redirect_to(incident_map)
#      end
#    end
#
#    describe "with invalid params" do
#      it "assigns the incident_map as @incident_map" do
#        incident_map = IncidentMap.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        IncidentMap.any_instance.stub(:save).and_return(false)
#        put :update, {:id => incident_map.to_param, :incident_map => {}}, valid_session
#        assigns(:incident_map).should eq(incident_map)
#      end
#
#      it "re-renders the 'edit' template" do
#        incident_map = IncidentMap.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        IncidentMap.any_instance.stub(:save).and_return(false)
#        put :update, {:id => incident_map.to_param, :incident_map => {}}, valid_session
#        response.should render_template("edit")
#      end
#    end
#  end
#
#  describe "DELETE destroy" do
#    it "destroys the requested incident_map" do
#      incident_map = IncidentMap.create! valid_attributes
#      expect {
#        delete :destroy, {:id => incident_map.to_param}, valid_session
#      }.to change(IncidentMap, :count).by(-1)
#    end
#
#    it "redirects to the incident_maps list" do
#      incident_map = IncidentMap.create! valid_attributes
#      delete :destroy, {:id => incident_map.to_param}, valid_session
#      response.should redirect_to(incident_maps_url)
#    end
#  end
#
#end