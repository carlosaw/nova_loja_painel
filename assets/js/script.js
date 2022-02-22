$(function(){
  $('.p_new_image').on('click', function(e){
    e.preventDefault();

    $('.products_files_area').append('<input type="file" name="images[]" />');
  });
  
  // Tirar a imagem do produto do form
  $('.p_image a').on('click', function(){
    $(this).parent().remove();
  });
});