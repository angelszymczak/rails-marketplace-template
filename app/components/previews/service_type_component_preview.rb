# @label Service Type
class ServiceTypeComponentPreview < ViewComponent::Preview
  # Default Molecules/Forms/ServiceTypeComponent
  # ---------------
  # Used to display a badge
  #
  def default(
    title: "¿Que tipo de servicio necesitas?"
  )
    render(Molecules::Form::ServiceTypeComponent.new) do
      # content
    end
  end
end
