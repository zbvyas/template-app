class ArticlesController < ApplicationController

  before_action :set_article, only: [:edit, :update, :destroy, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
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
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was successfully created!"
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
    flash[:danger] = "Article was successfully deleted!"
    redirect_to articles_path
  end

  def edit
    # before_action is called here, so it can remain empty
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end

  def set_article
    @article = Article.find(params[:id])
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:danger] = "You can only edit or delete your own article"
      redirect_to root_path
    end
  end
end
