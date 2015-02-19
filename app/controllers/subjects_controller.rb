class SubjectsController < ApplicationController
  layout false
  def index
    @subjects=Subject.sorted
  end

  def show
    @subject=Subject.find(params[:id])
  end

  def new
    @subject=Subject.new({:name => "Default"})
  end
  def create
    #Instantiate a new object using form parameter
    @subject=Subject.new(subject_params)
    #save the object
    if @subject.save
      #if save succeeds, redirect to the index action
      flash[:notice]="Subject created successfully."
      redirect_to(:action =>'index')
    else
      #Id save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  def update
    #find  object using form parameter
    @subject=Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      #if udate succeeds, redirect to the index action
      flash[:notice]="Subject updated successfully."
      redirect_to(:action =>'show', :id => @subject.id)
    else
      #Id update fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def edit
    @subject=Subject.find(params[:id])
  end

  def delete
    @subject=Subject.find(params[:id])
  end

  def destroy
    subject=Subject.find(params[:id]).destroy
    flash[:notice]="Subject '#{subject.name}'destroyed successfully."
    redirect_to(:action =>'index')
  end

  private
  def subject_params
    params.require(:subject).permit(:name,:position,:visible)
  end
end
