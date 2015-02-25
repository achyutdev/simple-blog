class PagesController < ApplicationController

  def index
    @pages=Page.sorted
  end

  def show
    @page =Page.find(params[:id])
  end

  def new
    @page = Page.new({:name =>'Default'})
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice]="Page created successfully."
      redirect_to(:action =>'index')
    else
      render('new')
    end
  end

  def edit
    @page =Page.find(params[:id])
  end

  def update
    @page=Page.find(params[:id])
    if @page.update_attribute(page_param)
      flash[:notice] = "Page updated successfully."
      redirect_to(:action => 'show', :id=> @page.id)
    else
      render('edit')
    end
  end

  def delete
    @page =Page.find(params[:id])
  end

  def destroy
    page =Page.find(params[:id]).destory
    flash[:notice] ="Page destroyed successfully"
    redirect_to(:action => 'index')
  end

  private
  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end
end
