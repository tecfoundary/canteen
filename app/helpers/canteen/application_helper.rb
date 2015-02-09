module Canteen
  module ApplicationHelper

    def body_class
      params[:controller].include?('devise') ? 'bg-black' : 'skin-blue'
    end

    def root_path
      '/'
    end

    def active_link?(path)
      current_page? path
    end

    def active?(options = {})
      logger.debug "Setting active class for div with paths - #{options}"

      options.each do |o|
        case
        when current_page?(o)
          return :active
        end
      end

    end

  end
end
