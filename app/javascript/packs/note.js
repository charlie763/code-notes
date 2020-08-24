var counter = 0;

function add_topic(){
  counter += 1;
  var topic_field = document.createElement("input");
  topic_field.setAttribute("list", "topic_list");
  topic_field.setAttribute("class", "form-control form-control-2 my-1");
  topic_field.type = "text";
  topic_field.name = `note[topics_attributes][${counter}][name]`;
  topic_field.id = `note_topics_attributes_${counter}_name`;
  document.getElementById("note_topics_form_group").appendChild(topic_field);
}

document.getElementById("new_topic").addEventListener("click", add_topic);
