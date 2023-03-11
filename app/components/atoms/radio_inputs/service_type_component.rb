# frozen_string_literal: true

module Atoms
  module RadioInputs
    class ServiceTypeComponent < ViewComponent::Base
      attr_reader :label_icon_url, :label_title, :label_title_short, :label_description
      def initialize(label_icon_url:, label_title:, label_title_short:, label_description:, checked: false)
        @label_icon_url = label_icon_url
        @label_title = label_title
        @label_title_short = label_title_short
        @label_description = label_description
        @checked = checked
      end

      def checked_variant
        @checked ? "--checked" : "--no-checked"
      end
    end
  end
end
