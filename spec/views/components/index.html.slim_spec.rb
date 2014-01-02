require 'spec_helper'

describe "components/index" do
  before(:each) do
    assign(:components, [
      build_stubbed(:component,
        name: "Name",
        description: "MyText"
      ),
      build_stubbed(:component,
        name: "Name",
        description: "MyText"
      )
    ])
  end

  it "renders a list of components" do
    render

    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
