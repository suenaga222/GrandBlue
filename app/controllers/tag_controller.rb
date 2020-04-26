class TagController < ApplicationController
  def index
    @tags = Tag.all
  end
  
  def new
  end
  
  def create
    @tag = Tag.new(name: params[:name])
    @tag.save
    if @tag.save
      flash[:notice] = "Successfully created the new tag."
      if params[:image]
        image = params[:image]
        File.binwrite("public/images/tag/#{tag.id}.png", image.read)
      end
      redirect_to("/tag/index")
    else
      flash[:notice] = "Tag's name is needed."
      render("tag/new")
    end
  end
  
  def show
    @tag = Tag.find_by(id: params[:id])
  end
  
  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.destroy
    redirect_to("/tag/index")
  end
  
end
