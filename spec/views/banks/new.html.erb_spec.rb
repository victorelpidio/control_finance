require 'rails_helper'

RSpec.describe "banks/new", type: :view do
  before(:each) do
    assign(:bank, Bank.new())
  end

  it "renders new bank form" do
    render

    assert_select "form[action=?][method=?]", banks_path, "post" do
    end
  end
end
