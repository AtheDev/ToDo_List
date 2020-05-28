class EmailsController < ApplicationController
  def index
    @email = Email.all
  end

  def create
    @email = Email.new(object: Faker::DcComics.title,
                        body: Faker::Lorem.paragraph_by_chars)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
      flash[:notice] = "Email created"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def show
    @email = Email.find(params[:id])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
  end



  def update
    @email = Email.find(params[:id])
    @email.update(read: false)
      respond_to do |format|
        format.html { redirect_to tasks_path }
        format.js { }
      end
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
  end

  private

  def task_params
      params.permit(:read)
  end
end
