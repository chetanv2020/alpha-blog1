class ArticlesController < ApplicationController
def new
@article = Article.new
end

def create 
  #render plain param [:article].inspect
    @article = Article.new(article_params)
 
  if @article.save
    flash[:notice] = "Article is sucessfully created"
    redirect_to article_path(@article)
  else
    render 'new'
  end
  
end

private

def article_params

params.require(:article).permit(:title, :description)

end


end
