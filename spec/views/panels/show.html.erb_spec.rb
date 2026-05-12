require 'rails_helper'

RSpec.describe "panels/show", type: :view do
  before(:each) do
    assign(:panel, Panel.create!(
      month: 2,
      year: 3,
      pay: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/9.99/)
  end
end
