$(document).on('ready page:load', function(){
  $('#new_contact').validate({
    rules:{
      "contact[first_name]": {
        required: true
      },
      "contact[last_name]": {
        required: true
      },
      "contact[email]": {
        required: true,
        email: true
      },
      "contact[phone]":{
        required: true
      },
      "contact[message]":{
        required: true
      }
    },
    messages:{
      "contact[first_name]":{
        required: "姓を入力してください。"
      },
      "contact[last_name]":{
        required: "名を入力してください。"
      },
      "contact[email]":{
        required: "メールIDを入力してください。",
        email: "有効なメールアドレスを入力してください。"
      },
      "contact[phone]":{
        required: "少なくても一つ本人確認画像をアップロードしてください。"
      },
      "contact[message]":{
        required: "少なくても一つ本人確認画像をアップロードしてください。"
      }
    },
    highlight: function(element) {
      $(element).closest('.form-group').addClass('has-error');
    },
    unhighlight: function(element) {
      $(element).closest('.form-group').removeClass('has-error');
    },
    errorPlacement: function(error, element) {
      if(element.parent('.input-group').length) {
          error.insertAfter(element.parent());
      } else {
          error.insertAfter(element);
      }
    }
  });
});