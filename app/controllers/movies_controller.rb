class MoviesController < ApplicationController

  # GET /movies
  # GET /movies.json
  def index

   redirect_to :controller=>'users', :action => 'show', :id => current_user

  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @movie = Movie.find(params[:id])

    id = @movie[:id]
    imdb = @movie[:imdb]
    @movie_data = imdb_find_by_id(imdb)



    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @movie }
    end

  end

  # GET /movies/new
  # GET /movies/new.json
  def new

   redirect_to :controller=>'movies', :action => 'add'

  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      if @movie.update_attributes(params[:movie])
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end
def add


end

def choose
@search = []
@search[0] = params[:q]

uri = URI.parse( "http://imdbapi.org/" ); params = {'title'=> @search[0], 'type'=>'json', 'limit'=> '10'}

http = Net::HTTP.new(uri.host, uri.port) 
request = Net::HTTP::Get.new(uri.path) 
request.set_form_data( params )

# instantiate a new Request object
request = Net::HTTP::Get.new( uri.path+ '?' + request.body ) 

response = http.request(request)
odpowiedz = response.body
json = JSON.parse(odpowiedz)
@search[1] = odpowiedz

if odpowiedz == '{"code":404, "error":"Film not found"}'


  @choose = []
  @error = []
        @error[0] = 'Brak wynikow wyszukiwania, sprobuj ponownie'


else  

ilosc_odpowiedzi = json.count.to_i


#@movie.imdb_id = imdb


   #title.to_s

     #if ilosc_odpowiedzi >0 and json[0] != false

          imdb = []

          for i in (0..ilosc_odpowiedzi-1)
          imdb[i] = json[i]['imdb_id']
          end

film = []
          for i in (0..ilosc_odpowiedzi-1)
          film[i] = imdb_find_by_id(imdb[i])
          end


      #@movie.imdb_id = imdb
      @choose = film
      @error = []



      #render "choose" 

      #@movie = Movie.new(params[:movie])
      #@save = Movie.new #(params[:movie])
      #@movie = @save

      #@movie.save
     #   format.json { render json: @movie, status: :created, location: @movie }
      
      #else
      #  @error[1] = 'Brak wynikow wyszukiwania, sprobuj ponownie'
      #  format.html { render action: "new" }
        #@movie.imdb_id = imdb[0]
        #@movie.save
       # format.html { redirect_to @movie, notice: 'Film Dodany' }
     #   format.json { render json: @movie.errors, status: :unprocessable_entity }
     # end

  end




end
def imdb_find_by_id(imdb_id)

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
desc = json[0]['plot_simple'].to_s
actors = []
actors = json[0]['actors']
directors = []
directors = json[0]['directors']

   #title.to_s

     #if ilosc_odpowiedzi >0 and json[0] != false

          film = [title, poster, url, imdb_id, desc, actors, directors]

     #   film['title'] = []#json[0]['title'].to_s
      #  film['poster'] = []#json[0]['poster']
       # film['url'] = []#json[0]['imdb_url']

return film


end
end

def customize
  @imdb_id = []
  @imdb_id[0] = params[:imdb_id]
  @movie = Movie.new(:imdb => @imdb_id[0])


end

end
