# frozen_string_literal: true

module Atoms
  module RadioInput
    class ServiceTypeComponent < ViewComponent::Base
      attr_reader :id, :label_title, :label_title_short, :description, :label_icon_url, :checked
      def initialize(
        id:,
        label_title:,
        label_title_short:,
        description:,
        label_icon_url:,
        checked: false
      )
        @id = id
        @label_title = label_title
        @label_title_short = label_title_short
        @description = description
        @label_icon_url = label_icon_url
        @checked = checked
      end

      private

      def input_name_key
        :service_type
      end
    end
  end
end
