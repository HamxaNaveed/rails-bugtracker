// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
//= require jquery-ui
//= require jquery



$(".assign-btn").click(function () {
  let project_id = $(this).attr("data-project");
  let fix_id =  $(this).attr("data-fix");
  console.log(project_id)
  console.log(fix_id)
  $.ajax({
    url: `/projects/${project_id}/fixes/${fix_id}/assign`,
    type: "PUT",
    dataType: "json",
    success: function (data) {
      console.log(data);
      $("#assign-"+fix_id).hide();
      $("#completed-"+fix_id).removeAttr('hidden');
      $("#block-"+fix_id).html("<p>Assigned to: "+data+"</p>");
    },
    error: function () {
      console.log("failure");
    },
  });
});

$(".completed-btn").click(function () {
  let project_id = $(this).attr("data-project");
  let fix_id =  $(this).attr("data-fix");
  console.log(project_id)
  console.log(fix_id)
  $.ajax({
    url: `/projects/${project_id}/fixes/${fix_id}/complete`,
    type: "PUT",
    dataType: "json",
    success: function (data) {
      console.log(data);
      $("#completed-"+fix_id).hide();
      $("#complete-block-"+fix_id).html("<p>Completed: true</p>");
    },
    error: function () {
      console.log("failure");
    },
  });
});
