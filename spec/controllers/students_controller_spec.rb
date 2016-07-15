require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  context 'GET #index' do
    let!(:students) { Array.new(3) { create :student } }
    before do
      get :index
    end
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
    it { should assign_to(:students) }
  end

  describe "GET #new" do
    before do
      get :new
    end
    it { should assign_to(:student) }
  end

  context 'POST #create' do
    it { should permit().for(:create) }
    let!(:params) { FactoryGirl.attributes_for(:student) }
    before do
      expect(Student.count).to eql(0)
      post :create, student: params
    end
    it { expect(Student.count).to eql(1) }
    it { is_expected.to redirect_to :students }
    it { is_expected.to respond_with 302 }
  end

  context 'GET #show' do
    let!(:student) { create :student }
    before do
      get :show, id: student
    end
    it { should assign_to(:student) }
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
  end

  describe 'PUT #update' do
    let!(:student) { create :student, name: 'Student1', register_name: 'Register_name1', status: 1 }
    context 'valid attributes' do
      it 'located the requested @student' do
        put :update, id: student, student: FactoryGirl.attributes_for(:student)
        assigns(:student).should eq(student)
      end
      context "changes @student's attributes" do
        before do
          put :update, id: student,
          student: FactoryGirl.attributes_for(:student, name: 'Student2', register_name: 'Register_name2', status: 0)
          student.reload
        end
        it { student.name.should eq('Student2') }
        it { student.register_name.should eq('Register_name2') }
        it { student.status.should eq(0) }
      end
    end

    context "invalid attributes" do
      it "locates the requested @student" do
        put :update, id: student, student: FactoryGirl.attributes_for(:invalid_student)
        assigns(:student).should eq(student)
      end

      context "does not change @student's attributes" do
        before do
          put :update, id: student,
          student: FactoryGirl.attributes_for(:student, name: 'Student2', register_name: 'Register_name2', status: nil)
          student.reload
        end
        it { student.name.should_not eq('Student2') }
        it { student.register_name.should_not eq('Register_name2') }
        it { student.status.should_not eq(nil) }
        it { student.name.should eq('Student1') }
        it { student.register_name.should eq('Register_name1') }
        it { student.status.should eq(1) }
      end

      it "re-renders the edit method" do
        put :update, id: student, student: FactoryGirl.attributes_for(:invalid_student)
        response.should render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:student) { create :student }
    before :each do
      delete :destroy, id: student
    end

    it "deletes the student" do
      expect{ Student.count }.to change(Student,:count).by(0)
    end

    it { is_expected.to redirect_to :students }
  end
end
