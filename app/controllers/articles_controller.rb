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
    @article.save
    redirect_to articles_show(@article)
  end
  
  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
