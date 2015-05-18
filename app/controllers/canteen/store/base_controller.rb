module Canteen
  class Store::BaseController < ApplicationController

    layout 'application'
    
    private

    # Check resource params are present based on the current controller name.
    def check_resource_params(options = {})

      # Determine the name based on the current controller if not specified.
      resource_name = options[:name] || controller_name.singularize

      # Determine the class based on the resource name if not provided.
      #FIXME: Do not hardcode engine name
      resource_class = options[:class] || "Canteen::#{resource_name.singularize.camelize}".classify.constantize
      

      unless params.key?(resource_name)
        notify :error, ::I18n.t('messages.resource.missing_parameters',
          :type     => resource_class.model_name.human
        )

        case action_name.to_sym
        when :create
          redirect_to :action => :new
        when :update
          redirect_to :action => :edit, :id => params[:id]
        else
          redirect_to :action => :index
        end
      end
    end

    # Load the relevant resource based on the current controller name.
    def load_resource(options = {})

      # Determine the name based on the current controller if not specified.
      resource_name = options[:name] || controller_name.singularize

      # Determine the class based on the resource name if not provided.
      # FIXME: Do not hard code engine name 
      resource_class = options[:class] || "Canteen::#{resource_name.singularize.camelize}".classify.constantize

      resource = resource_class.find(params[:id])

      # Set an instance variable @resource_name to the resource.
      instance_variable_set("@#{resource_name}", resource)

      rescue Mongoid::Errors::DocumentNotFound => e
      notify :error, ::I18n.t('messages.resource.not_found',
        :type     => resource_class.model_name.human,
        :criteria => resource_class.human_attribute_name(:id),
        :value    => params[:id]
      )
      redirect_to :action => :index
    end

    # Load all relevant resources based on the current controller name.
    def load_resources(options = {})

      # Determine the name based on the current controller if not specified.
      resource_name = options[:name] || controller_name.pluralize

      # Set an instance variable @name to contain the names for this user.
      #FIXME: Do not hard code Canteen here
      instance_variable_set("@#{resource_name}", "Canteen::#{resource_name.singularize.camelize}".classify.constantize.all)
    end
  end
end