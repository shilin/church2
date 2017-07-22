const binding = () => {
  $('form.new_qna')
  .on(
    'ajax:success',
    (e, data, status, xhr) => { render_success(e, data, status, xhr) }
  )
  .on('ajax:error',
      (e, xhr, status, error) => { render_error(e, xhr, status, error) }
     )
      ;
};

const render_success = (e, data, status, xhr) => {
    let response = $.parseJSON(xhr.responseText);
    // let id = response.id;
    // let question = response.question;
    $('#flash').html(response.message);
    // console.log(`${id} + ${question}`);
};

const render_error = (e, xhr, status, error) => {
  $('#flash').html('');
  let errors = $.parseJSON(xhr.responseText).errors;
  $.each(errors, (item) => {
    errors[item].forEach( (errorMessage) => {
      $('#flash').append(`${item}:  ${errorMessage} <br>`);
    });
  }
        );
};

$(document).ready(binding); // "вешаем" функцию binding на событие document.ready

// $(document).ready(ready); // "вешаем" функцию ready на событие document.ready

$(document).on('page:load', binding);  //# "вешаем" функцию binding на событие page:load
$(document).on('page:update', binding); //# "вешаем" функцию binding на событие page:update
// $(document).on('page:load', ready)  //# "вешаем" функцию ready на событие page:load
// $(document).on('page:update', ready) //# "вешаем" функцию ready на событие page:update

