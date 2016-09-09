require 'test_helper'

class SourceFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @source_file = source_files(:one)
  end

  test "should get index" do
    get source_files_url
    assert_response :success
  end

  test "should get new" do
    get new_source_file_url
    assert_response :success
  end

  test "should create source_file" do
    assert_difference('SourceFile.count') do
      post source_files_url, params: { source_file: {  } }
    end

    assert_redirected_to source_file_url(SourceFile.last)
  end

  test "should show source_file" do
    get source_file_url(@source_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_source_file_url(@source_file)
    assert_response :success
  end

  test "should update source_file" do
    patch source_file_url(@source_file), params: { source_file: {  } }
    assert_redirected_to source_file_url(@source_file)
  end

  test "should destroy source_file" do
    assert_difference('SourceFile.count', -1) do
      delete source_file_url(@source_file)
    end

    assert_redirected_to source_files_url
  end
end
