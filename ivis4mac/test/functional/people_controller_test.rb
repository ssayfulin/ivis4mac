require 'test_helper'

class PeopleControllerTest < ActionController::TestCase





  setup do

    if @one.nil?
      puts "initialize"
      @one =  Person.new( :first_name =>"Vova",
                         :last_name =>"Ivanov",
                         :patronymic_name => "Ivanovich",
                         :birth_date => "2012-03-05")


    end


    @person =  @one     # @person.save()


    puts "do #{@person.first_name}"




  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: @person.attributes
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: @person.attributes
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
