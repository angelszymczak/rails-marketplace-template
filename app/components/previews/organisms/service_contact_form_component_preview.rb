# @label Service Type
module Organisms
  class ServiceContactFormComponentPreview < ViewComponent::Preview
    # Default Molecules/Forms/ServiceTypeComponent
    # ---------------
    # Used to display a badge

    # Logged Out
    def default
      render Organisms::ServiceContactFormComponent.new(title: "¿Que tipo de servicio necesitas?") do
        # content
      end
    end

    # Logged In - As User
    def logged_in
      render Organisms::ServiceContactFormComponent.new(title: "¿Que tipo de servicio necesitas?", logged: true) do
      # content
      end
    end
  end
end
