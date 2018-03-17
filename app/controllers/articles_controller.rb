class ArticlesController < ApplicationController
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
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
