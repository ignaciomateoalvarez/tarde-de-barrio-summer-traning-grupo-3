require 'rails_helper'

RSpec.describe 'Students', type: :request do
  describe 'students' do
    describe 'POST /students' do
      let(:params) do
        {
          student: {
            name: 'John',
            lastname: 'Doe',
            birthday: '06-04-2021',
            address: 'calle falsa 123',
            school_grade: 'inicial',
            currently_studying: true
          }
        }
      end

      before do
        post('/students', params:)
      end

      context 'when params are valid' do
        it 'creates a new student' do
          expect(response).to have_http_status(302)
        end
      end

      context 'when params are not valid' do
        let(:params) do
          {
            student: {
              name: '',
              lastname: 'Doe',
              birthday: '06-04-2021',
              address: 'calle falsa 123',
              school_grade: 'inicial',
              currently_studying: true
            }
          }
        end

        it 'does not create a new student with invalid params' do
          expect(response).to have_http_status(302)
        end
      end
    end

    describe 'PUT /students/:id' do
      let(:edit_params) do
        {
          student: {
            name: 'pepito'
          }
        }
      end
      it 'edit student with new params' do
        put('/student', params: edit_params)
        expect(response).to have_http_status(302)
      end
    end

    it 'show student have correct student id' do
      student = Student.create(name: 'pepito', lastname: 'grillo')
      get :show, params: { id: student.to_param }
      expect(response).to have_http_status(200)
    end

    it 'index student' do
      before do
        let(:students_list) [create_list(:student, 10)]
      end
      expect(assigns(:students_list).count).to eq 10
      expect(response).to have_http_status(200)
    end

    describe 'comment' do
      let(:user) { FactoryBot.create(:user) }
      let(:student) { FactoryBot.create(:student) }
      let(:comment) { FactoryBot.create(:comment, body: 'pepito', student_id: student.id, user_id: user.id) }
      it 'is valid' do
        expect(comment).to be_valid
      end
      it 'comment associated correct user' do
        expect(comment.user).to eql(user)
      end
      it 'comment associated correct student' do
        expect(comment.student).to eql(student)
      end
    end

    describe 'show student comment' do
      let(:user) { FactoryBot.create(:user) }
      let(:student) { FactoryBot.create(:student) }
      let(:comment) { FactoryBot.create(:comment, body: 'pepito', student_id: student.id, user_id: user.id) }
      it 'show comment have correct show id' do
        get :show, params: { id: comment.student_id.to_param }
        debugger
        expect(response).to have_http_status(200)
      end
    end
  end
end
