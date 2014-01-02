require 'spec_helper'

describe DocumentsController do

  # This should return the minimal set of attributes required to create a valid
  # Document. As you add validations to Document, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :document
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocumentsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before do
    # TODO Set to :user and specify authorization rules in Ability.rb.
    # login_user build :admin
  end

  describe "#index" do
    it "assigns all documents as @documents" do
      document = Document.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:documents)).to eq([document])
    end
  end

  describe "#show" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :show, { :id => document.to_param }, valid_session
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "#new" do
    it "assigns a new document as @document" do
      get :new, {}, valid_session
      expect(assigns(:document)).to be_a_new(Document)
    end
  end

  describe "#edit" do
    it "assigns the requested document as @document" do
      document = Document.create! valid_attributes
      get :edit, { :id => document.to_param }, valid_session
      expect(assigns(:document)).to eq(document)
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "creates a new Document" do
        expect {
          post :create, { :document => valid_attributes }, valid_session
        }.to change(Document, :count).by(1)
      end

      it "assigns a newly created document as @document" do
        post :create, {:document => valid_attributes }, valid_session
        expect(assigns(:document)).to be_a(Document)
        expect(assigns(:document)).to be_persisted
      end

      it "redirects to the created document" do
        post :create, { :document => valid_attributes }, valid_session
        expect(response).to redirect_to(Document.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved document as @document" do
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        post :create, { :document => { "name" => "invalid value" } }, valid_session
        expect(assigns(:document)).to be_a_new(Document)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        post :create, { :document => { "name" => "invalid value" } }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "#update" do
    describe "with valid params" do
      it "updates the requested document" do
        document = Document.create! valid_attributes
        # Assuming there are no other documents in the database, this
        # specifies that the Document created on the previous line
        # receives the :update message with whatever params are submitted in
        # the request.
        Document.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, { :id => document.to_param, :document => { "name" => "MyString" } }, valid_session
      end

      it "assigns the requested document as @document" do
        document = Document.create! valid_attributes
        put :update, { :id => document.to_param, :document => valid_attributes }, valid_session
        expect(assigns(:document)).to eq(document)
      end

      it "redirects to the document" do
        document = Document.create! valid_attributes
        put :update, { :id => document.to_param, :document => valid_attributes }, valid_session
        expect(response).to redirect_to(document)
      end
    end

    describe "with invalid params" do
      it "assigns the document as @document" do
        document = Document.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        put :update, { :id => document.to_param, :document => { "name" => "invalid value" } }, valid_session
        expect(assigns(:document)).to eq(document)
      end

      it "re-renders the 'edit' template" do
        document = Document.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Document.any_instance.stub(:save).and_return(false)
        put :update, { :id => document.to_param, :document => { "name" => "invalid value" } }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "#destroy" do
    it "destroys the requested document" do
      document = Document.create! valid_attributes
      expect {
        delete :destroy, { :id => document.to_param }, valid_session
      }.to change(Document, :count).by(-1)
    end

    it "redirects to the documents list" do
      document = Document.create! valid_attributes
      delete :destroy, { :id => document.to_param }, valid_session
      expect(response).to redirect_to(documents_url)
    end
  end

end
