var counter = 0;

function add_topic(){
  counter += 1;
  var topic_field = document.createElement("input");
  topic_field.list = "topic_list";
  topic_field.class = "form-control";
  topic_field.type = "text";
  topic_field.name = `note[topics_attributes][${counter}][name]`;
  topic_field.id = `note_topics_attributes_${counter}_name`;
  document.getElementById("note_topics_form_group").appendChild(topic_field);
  console.log(topic_field);
}

document.getElementById ("new_topic").addEventListener ("click", add_topic);

{/* <input list="topic_list" class="form-control" type="text" name="note[topics_attributes][0][name]" id="note_topics_attributes_0_name"></input> */}

// var f = document.createElement("form");
// f.setAttribute('method',"post");
// f.setAttribute('action',"submit.php");

// //create input element
// var i = document.createElement("input");
// i.type = "text";
// i.name = "user_name";
// i.id = "user_name1";

// //create a checkbox
// var c = document.createElement("input");
// c.type = "checkbox";
// c.id = "checkbox1";
// c.name = "check1";

// //create a button
// var s = document.createElement("input");
// s.type = "submit";
// s.value = "Submit";

// // add all elements to the form
// f.appendChild(i);
// f.appendChild(c);
// f.appendChild(s);

// // add the form inside the body
// $("body").append(f);   //using jQuery or
// document.getElementsByTagName('body')[0].appendChild(f); //pure javascript