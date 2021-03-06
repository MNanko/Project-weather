require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { birthdate: @student.birthdate, lastname: @student.lastname, name: @student.name }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should not save student in blank record" do
    assert_no_difference('Student.count') do
      post :create, student: { birthdate: nil, lastname: nil, name: nil }
    end
  end
  
  test "should raise error if name is missing" do
    record = Student.new
    record.name = '' # invalid state
    record.valid? # run validations
    assert_equal(record.errors[:name], ["can't be blank"]) # check for presence of error
  end
  
  
  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { birthdate: @student.birthdate, lastname: @student.lastname, name: @student.name }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should not update student if informations invalid" do
    record = Student.new
    record.name = @student.name
    patch :update, id: @student, student: { birthdate: @student.birthdate, lastname: @student.lastname, name: '' }
    assert_equal(record.name, @student.name)
  end
  
  
  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
