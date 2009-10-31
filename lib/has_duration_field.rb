module StarterStep
  class DurationField
    def initialize(seconds)
      @seconds = seconds
    end

    def to_years
      to_weeks / 52
    end

    def to_weeks
      to_days / 7
    end

    def to_days
      self.to_hours / 24
    end

    def to_hours
      to_seconds / 3600
    end

    def to_seconds
      @seconds
    end
  end


  module HasDurationField
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def has_duration_fields(fields)
         proxy_field fields, :as => StarterStep::DurationField
      end
    end
  end
end

ActiveRecord::Base.send(:include, StarterStep::HasDurationField)