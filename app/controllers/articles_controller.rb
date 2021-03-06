class ArticlesController < ApplicationController
  include Adminable

  load_and_authorize_resource except: [:create]

  # GET /articles
  # GET /articles.json
  def index
    if params[:articles] && params[:articles][:category_id]
      show_by_category
    else
      @articles = Article.all
    end
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
    @article.user_id ||= current_user.id

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Статья успешно создана.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Статья успешно изменена.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:type, :title, :preview, :data, :user_id, :category_id)
    end

  def show_by_category
    category = Category.find(params[:articles][:category_id]) || {id: 0}
    article = Article.where(category_id: category[:id]).first
    render 'articles/show_by_category', layout: 'application', locals: {category: category, article: article}
  end
end
