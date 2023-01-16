# frozen_string_literal: true

require 'active_support/concern'

module Kaminari
  module ConfigurationMethods

    extend ActiveSupport::Concern

    module ClassMethods
      # Overrides the default `per_page` value per model
      #
      # @example
      #   class Article < ActiveRecord::Base
      #     paginates_per 10
      #   end
      #
      # @param val [Integer]
      # @return [void]
      def paginates_per(val)
        @_default_per_page = val
      end

      # This model's default `per_page` value
      #
      # @return [Integer] `default_per_page` value unless explicitly overridden via `paginates_per`
      def default_per_page
        (defined?(@_default_per_page) && @_default_per_page) || Kaminari.config.default_per_page
      end

      # Overrides the max `per_page` value per model
      #
      # @example
      #   class Article < ActiveRecord::Base
      #     max_paginates_per 100
      #   end
      #
      # @param val [Integer]
      # @return [void]
      def max_paginates_per(val)
        @_max_per_page = val
      end

      # This model's max +per_page+ value
      # @return [Integer] `max_per_page` value unless explicitly overridden via `max_paginates_per`
      def max_per_page
        (defined?(@_max_per_page) && @_max_per_page) || Kaminari.config.max_per_page
      end

      # Overrides the `max_pages` value per model when a value is given
      #
      # @example
      #   class Article < ActiveRecord::Base
      #     max_pages 100
      #   end
      #
      # Also returns this model's `max_pages` value (globally configured
      # `max_pages` value unless explicitly overridden) when no value is given
      def max_pages(val = :none)
        if val == :none
          # getter
          (defined?(@_max_pages) && @_max_pages) || Kaminari.config.max_pages
        else
          # setter
          @_max_pages = val
        end
      end

      # @deprecated Use {#max_pages} instead.
      # @raise [ActiveSupport::Deprecation] this method is deprecated
      def max_pages_per(val)
        ActiveSupport::Deprecation.warn 'max_pages_per is deprecated. Use max_pages instead.'
        max_pages val
      end
    end
  end
end
