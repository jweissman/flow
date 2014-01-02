require 'spec_helper'

describe "components/edit" do
  before(:each) do
    @component = assign(:component, build_stubbed(:component))
  end

  it "renders the edit component form" do
    render

    assert_select "form", action: components_path(@component), method: "post" do
      assert_select "input#component_name", name: "component[name]"
      assert_select "textarea#component_description", name: "component[description]"
    end
  end
end
