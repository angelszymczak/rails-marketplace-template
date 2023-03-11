# @label Basic Badge
class SitterSearchComponentPreview < ViewComponent::Preview
  # Default Molecules/Forms/SitterSearch
  # ---------------
  # Used to display a badge
  #
  def default(
    title: "¿Que tipo de servicio necesitas?"
  )
    render(Molecules::Forms::SitterSearchComponent.new(title:)) do
      # content
    end
  end
end
