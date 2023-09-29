class Admin::HomesController < ApplicationController
  def top
    @workouts = Workout.all
  end
end
