require 'rails_helper'

RSpec.describe "Work_Records", type: :request do
  before do
    @work_record = build(:work_record)
  end

  describe "Action test" do
    context "new" do
      it "access by user" do
        get "/v1/work_records"
        puts response.status
        @work_record.category_id = 1
        @work_record.user_id = 1
        @work_record.date_time = "2022-05-25T12:21:33.750Z"

        puts @work_record.category_id
        puts @work_record.user_id
        puts @work_record.date_time
        expect(response.status).to eq(200) 
      end
    end
  end
end
