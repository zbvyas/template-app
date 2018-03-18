class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :destroy, :show]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    # if you simply want to display the params passed in from the form...
    # `render plain: params[:article].inspect`
    # rails 5 output looks like:
    # <ActionController::Parameters {"title"=>"This is a title", "description"=>"THis is some description"} permitted: false>
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    # before_action is called here, so it can remain empty
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article was successfully deleted!"
    redirect_to articles_path
  end

  def edit
    # before_action is called here, so it can remain empty
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end