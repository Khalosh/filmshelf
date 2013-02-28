require 'spec_helper'

describe "movies/index" do
  before(:each) do
    assign(:movies, [
      stub_model(Movie,
        :user => nil,
        :imdb => "Imdb",
        :media => "Media",
        :media_info => "Media Info",
        :seen => "Seen"
      ),
      stub_model(Movie,
        :user => nil,
        :imdb => "Imdb",
        :media => "Media",
        :media_info => "Media Info",
        :seen => "Seen"
      )
    ])
  end

  it "renders a list of movies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Imdb".to_s, :count => 2
    assert_select "tr>td", :text => "Media".to_s, :count => 2
    assert_select "tr>td", :text => "Media Info".to_s, :count => 2
    assert_select "tr>td", :text => "Seen".to_s, :count => 2
  end
end
