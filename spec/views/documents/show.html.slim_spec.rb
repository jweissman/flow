require 'spec_helper'

describe "documents/show" do
  before(:each) do
    @document = assign(:document, build_stubbed(:document))
  end

  it "renders attributes" do
    render

    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
