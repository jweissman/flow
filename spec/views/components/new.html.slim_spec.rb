require 'spec_helper'

describe "components/new" do
  before(:each) do
    assign(:component, build_stubbed(:component))
  end

  it "renders new component form" do
    render

    assert_select "form", action: components_path, method: "post" do
      assert_select "input#component_name", name: "component[name]"
      assert_select "textarea#component_description", name: "component[description]"
    end
  end
end

