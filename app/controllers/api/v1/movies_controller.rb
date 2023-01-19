class Api::V1::MoviesController < ActionController::API
  before_action :set_movie, only: [:show, :update, :destroy]

  # GET /api/v1/movies
  def index
    @movies = Movie.all
    render json: @movies, status: :ok
  end

  # GET /api/v1/movies/1
  def show
    if @movie
      render json: @movie, status: :ok
    else
      render json: @movie.errors, status: :not_found
    end
  end

  # POST /api/v1/movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/movies/1
  def update
    if @movie.update(movie_params)
      render json: @movie, status: :ok
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/movies/1
  def destroy
    @movie.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:genres, :adult, :language, :overview, :popularity, :release_date, :status, :title)
    end
end
