module Organisms
  class ServiceContactFormComponent < ViewComponent::Base
    attr_reader :title, :logged

    def initialize(title:, logged: false)
      @title = title
      @logged = logged
    end
  end
end
