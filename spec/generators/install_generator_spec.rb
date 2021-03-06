# frozen_string_literal: true

require "spec_helper"
require "generators/action_policy/install/install_generator"

describe ActionPolicy::Generators::InstallGenerator, type: :generator do
  destination File.expand_path("../../tmp", __dir__)

  before do
    prepare_destination
    run_generator
  end

  describe "application policy" do
    subject { file("app/policies/application_policy.rb") }

    specify do
      is_expected.to exist
      is_expected.to contain(/class ApplicationPolicy < ActionPolicy::Base/)
    end
  end
end
