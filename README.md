# README

### Project Description
Project will use 2 seperate tables in the database to store information for Courses and Sections.

### How project was created

First run the following commands using terminal

```
rails new university
cd university
rails generate scaffold Course name:string department:string number:integer creditHour:integer
rails generate scaffold Section semester:string numnber:integer course:references room:integer
rails generate migration createJoinTableCourseSection course section 
```

Next modify the following files accordingly

/app/models/course.rd add the following code
```
has_many :sections
```

/app/models/section.rd add the following code
```
belongs_to :course
```

Now we need to update the database using the terminal command
```
rails db:migrate
```

Next we want to create a dropdown menu for courses in the section webpage

modify /app/views/section/_form.html.erb and replace the course form to reflect the following
```
<div class="field>
  <%= form.labal :course.id %>
  <%= form.collection_select :course_id, Course.order(:name),:id,:name,include_blank: true %>
</div>
```
            
modify app/controllers/section_controller.rb to reflect the name change
```
# Never trust parameters from the scary internet, only allow the white list through.
def section_params
  params.require(:section).permit(:semester, :number, :course_id, :room)
end
```

Finally change the form to reflect the changes

modify /app/views/sections/index.html.erb
```
<tbody>
  <% @sections.each.do |section| %>
    <tr>
      <td><%= section.semester %></td>
      <td><%= section.number %></td>
      <td><%= section.course.name %></td>
      <td><%= section.room %></td>
      <td><%= link_to 'Show', section %></td>
      <td><%= link_to 'Edit', edit_section_path(section) %></td>
      <td><%= link_to 'Destroy', section, method: :delete, data: { confirm: 'Are you sure?' }  %></td>
    </tr>
  <% end %>
</tbody>
```

Now run the program using
```
rails server
```

## Viewing the application

navigate to localhost:3000

You should see the 'Yay you're on Rails!' message. 

navigate to localhost:3000/courses

add some data in

navigate to localhost:3000/sections

add some data in
