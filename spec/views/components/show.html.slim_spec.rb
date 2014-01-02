require 'spec_helper'

describe "components/show" do
  before(:each) do
    @component = assign(:component, build_stubbed(:component))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
