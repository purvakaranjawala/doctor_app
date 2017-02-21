require 'test_helper'

class DiseaseInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @disease_info = disease_infos(:one)
  end

  test "should get index" do
    get disease_infos_url
    assert_response :success
  end

  test "should get new" do
    get new_disease_info_url
    assert_response :success
  end

  test "should create disease_info" do
    assert_difference('DiseaseInfo.count') do
      post disease_infos_url, params: { disease_info: { doctor_id: @disease_info.doctor_id, patient_id: @disease_info.patient_id, patient_type: @disease_info.patient_type, symptom_time: @disease_info.symptom_time, symptoms: @disease_info.symptoms } }
    end

    assert_redirected_to disease_info_url(DiseaseInfo.last)
  end

  test "should show disease_info" do
    get disease_info_url(@disease_info)
    assert_response :success
  end

  test "should get edit" do
    get edit_disease_info_url(@disease_info)
    assert_response :success
  end

  test "should update disease_info" do
    patch disease_info_url(@disease_info), params: { disease_info: { doctor_id: @disease_info.doctor_id, patient_id: @disease_info.patient_id, patient_type: @disease_info.patient_type, symptom_time: @disease_info.symptom_time, symptoms: @disease_info.symptoms } }
    assert_redirected_to disease_info_url(@disease_info)
  end

  test "should destroy disease_info" do
    assert_difference('DiseaseInfo.count', -1) do
      delete disease_info_url(@disease_info)
    end

    assert_redirected_to disease_infos_url
  end
end
