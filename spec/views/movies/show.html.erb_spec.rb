require 'spec_helper'

describe "movies/show" do
  before(:each) do
    @movie = assign(:movie, stub_model(Movie,
      :user => nil,
      :imdb => "Imdb",
      :media => "Media",
      :media_info => "Media Info",
      :seen => "Seen"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Imdb/)
    rendered.should match(/Media/)
    rendered.should match(/Media Info/)
    rendered.should match(/Seen/)
  end
end
