class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:home, :index]

  access all: [:home, :index, :show], editor: :all

  NUMBER_TO_SHOW = 3

  def home
    @summary_articles = build_summary_articles
  end

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params[:article][:user_id] = current_user.id
      params.require(:article).permit(:title, :content, :category, :user_id)
    end

    def build_summary_articles
      # I would like to make a better activerecord call to define this
      # result set but am going with this for the time being (just due to
      # the limitations I have on time right now.)
      # I would look into using query groupings and limits to build the result
      # set for 3 items in each category.
      #
      # This works although is not elegant by any stretch

      articles = {}
      Article.ordered_by_date.each do |article|
        articles[article.category] = [] if articles[article.category].nil?
        if articles[article.category].count < NUMBER_TO_SHOW
          articles[article.category] << article
        end
      end
      articles
    end
end
