const binding = () => {
  $('form.new_qna').on(
    'ajax:success',
    (e, data, status, xhr) => { render_success(e, data, status, xhr) }
  );
};

const render_success = (e, data, status, xhr) => {
    let response = $.parseJSON(xhr.responseText);
    // let id = response.id;
    // let question = response.question;
    $('#flash').html(response.message);
    // console.log(`${id} + ${question}`);
};
/*
const render_error = (e, xhr, status, error) => {
    $('#flash').html('')
    errors = $.parseJSON(xhr.responseText)
    $.each errors, (index, value) ->
      $('#flash').append(value + "</br>")
      console.log(value)
};
*/

$(document).ready(binding); // "вешаем" функцию binding на событие document.ready

// $(document).ready(ready); // "вешаем" функцию ready на событие document.ready

$(document).on('page:load', binding);  //# "вешаем" функцию binding на событие page:load
$(document).on('page:update', binding); //# "вешаем" функцию binding на событие page:update
// $(document).on('page:load', ready)  //# "вешаем" функцию ready на событие page:load
// $(document).on('page:update', ready) //# "вешаем" функцию ready на событие page:update

