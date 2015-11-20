class ServiceConfigurationsController < ApplicationController

  def new
    @service_configuration = ServiceConfiguration.new(blueprint_version_id: params[:blueprint_version_id])
  end

  def create
    # render text: params
    @service_configuration = ServiceConfiguration.new(service_configuration_params)
    if @service_configuration.build_new
      redirect_to @service_configuration
    else
      render 'new'
    end
  end

  def show
    @service_configuration = ServiceConfiguration.find(params[:id])
  end

  def edit
    @service_configuration = ServiceConfiguration.find(params[:id])
  end

  def update
    @service_configuration = ServiceConfiguration.find(params[:id])

    if @service_configuration.update(service_configuration_params)
      redirect_to @service_configuration
    else
      render 'edit'
    end
  end

  def destroy
    @service_configuration = ServiceConfiguration.find(params[:id])
    @service_configuration.destroy
    redirect_to @service_configuration.blueprint_version
  end

  def reload_variables
    @service_configuration = ServiceConfiguration.find(params[:id])
    @service_configuration.load_variables
    # @service_configuration.save
      render 'show'
  end

private

  def service_configuration_params
    params.require(:service_configuration).permit!
  end

end
