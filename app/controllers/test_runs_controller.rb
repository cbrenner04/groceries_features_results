# frozen_string_literal: true

# test runs controller
class TestRunsController < ApplicationController
  def index
    @test_runs = Result.test_runs
  end

  def show
    @test_run_results = Result.test_run(params[:id])
  end
end
