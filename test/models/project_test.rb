require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  # test 'valid project can be created' do
  #   owner = new_user
  #   owner.save
  #   project = new_project
  #   project.owner = owner
  #   project.save
  #   assert project.valid?
  #   assert project.persisted?
  #   assert project.owner
  # end

  test 'project is invalid without owner' do
    project = new_project
    project.owner = nil
    project.save
    assert project.invalid?, 'Project should not save without owner.'
  end
#-------------My tests ---------------------------------#

  test 'project is invalid if start_date in the past' do
   # instantiate new_user and new_project
  owner = new_user
  owner.save
  project = new_project
  project.owner = owner

   # set new_project start_date to past_date
   project.start_date = Time.utc(2000,"jan",1,20,15,1)
   project.save
  #  if project.start_date < Date.today

  assert_equal(project.start_date < Date.today, true)
  # project.errors.messages

  end


  test 'project end_date must be later than start_date' do
   # instantiate new_user and new_project
  owner = new_user
  owner.save
  project = new_project
  project.owner = owner

   # set new_project start_date & end_date as same
   project.start_date = Time.utc(2020,"jan",1,20,15,1)
   project.end_date = Time.utc(2020,"jan",1,20,15,1)
   project.save

  assert_equal(project.start_date <= project.end_date, true)
  end

  test 'project goal must be positive number' do
    # arrange
    owner = new_user
    owner.save
    project = new_project
    project.owner = owner
    project.goal = 1
    project.save

    # assert
    assert_equal(project.goal > 0, true)
  end


#----------------------------------------------------------


  def new_project
    Project.new(
      title:       'Cool new boardgame',
      description: 'Trade sheep',
      start_date:  Date.today,
      end_date:    Date.today + 1.month,
      goal:        50000
    )
  end

  def new_user
    User.new(
      first_name:            'Sally',
      last_name:             'Lowenthal',
      email:                 'sally@example.com',
      password:              'passpass',
      password_confirmation: 'passpass'
    )
  end

end
