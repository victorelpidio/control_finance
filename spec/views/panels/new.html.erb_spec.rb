require 'rails_helper'

RSpec.describe "panels/new", type: :view do
  before(:each) do
    assign(:panel, Panel.new(
      month: 1,
      year: 1,
      pay: "9.99"
    ))
  end

  it "renders new panel form" do
    render

    assert_select "form[action=?][method=?]", panels_path, "post" do
      assert_select "input[name=?]", "panel[month]"

      assert_select "input[name=?]", "panel[year]"

      assert_select "input[name=?]", "panel[pay]"
    end
  end
end
