class RakeTasksController < ApplicationController

  def new
    @rake_task = RakeTask.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    @rake_task = RakeTask.new(rake_task_params)
    if @rake_task.save
      redirect_to ( url_for( @rake_task.blueprint_version ) + '#' + @rake_task.class.name.underscore + '_' + @rake_task.id.to_s )
    else
      render 'new'
    end
  end

  def show
    @rake_task = RakeTask.find(params[:id])
  end

  def edit
    @rake_task = RakeTask.find(params[:id])
  end

  def update
    @rake_task = RakeTask.find(params[:id])

    if @rake_task.update(rake_task_params)
      redirect_to ( url_for( @rake_task.blueprint_version ) + '#' + @rake_task.class.name.underscore + '_' + @rake_task.id.to_s )
    else
      render 'edit'
    end
  end

  def destroy
    @rake_task = RakeTask.find(params[:id])
    @rake_task.destroy
    redirect_to ( url_for( @rake_task.blueprint_version ) + '#' + @rake_task.class.name.pluralize.underscore )
  end

private

  def rake_task_params
    params.require(:rake_task).permit!
  end

end
