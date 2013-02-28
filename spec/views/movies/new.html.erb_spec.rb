require 'spec_helper'

describe "movies/new" do
  before(:each) do
    assign(:movie, stub_model(Movie,
      :user => nil,
      :imdb => "MyString",
      :media => "MyString",
      :media_info => "MyString",
      :seen => "MyString"
    ).as_new_record)
  end

  it "renders new movie form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => movies_path, :method => "post" do
      assert_select "input#movie_user", :name => "movie[user]"
      assert_select "input#movie_imdb", :name => "movie[imdb]"
      assert_select "input#movie_media", :name => "movie[media]"
      assert_select "input#movie_media_info", :name => "movie[media_info]"
      assert_select "input#movie_seen", :name => "movie[seen]"
    end
  end
end
