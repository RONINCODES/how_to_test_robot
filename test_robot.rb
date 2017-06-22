require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test



  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot = Robot.new #setup instance of new robot
    @robot.needs_repairs = true
    @robot.foreign_model = true

    # act
    station = @robot.station


    # assert
    assert_equal(station, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    @robot = Robot.new #setup instance of new robot
    @robot.needs_repairs = true
    @robot.vintage_model = true

    # act
    station = @robot.station

    # assert
    assert_equal(station, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    @robot = Robot.new #setup instance of new robot
    @robot.needs_repairs = true
    @robot.vintage_model = false
    @robot.foreign_model = false


    # act
    station = @robot.station

    # assert
    assert_equal(station, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    @robot = Robot.new #setup instance of new robot
    @robot.needs_repairs = false
    @robot.vintage_model = false
    @robot.foreign_model = false

    # act
    station = @robot.station

    # assert
    assert_equal(station, 4)

  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    @robot = Robot.new
    @robot.todos = []

    # act
    task_priority = @robot.prioritize_tasks

    # assert
    assert_equal(task_priority, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange

    @robot = Robot.new
    @robot.todos = [1,2,5]

    # act
    task_priority = @robot.prioritize_tasks

    # assert
    assert_equal(task_priority, @robot.todos.max)

  end

  def test_workday_on_day_off_returns_true

    # arrange
    @robot = Robot.new
    @robot.day_off = 'Friday'

    # act
    work = @robot.workday?('Monday')

    # assert
    assert_equal(work,true)
  end

  def test_workday_not_day_off_returns_false

    # arrange
    @robot = Robot.new
    @robot.day_off = 'Tuesday'

    # act
    work = @robot.workday?('Tuesday')

    # assert
    assert_equal(work,false)
  end

end
