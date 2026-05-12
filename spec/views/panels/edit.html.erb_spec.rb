require 'rails_helper'

RSpec.describe "panels/edit", type: :view do
  let(:panel) {
    Panel.create!(
      month: 1,
      year: 1,
      pay: "9.99"
    )
  }

  before(:each) do
    assign(:panel, panel)
  end

  it "renders the edit panel form" do
    render

    assert_select "form[action=?][method=?]", panel_path(panel), "post" do
      assert_select "input[name=?]", "panel[month]"

      assert_select "input[name=?]", "panel[year]"

      assert_select "input[name=?]", "panel[pay]"
    end
  end
end
