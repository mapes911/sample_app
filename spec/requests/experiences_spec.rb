require 'spec_helper'

describe "Experiences" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "index" do
    before { visit experiences_path }

    it { should have_title('Latest Shared Experiences') }

    describe "pagination" do

      before(:all) { 40.times { FactoryGirl.create(:experience) } }
      after(:all)  { Experience.delete_all }

      it { should have_selector('div.pagination') }

      it "should list each experience" do
        Experience.paginate(page: 1).each do |experience|
          page.should have_selector('li', text: experience.title)
        end
      end
    end

  end

  describe "experience creation" do
    before { visit new_experience_path }

    describe "with invalid information" do
      it "should not create an experience" do
        expect { click_button "Create Experience" }.not_to change(Experience, :count)
      end
      describe "error messages" do
        before { click_button "Create Experience" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do 
        fill_in 'experience_title', with: "Lorem ipsum" 
        fill_in 'experience_moral', with: "Lorem ipsum" 
      end
      it "should create an experience" do
        expect { click_button "Create Experience" }.to change(Experience, :count).by(1)
      end
    end

  end

  # describe "experience destruction" do
  #   before { FactoryGirl.create(:experience, user: user) }

  #   describe "as correct user" do
  #     before { visit somewhere }

  #     it "should delete a experience" do
  #       expect { click_link "delete" }.to change(Experience, :count).by(-1)
  #     end
  #   end
  # end

  describe "experiene page" do
    let!(:exp1) { FactoryGirl.create(:experience, user: user, title: "I sailed across the Atlantic in a small craft!") }

    before { visit experience_path(exp1) }

    describe "experience" do
      it { should have_header(exp1.title) }
    end
  end

end
