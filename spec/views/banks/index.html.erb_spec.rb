require 'rails_helper'

RSpec.describe "banks/index", type: :view do
  before(:each) do
    assign(:banks, [
      Bank.create!(),
      Bank.create!()
    ])
  end

  it "renders a list of banks" do
    render
    cell_selector = 'div>p'
  end
end
