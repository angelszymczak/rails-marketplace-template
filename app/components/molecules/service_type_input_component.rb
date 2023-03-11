# frozen_string_literal: true

module Molecules
  class ServiceTypeInputComponent < ViewComponent::Base
    attr_reader :label

    def initialize(label:)
      @label = label
    end
  end
end
