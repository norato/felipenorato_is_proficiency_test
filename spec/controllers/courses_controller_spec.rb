require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  context 'GET #index' do
    let!(:courses) { Array.new(3) { create :course } }
    before do
      get :index
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
    it { should assign_to(:courses) }
  end

  describe "GET #new" do
    before do
      get :new
    end
    it { should assign_to(:course) }
  end

  context 'POST #create' do
    it { should permit().for(:create) }
    let!(:params) { FactoryGirl.attributes_for(:course) }
    before do
      expect(Course.count).to eql(0)
      post :create, course: params
    end
    it { expect(Course.count).to eql(1) }
    it { is_expected.to redirect_to :courses }
    it { is_expected.to respond_with 302 }
  end

  context 'GET #show' do
    let!(:course) { create :course }
    before do
      get :show, id: course
    end
    it { should assign_to(:course) }
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
  end

  describe 'PUT #update' do
    let!(:course) { create :course, name: 'Course1', description: 'Description1', status: 1 }
    context 'valid attributes' do
      it 'located the requested @course' do
        put :update, id: course, course: FactoryGirl.attributes_for(:course)
        assigns(:course).should eq(course)
      end
      context "changes @course's attributes" do
        before do
          put :update, id: course,
          course: FactoryGirl.attributes_for(:course, name: 'Course2', description: 'Description2', status: 0)
          course.reload
        end
        it { course.name.should eq('Course2') }
        it { course.description.should eq('Description2') }
        it { course.status.should eq(0) }
      end
    end

    context "invalid attributes" do
      it "locates the requested @course" do
        put :update, id: course, course: FactoryGirl.attributes_for(:invalid_course)
        assigns(:course).should eq(course)
      end

      context "does not change @course's attributes" do
        before do
          put :update, id: course,
          course: FactoryGirl.attributes_for(:course, name: 'Course2', description: 'Description2', status: nil)
          course.reload
        end
        it { course.name.should_not eq('Course2') }
        it { course.description.should_not eq('Description2') }
        it { course.status.should_not eq(nil) }
        it { course.name.should eq('Course1') }
        it { course.description.should eq('Description1') }
        it { course.status.should eq(1) }
      end

      it "re-renders the edit method" do
        put :update, id: course, course: FactoryGirl.attributes_for(:invalid_course)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:course) { create :course }
    before :each do
      delete :destroy, id: course
    end

    it "deletes the course" do
      expect{ Course.count }.to change(Course,:count).by(0)
    end

    it { is_expected.to redirect_to :courses }
  end
end
