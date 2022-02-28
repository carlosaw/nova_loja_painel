<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>
    Avaliações
  </h1>
</section>

<!-- Main content -->
<section class="content container-fluid">

  <form method="POST" action="<?php echo BASE_URL; ?>products/add_action_rates">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">Nova Avaliação</h3>
        <div class="box-tools">
          <input type="submit" class="btn btn-success" value="Salvar" />
        </div>
      </div>
      <div class="box-body">

      <input type="hidden" class="form-control" id="product_name" name="p_name" value="<?php echo $id_product; ?>" />

      <label for="user_name">Usuário</label>
      <input type="number" class="form-control" id="user_name" name="u_name" />
      <label for="points">Pontos</label>

      <input type="text" class="form-control" id="points" name="points" />
      <label for="comments">Comentário</label>

      <textarea type="text" class="form-control" id="comments" name="comments"></textarea>
      </div>
    </div>
  </form>
</section>
<!-- /.content -->