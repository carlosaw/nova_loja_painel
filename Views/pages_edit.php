<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Páginas
  </h1>
</section>

<!-- Main content -->
<section class="content container-fluid">

  <form method="POST" action="<?php echo BASE_URL; ?>pages/edit_action/<?php echo $info['id']; ?>">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Editar Página</h3>
        <div class="box-tools">
          <input type="submit" class="btn btn-success" value="Salvar" />
        </div>
      </div>
      <div class="box-body">

        <div class="form-group <?php echo (in_array('title', $errorItems))?'has-error':''; ?>">
          <label for="page_title">Título da página</label>
          <input type="text" class="form-control" id="page_title" name="title" value="<?php echo $info['title']; ?>" />
        </div>

        <div class="form-group <?php echo (in_array('body', $errorItems))?'has-error':''; ?>">
          <label for="page_body">Corpo da página</label>
          <textarea id="page_body" name="body"><?php echo $info['body']; ?></textarea>
        </div>
        <!--<?php echo $info['body']; ?>-->

      </div>
    </div>
  </form>
</section>
<!-- /.content -->
<script src="https://cdn.tiny.cloud/1/b8gw40se0avjxpl01h65q1uiivhhk4kwkblmowmkfymls3pa/tinymce/5/tinymce.min.js"
  referrerpolicy="origin"></script>
<script type="text/javascript">
  tinymce.init({
    selector: '#page_body',
    height: 500,
    menubar: false,
    plugins: [
    'image media lists'
  ],
  toolbar: 'undo redo | formatselect | bold italic backcolor | media image | alignleft aligncenter alignright alignjustify | bullist numlist | removeformat',

  automatic_uploads: true,
  file_picker_types: 'image',
  images_upload_url: '<?php echo BASE_URL; ?>pages/upload'

});
</script>