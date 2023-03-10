require 'rails_helper'

RSpec.describe "plays/edit", type: :view do
  let(:play) {
    Play.create!(
      status: 1
    )
  }

  before(:each) do
    assign(:play, play)
  end

  it "renders the edit play form" do
    render

    assert_select "form[action=?][method=?]", play_path(play), "post" do

      assert_select "input[name=?]", "play[status]"
    end
  end
end
