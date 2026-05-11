require 'rails_helper'

RSpec.describe "banks/edit", type: :view do
  let(:bank) {
    Bank.create!()
  }

  before(:each) do
    assign(:bank, bank)
  end

  it "renders the edit bank form" do
    render

    assert_select "form[action=?][method=?]", bank_path(bank), "post" do
    end
  end
end
