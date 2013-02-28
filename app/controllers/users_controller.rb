class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :correct_user,   only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies
    @movie_data = []

          for i in (0..@movies.count-1) do
           imdb = @movies[i][:imdb]
           movie_id = @movies[i][:id]
          @movie_data[i] = imdb_find_by_id(imdb, movie_id)
          end
    end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to your FilmShelf!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def imdb_find_by_id(imdb_id, movie_id)

 id = imdb_id

uri = URI.parse( "http://imdbapi.org/" ); params = {'ids'=> imdb_id, 'type'=>'json'}

http = Net::HTTP.new(uri.host, uri.port) 
request = Net::HTTP::Get.new(uri.path) 
request.set_form_data( params )

# instantiate a new Request object
request = Net::HTTP::Get.new( uri.path+ '?' + request.body ) 

response = http.request(request)
odpowiedz = response.body
json = JSON.parse(odpowiedz)

if odpowiedz == '{"code":501, "error":"Parameter was invalid"}'



film = []

      film['title'] = 'error'
      film['poster'] = 'error'
      film['url'] = 'error'

return film

else  

#ilosc_odpowiedzi = json.count.to_i


#@movie.imdb_id = imdb
title = json[0]['title'].to_s
poster = json[0]['poster'].to_s
url = json[0]['imdb_url'].to_s
imdb_id = json[0]['imdb_id'].to_s
movie_id.to_s

   #title.to_s

     #if ilosc_odpowiedzi >0 and json[0] != false

          film = [title, poster, url, imdb_id, movie_id]

     #   film['title'] = []#json[0]['title'].to_s
      #  film['poster'] = []#json[0]['poster']
       # film['url'] = []#json[0]['imdb_url']

return film


end

end
end