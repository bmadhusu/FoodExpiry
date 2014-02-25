require 'spec_helper'

describe "Static Pages"

	describe "Home page" do

	  it "should have the content 'Eat Me Now'" do
	    visit '/static_pages/home'
	    expect(page).to have_content('Eat Me Now')
	  end

	  it "should have the base title" do
      	visit '/static_pages/home'
      	expect(page).to have_title("Eat Me NOW!")
      end

	end


	describe "Help page" do

		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end

		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("Eat Me NOW! | Help")
		end
	end

	describe "About page" do

		it "should have the content 'About Us'" do
			visit '/static_pages/about'
			expect(page).to have_content('About')
		end

		it "should have the title 'About'" do
			visit '/static_pages/about'
			expect(page).to have_title("Eat Me NOW! | About")
		end

	end

	describe "Contact page" do

		it "should have the content 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_content('Contact')
		end

		it "should have the title 'Contact'" do
			visit '/static_pages/contact'
			expect(page).to have_title("Eat Me NOW! | Contact")
		end
	end



