require 'rails_helper'

RSpec.describe "panels/index", type: :view do
  before(:each) do
    assign(:panels, [
      Panel.create!(
        month: 2,
        year: 3,
        pay: "9.99"
      ),
      Panel.create!(
        month: 2,
        year: 3,
        pay: "9.99"
      )
    ])
  end

  it "renders a list of panels" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
  end
end
