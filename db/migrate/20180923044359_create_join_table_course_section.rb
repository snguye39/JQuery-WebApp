class CreateJoinTableCourseSection < ActiveRecord::Migration[5.2]
  def change
    create_join_table :courses, :sections do |t|
      # t.index [:course_id, :section_id]
      # t.index [:section_id, :course_id]
    end
  end
end
