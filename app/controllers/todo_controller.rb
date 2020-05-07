class TodoController < ApplicationController
  def index
    @todos = Todo.all.order(priority: "ASC")
    @tags = Tag.all
  end
  
  def new
    @tags = Tag.all
  end
  
  def create
    @todo = Todo.new(content: params[:content], tag: params[:tag], priority: params[:priority])
    @todo.save
    if @todo.save
      flash[:notice] = "Successfully created the new ToDo."
      redirect_to("/todo/index")
    else
      flash[:notice] = "Content is needed."
      @tags = Tag.all
      render("todo/new")
    end
  end
  
  def show
    @todo = Todo.find_by(id: params[:id])
  end
  
  def change
    @todo = Todo.find_by(id: params[:id])
  end
  
  def update
    @todo = Todo.find_by(id: params[:id])
    @todo.content = params[:content]
    @todo.tag = params[:tag]
    @todo.priority = params[:priority]
    @todo.save
    if @todo.save
      flash[:notice] = "Successfully updated the ToDo."
      redirect_to("/todo/index")
    else
      flash[:notice] = "Content is needed."
      render("todo/change")
    end
  end
  
  def destroy
    todo = Todo.find_by(id: params[:id])
    todo.destroy
    flash[:notice] = "Successfully delete the ToDo."
    redirect_to("/todo/index")
  end
  
end
