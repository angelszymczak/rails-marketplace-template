# frozen_string_literal: true

module Atoms
  module ServiceType
    class AnchorComponent < ViewComponent::Base
      attr_reader :href, :label_icon_url, :label_title, :anchor_icon_url

      def initialize(href:, label_icon_url:, label_title:, anchor_icon_url: "arrow-right.svg")
        @href = href
        @label_icon_url = label_icon_url
        @label_title = label_title
        @anchor_icon_url = anchor_icon_url
      end
    end
  end
end
