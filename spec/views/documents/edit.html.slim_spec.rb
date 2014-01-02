require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, build_stubbed(:document))
  end

  it "renders the edit document form" do
    render

    assert_select "form", action: documents_path(@document), method: "post" do
      assert_select "input#document_name", name: "document[name]"
      assert_select "textarea#document_description", name: "document[description]"
      assert_select "textarea#document_content", name: "document[content]"
    end
  end
end
