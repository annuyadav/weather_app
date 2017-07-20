require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe 'GET #index' do
    context 'when format is html' do
      subject do
        get :index
      end

      before do
        subject
      end

      it 'should return 200 status' do
        expect(subject.status).to eq(200)
      end

      it 'should render the index page' do
        expect(subject).to render_template(:index)
      end
    end
    context 'when format is js' do
      subject do
        get :index
      end

      before do
        subject
      end

      it 'should return 200 status' do
        expect(subject.status).to eq(200)
      end

      it 'should render the index page' do
        expect(subject).to render_template(:index)
      end
    end

  end


  describe 'POST #location' do
    context 'when city and contry provided' do
      subject do
        xhr :post, :location, city: 'delhi', country: 'IN'
      end
      before do
        subject
      end

      it 'should return 200 status' do
        expect(subject.status).to eq(200)
      end

      it 'should render the location page' do
        expect(subject).to render_template(:location)
      end
    end

    context 'when no parameter provided' do
      subject do
        xhr :post, :location, city: '', country: ''
      end
      before do
        subject
      end

      it 'should return 200 status' do
        expect(subject.status).to eq(200)
      end

      it 'should return the flash error' do
        subject
        expect(flash[:error]).to eq ('Please enter some parameters to proceed')
      end

      it 'should render the index page' do
        expect(subject).to render_template(:index)
      end
    end
  end
end
