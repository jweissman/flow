require 'spec_helper'

describe "documents/index" do
  before(:each) do
    assign(:documents, [
      build_stubbed(:document,
        name: "Great",
        description: "Expectations",
        content: "by Charles Dickens"
      ),
      build_stubbed(:document,
        name: "Finnegans",
        description: "Wake",
        content: "James Joyce"
      )
    ])
  end

  it "renders a list of documents" do
    render

    assert_select "tr>td", text: "by Charles Dickens".to_s, count: 1
    assert_select "tr>td", text: "James Joyce".to_s, count: 1
    # assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
