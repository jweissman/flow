require 'spec_helper'

describe ComponentsController do

  # This should return the minimal set of attributes required to create a valid
  # Component. As you add validations to Component, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :component
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ComponentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before do
    # TODO Set to :user and specify authorization rules in Ability.rb.
    # login_user build :admin
  end

  describe "#index" do
    it "assigns all components as @components" do
      component = Component.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:components)).to eq([component])
    end
  end

  describe "#show" do
    it "assigns the requested component as @component" do
      component = Component.create! valid_attributes
      get :show, { :id => component.to_param }, valid_session
      expect(assigns(:component)).to eq(component)
    end
  end

  describe "#new" do
    it "assigns a new component as @component" do
      get :new, {}, valid_session
      expect(assigns(:component)).to be_a_new(Component)
    end
  end

  describe "#edit" do
    it "assigns the requested component as @component" do
      component = Component.create! valid_attributes
      get :edit, { :id => component.to_param }, valid_session
      expect(assigns(:component)).to eq(component)
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "creates a new Component" do
        expect {
          post :create, { :component => valid_attributes }, valid_session
        }.to change(Component, :count).by(1)
      end

      it "assigns a newly created component as @component" do
        post :create, {:component => valid_attributes }, valid_session
        expect(assigns(:component)).to be_a(Component)
        expect(assigns(:component)).to be_persisted
      end

      it "redirects to the created component" do
        post :create, { :component => valid_attributes }, valid_session
        expect(response).to redirect_to(Component.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved component as @component" do
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        post :create, { :component => { "name" => "invalid value" } }, valid_session
        expect(assigns(:component)).to be_a_new(Component)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        post :create, { :component => { "name" => "invalid value" } }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "#update" do
    describe "with valid params" do
      it "updates the requested component" do
        component = Component.create! valid_attributes
        # Assuming there are no other components in the database, this
        # specifies that the Component created on the previous line
        # receives the :update message with whatever params are submitted in
        # the request.
        Component.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, { :id => component.to_param, :component => { "name" => "MyString" } }, valid_session
      end

      it "assigns the requested component as @component" do
        component = Component.create! valid_attributes
        put :update, { :id => component.to_param, :component => valid_attributes }, valid_session
        expect(assigns(:component)).to eq(component)
      end

      it "redirects to the component" do
        component = Component.create! valid_attributes
        put :update, { :id => component.to_param, :component => valid_attributes }, valid_session
        expect(response).to redirect_to(component)
      end
    end

    describe "with invalid params" do
      it "assigns the component as @component" do
        component = Component.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        put :update, { :id => component.to_param, :component => { "name" => "invalid value" } }, valid_session
        expect(assigns(:component)).to eq(component)
      end

      it "re-renders the 'edit' template" do
        component = Component.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Component.any_instance.stub(:save).and_return(false)
        put :update, { :id => component.to_param, :component => { "name" => "invalid value" } }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "#destroy" do
    it "destroys the requested component" do
      component = Component.create! valid_attributes
      expect {
        delete :destroy, { :id => component.to_param }, valid_session
      }.to change(Component, :count).by(-1)
    end

    it "redirects to the components list" do
      component = Component.create! valid_attributes
      delete :destroy, { :id => component.to_param }, valid_session
      expect(response).to redirect_to(components_url)
    end
  end

end
